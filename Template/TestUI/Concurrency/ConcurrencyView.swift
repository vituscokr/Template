//
//  ConcurrencyView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI

struct ConcurrencyView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var model  = LaunchModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink {
                    ConfigView()
                        .environment(\.managedObjectContext, viewContext)
                } label: {
                    Text("hi")
                }
                
                //            NavigationLink {

                //            } label: {
                //                Text("ConfigView")
                //            }
                
                
                
                
                //            ScrollView(.horizontal) {
                //                HStack(spacing:0) {
                //                    ForEach(model.photos) { photo in
                //
                //                        MyImageView(url: photo.item["img_src"].string ?? "" )
                //                            .padding(.horizontal, 20)
                //                            .padding(.vertical, 8)
                //                            .onAppear {
                //                                Debug.log(photo)
                //                            }
                //
                //                    }
                //                }
                //            }
                //
                //            if model.photos.isEmpty {
                //                Text("loading")
                //            }
            }
            .task {
                
                //            model.fetchAll()
            }
            //        .onAppear {
            //            model.fetch()
            //        }
            //        .task {
            //            model.fetch()
            //        }
            
        }
    }
    
    
    
    
    func nextLetter(_ letter :String) -> String?  {
        
        guard let uniCode = UnicodeScalar(letter) else {
            return nil
        }
        switch uniCode {
        case "0" ..< "Z":
            return String(UnicodeScalar(uniCode.value + 1 )!)
        case "9":
            return "a"
        case "a" ..< "z":
            return String(UnicodeScalar(uniCode.value + 1 )!)
        case "z":
            return "A"
            
        case "A" ..< "Z":
            return String(UnicodeScalar(uniCode.value + 1 )!)
            //        case "Z":
         //   return "a"
            
            
        default:
            return nil
        }
    }
    
    //새로운 댓글
    //    func replayOrderString(_ str : String )  -> String? {
    //        if  let index = str.firstIndex(of: "A")  {
    //
    //
    //             let depth :Int  =  str.distance(from: str.startIndex, to: index)
    //            Debug.log("depth: \(depth)")
    //
    ////                let idx  = str.index(after: index)
    //
    //            let suffix = str.substring(from: index)
    //
    //            let prefix = str.substring(to: index)
    //
    //            let suffixIndex = suffix.index(suffix.startIndex, offsetBy: 1)
    //
    //            let body = suffix.substring(from: suffixIndex)
    //            let temp  = suffix.substring(to: suffixIndex)
    //            let head = nextLetter(temp) ?? ""
    //            let new = prefix + head + body
    //
    //
    //            Debug.log("new : \(new)")
    //
    //            return new
    //
    ////                let prefix = str.substring(to: idx)
    ////
    ////                let suffix  = str.substring(from: idx)
    ////
    ////
    ////                Debug.log("suffix : \(suffix)")
    ////                Debug.log("prefix : \(prefix)")
    ////
    //
    //        }else {
    //            Debug.log("새로운 댓글을 달지 못합니다.")
    //            return nil
    //        }
    //    }
    //
    
    func replyDepth(_ str: String) -> Int {
        var depth: Int = 0
        if let index = str.firstIndex(of: "0")  {
            depth  =  str.distance(from: str.startIndex, to: index)
        }else {
            depth  =  str.count - 1
        }
        return depth
    }
    
    func replayOrderString(_ str : String , depth: Int ) -> String {
        var arr = str.map { String($0) }
        guard let str = nextLetter(arr[depth]) else {
            return arr.joined()
        }
        arr[depth] = str
        return arr.joined()
        
    }
}

struct ConcurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyView()
    }
}
