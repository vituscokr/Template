//
//  GraphView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/29.
//

import Foundation
import UIKit
import SwiftUI


struct UIGraphView : UIViewRepresentable {

    typealias UIViewType = GraphView
    
    func makeUIView(context: Context) -> GraphView {
        let view =  GraphView(frame: .zero , percents: [50,30])
        return view
    }
    
    func updateUIView(_ uiView: GraphView, context: Context) {
    }
}


class GraphView : UIView {

    let backLineColor : UIColor =  UIColor(red: 0.086, green: 0.682, blue: 0.647, alpha: 0.1)  //바탕
    
    let colors:[UIColor] = [
        UIColor.red,
        UIColor(red: 0.518, green: 0.863, blue: 0.227, alpha: 1) , // 녹색
        UIColor(red: 1, green: 0.883, blue: 0.267, alpha: 1) , //노랑
    ]
    let lineWidth:CGFloat = 12.0
    
    
    var percents : [CGFloat] = []
    
    init(frame:CGRect, percents:[CGFloat]) {
        super.init(frame: frame)
        self.percents = percents
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        drawBackLine(rect)

        let center = CGPoint(x: rect.midX, y:rect.midY)
        let radius = (rect.width  - lineWidth) * 0.5
        
        var startAngle:CGFloat  = 90
        
        var startAnglePoint:CGFloat  = (startAngle * .pi) / 180
        var angles = [(CGFloat,CGFloat, UIColor)]()

        for (i,val)  in percents.enumerated() {
            let a = (val * 360) / 100
            let endAnglePoint = ((a + startAngle) * .pi) / 180
            angles.append((startAnglePoint, endAnglePoint, self.colors[i]))
            startAngle = startAngle + a
            startAnglePoint = (startAngle * .pi) / 180
        }
        
        
        for (startAnglePoint, endAnglePoint,color) in angles.reversed(){
            let path = UIBezierPath()
            let color = color
            color.set()
            path.lineWidth = 12.0
            path.lineCapStyle = .round
            path.addArc(withCenter: center, radius: radius, startAngle: startAnglePoint, endAngle: endAnglePoint, clockwise: true)
            path.stroke()
        }

    }
    private func drawBackLine(_ rect: CGRect) {
        let center = CGPoint(x: rect.midX, y:rect.midY)
        let radius = (rect.width  - lineWidth) * 0.5
        let path = UIBezierPath()
        self.backLineColor.set()
        path.lineWidth = 12.0
        path.lineCapStyle = .round
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: (360 * .pi) / 180, clockwise: true)
        path.stroke()
    }
}
