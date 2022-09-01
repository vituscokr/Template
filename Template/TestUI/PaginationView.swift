//
//  TestPageView.swift
//  Test
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI
// 참고 : https://sweetdev.tistory.com/719

struct PageData : Identifiable {
    var id = UUID()
    var value : Int
}


class PagenationModel<T:Identifiable> : ObservableObject {
    @Published var items  = [T]()
    @Published var currentIndex: Int = 0
    
    init() {
        items = [T]()
        currentIndex = 0
    }
    
    init(items: [T]) {
        self.items = items
        
    }
    
}


struct PageView<T>: View {
    var item : T
    var title : String {
        if item is PageData {
            guard let item = item as? PageData else {
                return ""
            }
            return String(item.value  )
        }else {
            return ""
        }
    }
    var body: some View {
        VStack (spacing:0) {
            Text(title)
        }
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView<PageData>(item: PageData(value: 1))
//    }
//}


struct PaginationView: View {
    
    @StateObject var model : PagenationModel<PageData> = PagenationModel<PageData>()
    
    @State var currentIndex: Int = 0
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var body: some View {
        VStack (spacing:0) {
            ScrollView([.horizontal] , showsIndicators: false) {
                if model.items.count > 0 {
                    HStack {
                        TabView (selection: $currentIndex){
                            ForEach(0..<model.items.count  , id: \.self ) { i in
                                
                                PageView<PageData>(item:model.items[i])
                            }
                        }
                        .frame(width: screenWidth)
                        .tabViewStyle(PageTabViewStyle() )
                    }
                    
                    .onAppear {
                        UIPageControl.appearance().currentPageIndicatorTintColor = .black
                        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
                    }
                    
                }
            }
            .onAppear {
                
                //더미 데이타
                model.items.append(PageData(value: 1))
                model.items.append(PageData(value: 2))
                model.items.append(PageData(value: 3))
        }
            
            HStack {
                if model.items.count > 0 {
                    ForEach(0..<model.items.count , id:\.self) { i   in
                        
                        Circle()
                            .foregroundColor(currentIndex == i ? Color.red : Color.blue )
                            .frame(width: 5, height: 5, alignment: .center)
                    }
                }
            }
        }
        .onChange(of: currentIndex) { newValue in
            print(currentIndex)
        }
        
        
    }
}

struct PaginationView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationView()
    }
}
