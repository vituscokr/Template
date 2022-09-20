//
//  SampleColorView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI

struct SampleColor :Identifiable{
    var id: UUID = UUID()
    var name:String
    var color : Color
}

struct SampleColorView: View {
    
    
    
    @State var items = [
        SampleColor(name: "graydark4" , color: .graydark4),
        SampleColor(name: "graydark3" , color: .graydark3),
        SampleColor(name: "darkgray2" , color: .darkgray2),
        SampleColor(name: "graydark1" , color: .graydark1),
        SampleColor(name: "gray0" , color: .gray0),
        SampleColor(name: "graylight2" , color: .graylight2),
        SampleColor(name: "graylight1" , color: .graylight1),
        SampleColor(name: "graylight" , color: .graylight),
        SampleColor(name: "mainpink_dark" , color: .mainPinkDark),
        SampleColor(name: "mainpink" , color: .mainpink),
        SampleColor(name: "mainpink_light" , color: .mainPinkLight),
        SampleColor(name: "pinklight1" , color: .pinklight1),
        SampleColor(name: "active" , color: .active),
        SampleColor(name: "purpledark" , color: .purpledark),
        SampleColor(name: "purple" , color: .purple),
        SampleColor(name: "purple_light" , color: .purpleLight),
        SampleColor(name: "green" , color: .green),
        SampleColor(name: "green_light2" , color: .greenLight2),
        SampleColor(name: "green_light" , color: .greenLight),
        SampleColor(name: "yellowdark" , color: .yellowdark),
        SampleColor(name: "yellow" , color: .yellow),
        SampleColor(name: "yellowlight" , color: .yellowlight)

    ]
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(items) { item in
                    VStack {
                       Circle()
                            .fill(item.color)
                            .frame(height:50)
                        Text(item.name)
                    }
                    
                }
                
                

//                HStack{
//                    Color.graydark3
//                    Text("graydark3")
//                }
//                HStack{
//                    Color.darkgray2
//                    Text("darkgray2")
//                }
//                HStack{
//                    Color.graydark1
//                    Text("graydark1")
//                }
//                HStack{
//                    Color.gray0
//                    Text("gray0")
//                }
//                HStack{
//                    Color.graylight2
//                    Text("graylight2")
//                }
//                HStack{
//                    Color.graylight1
//                    Text("graylight1")
//                }
//                HStack{
//                    Color.graylight
//                    Text("graylight")
//
//                }
//                HStack{
//                    Color.mainpink_dark
//                    Text("mainpink_dark")
//
//                }
//                HStack{
//                    Color.mainpink
//                    Text("mainpink")
//
//                }
//                HStack{
//                    Color.mainpink_light
//                    Text("mainpink_light")
//
//                }
//                HStack{
//                    Color.pinklight1
//                    Text("pinklight1")
//
//                }
//                HStack{
//                    Color.active
//                    Text("active")
//
//                }
//                HStack{
//                    Color.purpledark
//                    Text("purpledark")
//
//                }
//                HStack{
//                    Color.purple
//                    Text("purple")
//
//                }
//                HStack{
//                    Color.purple_light
//                    Text("purple_light")
//
//                }
//                HStack{
//                    Color.green
//                    Text("green")
//
//                }
//                HStack{
//                    Color.green_light2
//                    Text("green_light2")
//
//                }
//                HStack{
//                    Color.green_light
//                    Text("green_light")
//
//                }
//                HStack{
//                    Color.yellowdark
//                    Text("yellowdark")
//
//                }
//                HStack{
//                    Color.yellow
//                    Text("yellow")
//
//                }
//                HStack{
//                    Color.yellowlight
//                    Text("yellowlight")
//
//                }
                
            }
        }
    }
}

struct SampleColorView_Previews: PreviewProvider {
    static var previews: some View {
        SampleColorView()
    }
}




























