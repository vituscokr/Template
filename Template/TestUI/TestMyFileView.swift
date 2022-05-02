//
//  TestMyFileView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/02.
//
import UIKit
import SwiftUI
import LSSLibrary

struct TestMyFileView: View {
    
    @State var path : String?
    var body: some View {

        VStack {
            
            Button(action: {
                
                
                guard let data = UIImage(named:"17eb274c3fe48b902")?.pngData() else {
                    return
                }
                
                let myFile = MyFile(filename: "test")
                myFile.saveTemp(data: data)
                
                
                path = myFile.filePath
                
            }) {
                Text("파일 저장")
            }
            
            Button(action: {
                
                
                let myFile = MyFile(filename: "test")
                
                myFile.removeFile(url: myFile.filePath)

                path = ""
                
            }) {
                Text("파일 삭제")
            }
            
            
            AsyncImage(url: URL(fileURLWithPath: path ?? "" )){ phase in
                switch(phase) {
                case .empty : // placeholder
                    Text("loading")
                case .success(let image) :
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                case .failure (let error) :
                    VStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                        Text(error.localizedDescription)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width:200, height:200)
            
            
            
        }
    }
}

struct TestMyFileView_Previews: PreviewProvider {
    static var previews: some View {
        TestMyFileView()
    }
}
