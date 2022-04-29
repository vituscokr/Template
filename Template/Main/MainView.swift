//
//  MainView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
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
            
            
            NavigationLink {
                CountryListView()
                    .environment(\.managedObjectContext, viewContext)
            }label: {
                Text("CoreData")
            }
            
            
            NavigationLink {
                ConfigView() 
            }label: {
                Text("Config")
            }
            
            
            NavigationLink {
                TestArchiveView()
            }label: {
                Text("TEST Archive")
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
