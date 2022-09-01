//
//  TestInfiniteScrollView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI
import LSSLibrary

class InfiniteScrollModel : ObservableObject {
    @Published var items = [PageData]()
    
    
    init() {
        for i in 0..<100 {
            items.append(PageData(value: i + 100 ))
        }
    }
    
    
//    func testInset() -> Int  {
//
//
//
//
//        for i in 0..<100 {
//
//            items.insert(PageData(value: i), at: i)
//        }
//
//
//        return 100
//
//
//
//
//    }
    
        func testInset() -> PageData?  {
    
    
            guard let data = items.first else {
                return nil
            }
    
    
            for i in 0..<100 {
    
                items.insert(PageData(value: i), at: i)
            }
    
    
            return data
    
    
    
    
        }
    
}

struct InfiniteScrollView : View {
    
    
    @EnvironmentObject var model : InfiniteScrollModel
    
    
    var body : some View {
        VStack(spacing:0) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing:0) {
                      //  ForEach(Array(model.items.enumerated()) , id: \.offset ) { (i, item) in
                            
                        ForEach(model.items) { item in
                            Text(String(item.value))
                                .id(item.id.uuidString)
                            
                            
                        }
                    }
                }
                
                Button {
                    
                    guard let item = model.testInset() else {
                        return
                    }
                        
                    DispatchQueue.main.async {
                        proxy.scrollTo(item.id.uuidString, anchor: .top )
                    }

                    
                    
                    
//                    let id =  model.testInset()
//                    Debug.log(id)
//                    DispatchQueue.main.async {
//                        proxy.scrollTo(id, anchor: .top )
//                    }
                    
                } label: {
                    Text("INSERT")
                }
                
            }
        }
        
        
    }
}

struct TestInfiniteScrollView: View {
    
    @StateObject var model : InfiniteScrollModel = InfiniteScrollModel()
    
    
    var body: some View {
        
        
        InfiniteScrollView()
            .environmentObject(model)
        
        
        
    }
}

struct TestInfiniteScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TestInfiniteScrollView()
            .environmentObject(InfiniteScrollModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
