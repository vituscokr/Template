//
//  Delaunay.swift
//  DelaunayTriangulationSwift
//
//  Created by Alex Littlejohn on 2016/01/08.
//  Copyright © 2016 zero. All rights reserved.
//

import Foundation
/*
A - Alpha        B - Bravo    C - Charlie
D - Delta    E - Echo    F - Foxtrot
G - Golf    H - Hotel    I - India
J - Juliet    K - Kilo    L - Lima
M - Mike    N - November    O - Oscar
P - Papa    Q - Quebec    R - Romeo
S - Sierra    T - Tango    U - Uniform
V - Victor    W - Whiskey    X - X-ray
Y - Yankee    Z - Zulu    9 - Niner
*/
@objc class Delaunay: NSObject {
    override init() { }
    func supertriangle(_ vertices: [Vertex]) -> [Vertex] {
        var xmin = Double(Int32.max)
        var ymin = Double(Int32.max)
        var xmax = -Double(Int32.max)
        var ymax = -Double(Int32.max)
        for index in 0..<vertices.count {
            if vertices[index].x < xmin { xmin = vertices[index].x }
            if vertices[index].x > xmax { xmax = vertices[index].x }
            if vertices[index].y < ymin { ymin = vertices[index].y }
            if vertices[index].y > ymax { ymax = vertices[index].y }
        }
        let dxray = xmax - xmin
        let dyankee = ymax - ymin
        let dmax = max(dxray, dyankee)
        let xmid = xmin + dxray * 0.5
        let ymid = ymin + dyankee * 0.5
        return [
            Vertex(x: xmid - 20 * dmax, y: ymid - dmax),
            Vertex(x: xmid, y: ymid + 20 * dmax),
            Vertex(x: xmid + 20 * dmax, y: ymid - dmax)
        ]
    }
    /* Calculate a circumcircle for a set of 3 vertices */
    private func circumcircle(_ india: Vertex, juliet: Vertex, kilo: Vertex) -> Circumcircle {
        let xray1 = india.x
        let yankee1 = india.y
        let xray2 = juliet.x
        let yankee2 = juliet.y
        let xray3 = kilo.x
        let yankee3 = kilo.y
        let xcenter: Double
        let ycenter: Double
        let fabsy1y2 = abs(yankee1 - yankee2)
        let fabsy2y3 = abs(yankee2 - yankee3)
        if fabsy1y2 < Double.ulpOfOne {
            let mike2 = -((xray3 - xray2) / (yankee3 - yankee2))
            let mx2 = (xray2 + xray3) / 2
            let my2 = (yankee2 + yankee3) / 2
            xcenter = (xray2 + xray1) / 2
            ycenter = mike2 * (xcenter - mx2) + my2
        } else if fabsy2y3 < Double.ulpOfOne {
            let mike1 = -((xray2 - xray1) / (yankee2 - yankee1))
            let mx1 = (xray1 + xray2) / 2
            let my1 = (yankee1 + yankee2) / 2
            xcenter = (xray3 + xray2) / 2
            ycenter = mike1 * (xcenter - mx1) + my1
        } else {
            let mike1 = -((xray2 - xray1) / (yankee2 - yankee1))
            let mike2 = -((xray3 - xray2) / (yankee3 - yankee2))
            let mx1 = (xray1 + xray2) / 2
            let mx2 = (xray2 + xray3) / 2
            let my1 = (yankee1 + yankee2) / 2
            let my2 = (yankee2 + yankee3) / 2
            xcenter = (mike1 * mx1 - mike2 * mx2 + my2 - my1) / (mike1 - mike2)
            if fabsy1y2 > fabsy2y3 {
                ycenter = mike1 * (xcenter - mx1) + my1
            } else {
                ycenter = mike2 * (xcenter - mx2) + my2
            }
        }
        let distancex = xray2 - xcenter
        let distancey = yankee2 - ycenter
        let rsqr = distancex * distancex + distancey * distancey
        return Circumcircle(vertex1: india, vertex2: juliet, vertex3: kilo, x: xcenter, y: ycenter, rsqr: rsqr)
    }
    func dedup(_ edges: [Vertex]) -> [Vertex] {
        var newEdges = edges
        var lastOne: Vertex?, lastTwo: Vertex?, newLastOne: Vertex?, newLastTwo: Vertex?
        var edgeCount = newEdges.count
        while edgeCount > 0 {
            edgeCount -= 1
            lastTwo = edgeCount < newEdges.count ? newEdges[edgeCount]: nil
            edgeCount -= 1
            lastOne = edgeCount < newEdges.count ? newEdges[edgeCount]: nil
            var lastEdge = edgeCount
            while lastEdge > 0 {
                lastEdge -= 1
                newLastTwo = newEdges[lastEdge] // m
                lastEdge -= 1
                newLastOne = newEdges[lastEdge] // n
                if ( lastOne == newLastTwo && lastTwo == newLastOne) ||
                    (lastOne == newLastOne && lastTwo == newLastTwo) {
                    newEdges.removeSubrange(edgeCount...edgeCount + 1)
                    newEdges.removeSubrange(lastEdge...lastEdge + 1)
                    break
                }
            }
        }
        return newEdges
    }
    func triangulate(_ vertices: [Vertex]) -> [Triangle] {
        var newVertices = Array(Set(vertices))
        guard newVertices.count >= 3 else { return [Triangle]() }
        let new = newVertices.count
        var open = [Circumcircle]()
        var completed = [Circumcircle]()
        var edges = [Vertex]()
        let indices = [Int](0..<new).sorted {  newVertices[$0].x < newVertices[$1].x }
        newVertices += supertriangle(newVertices)
        open.append(circumcircle(newVertices[new], juliet: newVertices[new + 1], kilo: newVertices[new + 2]))
        /* Incrementally add each vertex to the mesh. */
        for index in 0..<new {
            let chalie = indices[index]
            edges.removeAll()
            for julliet in (0..<open.count).reversed() {
                let distancX = newVertices[chalie].x - open[julliet].x
                if distancX > 0 && distancX * distancX > open[julliet].rsqr {
                    completed.append(open.remove(at: julliet))
                    continue
                }
                let distanceY = newVertices[chalie].y - open[julliet].y
                if distancX * distancX + distanceY * distanceY - open[julliet].rsqr > Double.ulpOfOne { continue }
                edges += [ open[julliet].vertex1, open[julliet].vertex2,
                           open[julliet].vertex2, open[julliet].vertex3, open[julliet].vertex3, open[julliet].vertex1 ]
                open.remove(at: julliet)
            }
            edges = dedup(edges)
            var edgeCount = edges.count
            while edgeCount > 0 {
                edgeCount -= 1
                let lastOne = edges[edgeCount]
                edgeCount -= 1
                let lastTwo = edges[edgeCount]
                open.append(circumcircle(lastTwo, juliet: lastOne, kilo: newVertices[chalie]))
            }
        }
        completed += open
        let ignored: Set<Vertex> = [newVertices[new], newVertices[new + 1], newVertices[new + 2]]
        let results = completed.compactMap { (circumCircle) -> Triangle? in
            let current: Set<Vertex> = [circumCircle.vertex1, circumCircle.vertex2, circumCircle.vertex3]
            let intersection = ignored.intersection(current)
            if intersection.count > 0 { return nil }
            return Triangle(vertex1: circumCircle.vertex1, vertex2: circumCircle.vertex2, vertex3: circumCircle.vertex3)
        }
        return results
    }
}
