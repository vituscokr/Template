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
        
        ScrollView {
            VStack(spacing:0) {
//                NavigationLink {
//                    TestSimpleWebView()
//                }label : {
//                    Text("SimpleWebView")
//                }
//
//                NavigationLink {
//                    TestLottieView()
//                }label : {
//                    Text("LottieView")
//                }
//
//
//                NavigationLink {
//                    CountryListView()
//                        .environment(\.managedObjectContext, viewContext)
//                }label: {
//                    Text("CoreData")
//                }
//
//
//                NavigationLink {
//                    ConfigView()
//                }label: {
//                    Text("Config")
//                }
//
//
//                NavigationLink {
//                    TestArchiveView()
//                }label: {
//                    Text("TEST Archive")
//                }
//
//                NavigationLink {
//                    TestGraphView()
//                }label: {
//                    Text("TEST GraphView")
//                }
//
//                NavigationLink {
//                    TestPhotoPickerStartView()
//                }label: {
//                    Text("TEST PhotoPickerView")
//                }
//
//
//                NavigationLink {
//                    TestCalendarView()
//                }label: {
//                    Text("TEST CalendarView")
//                }
//
                
                

                NavigationLink(destination: {
                    LoginView()
                }, label: {
                    Text("login")
                })
                NavigationLink(destination: {
                    TestSlideMenuView()
                }, label: {
                    Text("SliderMenuView" )
                })
                
                
                Button(action: {
                    ContentRepository().writeContents()
                }){
                    Text("ContentRepository Save")
                }
                
                
                Text("This is Test 18")
                    .applyFont(font: .bold18)
                
                Text("This is Test 18")
                    .applyFont(font: .regular18)
                
                
                
                NavigationLink {
                    TestInfiniteScrollView()
                } label: {
                    Text("infiniteScrollView" )
                }

                NavigationLink {
                    TestScrollViewOffsetView()
                } label: {
                    Text("ScrollViewOffsetVie" )
                }

                
                NavigationLink {
                    TestPreferenceView(messages: ["a","b","c"])
                } label: {
                    Text("TestPreference" )
                }
                
                
                
                //
                //            Text("This is test 18")
                //                .applyFont(font: .bold18, underlined: true)
                //            SampleGalleryView()
                //            SampleConfigView()
                
                //            ContentView()
                //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
