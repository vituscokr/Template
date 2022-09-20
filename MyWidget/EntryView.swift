//
//  EntryView.swift
//  MyWidgetExtension
//
//  Created by Gyeongtae Nam on 2022/05/09.
//

import SwiftUI

struct EntryView: View {
//    @Environment(\.widgetFamily) var family
    let model: WidgetContent
//    init(model: WidgetContent) {
//        self.model = model
//    }
    var body: some View {
//        switch family {
//        case .systemSmall:
//        case .systemMedium:
//        case .systemLarge:
//        case .systemExtraLarge:
//        @unknown default:
//            Text("unKnown")
//
//        }
        GeometryReader { proxy  in
            VStack(alignment: .leading) {
                HStack {
                    Text(model.name)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding([.trailing], 15)
                        .foregroundColor(Color.red)
                    Spacer()
                }
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
                Spacer()
            }
            .background(Color.gray)
            .padding()
            .cornerRadius(6)
            .edgesIgnoringSafeArea(.all)
            .preferredColorScheme(.light)
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
        }
    }
}

// struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView(model: snapshotEntry)
//    }
// }
