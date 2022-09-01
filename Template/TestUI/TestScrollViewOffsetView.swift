//
//  TestScrollViewOffsetView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI
import LSSLibrary




struct TestScrollViewOffsetView: View {
    
    @State private var dragOffset = CGFloat.zero
    @State private var offset = CGFloat.zero
    
    
    let imageWidth: CGFloat = UIScreen.main.bounds.width
    var body: some View {
 
        HStack(spacing:0) {
            ForEach(0..<5) { i in
                Text("\(i)")
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
                    
                    
                   let i =  Double( (offset + dragOffset) / imageWidth ).rounded(.toNearestOrEven) //몫
                    
                    offset = (offset + dragOffset).remainder(dividingBy: imageWidth) //나머지 
                    
                    Debug.log("i: \(i)")
                    
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
