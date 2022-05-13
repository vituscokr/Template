//
//  EntryView.swift
//  MyWidgetExtension
//
//  Created by Gyeongtae Nam on 2022/05/09.
//

import SwiftUI

struct EntryView: View {
    let model : WidgetContent
    
    
    
    
//    init(model: WidgetContent) {
//        self.model = model
//    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.name)
                .font(.system(size: 16, weight: .bold, design: .default))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding([.trailing], 15)
                .foregroundColor(Color.red)
            
            
            Text(model.cardViewSubtitle)
                .font(.system(size: 12, weight: .regular, design: .default))
                .lineLimit(nil)
                .foregroundColor(Color.green)
            
            Text(model.descripitonPlainText)
                .font(.system(size: 12, weight: .regular, design: .default))
                .lineLimit(2)
                .lineSpacing(3)
                .foregroundColor(Color.blue)
            
            Text(model.releaseAtDateTimeString)
                .font(.system(size: 12, weight: .regular, design: .default))
                .lineLimit(1)
                .foregroundColor(Color.yellow)
            
        }
        .background(Color.gray)
        .padding()
        .cornerRadius(6)
    }
}

//struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView(model: snapshotEntry)
//    }
//}
