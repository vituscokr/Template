//
//  TestArchiveView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/29.
//

import SwiftUI
import LSSLibrary
import SwiftyJSON

struct TestArchiveView: View {
    @State var json = JSON([
        "test": "test",
        "test1": true,
        "test3": 1,
        "test4": 3.14
    ])
    var toggleJson = JSON([
        "test": "test_modi",
        "test1": false,
        "test3": 2,
        "test4": 6.14
    ])
    var body: some View {
        VStack {

            Text(json.rawString() ?? "" )
            Button {
                Archive<JSON>.save(filename: "test.json", data: toggleJson )
                guard let data  =  Archive<JSON>.read(filename: "test.json") else {
                    return
                }
                json = data
            } label: {
                Text("저장")
            }
        }
    }
}

struct TestArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        TestArchiveView()
    }
}
