//
//  CloseWindowView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/06.
//

import SwiftUI

struct CloseWindowView: View {
    var body: some View {
        VStack {
        Image(systemName: "xmark")
                .resizable()
            .foregroundColor(Color.white)
//            .frame(width:22,height:22)
            .background(
                Circle().fill(Color.red)
                    .frame(width: 44, height: 44, alignment: .center)
            )
//        Image(systemName: "xmark.circle.fill")
//                .foregroundStyle(.white, .red)
//            
//            Image(systemName: "xmark.circle")
//                .foregroundStyle(.green, .red)
//                .resizable()
//                .frame(width: 44, height: 44, alignment: .center)
//               // .font(.system(size: 44, weight: .bold, design: .default))
//            .foregroundColor(Color.red)
//            .padding()
          //  .frame(width:44, height: 44 , alignment: .center)
        }
    }
}

struct CloseWindowView_Previews: PreviewProvider {
    static var previews: some View {
        CloseWindowView()
    }
}
