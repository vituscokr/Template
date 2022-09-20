//
//  TestScrollViewOffsetView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI
import LSSLibrary

///     let x = 8.625
///     print(x / 0.75)
///     // Prints "11.5"
///
///     let q = (x / 0.75).rounded(.toNearestOrEven)
///     // q == 12.0
///     let r = x.remainder(dividingBy: 0.75)
///     // r == -0.375
///
///     let x1 = 0.75 * q + r
///     // x1 == 8.625


struct TestScrollViewOffsetView: View {
    
    @State private var dragOffset = CGFloat.zero
    @State private var offset = CGFloat.zero
    
    
    let imageWidth: CGFloat = UIScreen.main.bounds.width
    var body: some View {
 
        HStack(spacing:0) {
            ForEach(0..<5) { index in
                Text("\(index)")
                    .frame(width: imageWidth )
            }
        }
        .offset(x: offset + dragOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in

                })
                .onEnded({ value in
                    withAnimation(.easeOut) {
                        dragOffset = value.predictedEndTranslation.width
                        
                        Debug.log("end : \(dragOffset)")
                        
                    }
                    
                    
                   let temp =  Double( (offset + dragOffset) / imageWidth ).rounded(.toNearestOrEven) //몫
                    
                    offset = (offset + dragOffset).remainder(dividingBy: imageWidth) //나머지 
                    
                    Debug.log("i: \(temp)")
                    
                    Debug.log("offset : \(offset) ")
                
                    dragOffset = 0
                  
                })
        )
    }
}

struct TestScrollViewOffsetView_Previews: PreviewProvider {
    static var previews: some View {
        TestScrollViewOffsetView()
    }
}
