//
//  MainView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        VStack(spacing:0) {
            NavigationLink {
                TestSimpleWebView()
            }label : {
                Text("SimpleWebView")
            }
            
            NavigationLink {
                TestLottieView() 
            }label : {
                Text("LottieView")
            }
            
            //            SampleGalleryView()
            //            SampleConfigView()
                        
            //            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
