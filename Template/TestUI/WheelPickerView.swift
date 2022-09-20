//
//  WheelPickerView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI

//https://betterprogramming.pub/wheel-picker-view-in-swiftui-6de7077b4791


struct MyVal : Equatable {
    let id = UUID()
    let val : String
    
}

enum Direction {
    case left
    case right
}

struct WheelView : View {
    @State var radius : Double  = 150
    @State var direction  = Direction.left
    @State var chosenIndex = 0
    
    @Binding var degree : Double
    
    let array : [MyVal]

    let circleSize : Double
    
    var body: some View {
        ZStack {
            let anglePerCount = Double.pi * 2.0 / Double(array.count)
            let drag = DragGesture()
                .onEnded { value in
                    if value.startLocation.x > value.location.x + 10 {
                        direction = .right
                    } else if value.startLocation.x < value.location.x - 10 {
                        direction = .left
                    }
                    moveWheel()
                }
            // MARK: WHEEL STACK - BEGINNING
            ZStack {
                Circle().fill(EllipticalGradient(colors: [Color.orange,Color.red]))
                    .hueRotation(Angle(degrees: degree))

                ForEach(0 ..< array.count) { index in
                    let angle = Double(index) * anglePerCount
                    let xOffset = CGFloat(radius * cos(angle))
                    let yOffset = CGFloat(radius * sin(angle))
                    
                    ZStack {
                        Rectangle()
                                .frame(width: 100, height: 100, alignment: .center)
                    Text("\(array[index].val)")
                            .foregroundColor(Color.white)
                    }
                    .rotationEffect(Angle(degrees: -degree))
                    .offset(x: xOffset, y: yOffset )
                    .font(Font.system(chosenIndex == index ? .title : .body, design: .monospaced))
                }
            }
            .rotationEffect(Angle(degrees: degree))
            .gesture(drag)
            .onAppear() {
                radius = circleSize/2 - 30 // 30 is for padding
            }
            // MARK: WHEEL STACK - END
        }
        .frame(width: circleSize, height: circleSize)
    }
    
    func moveWheel() {
        withAnimation(.spring()) {
            if direction == .left {
                degree += Double(360/array.count)
                if chosenIndex == 0 {
                    chosenIndex = array.count-1
                } else {
                    chosenIndex -= 1
                }
            } else {
                degree -= Double(360/array.count)
                if chosenIndex == array.count-1 {
                    chosenIndex = 0
                } else {
                    chosenIndex += 1
                }
            }
        }
    }
}

struct WheelPickerView: View {
    @State var degree = 90.0
    let array : [MyVal] =  [MyVal(val: "0"),
                            MyVal(val: "1"),
                            MyVal(val: "2"),
                            MyVal(val: "3"),
                            MyVal(val: "4"),
                            MyVal(val: "5"),
                            MyVal(val: "6"),
                            MyVal(val: "8"),
                            MyVal(val: "9"),
                            MyVal(val: "10")
    
    ]

    var body: some View {
        ZStack (alignment: .center){
            Color.orange.opacity(0.4).ignoresSafeArea()
                .hueRotation(Angle(degrees: degree))
            
            WheelView(degree: $degree, array: array, circleSize: 400)
                .offset(y:350)
                .shadow(color: .white, radius: 4, x: 0, y: 0)
        }
    }
}

struct WheelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        WheelPickerView()
    }
}
