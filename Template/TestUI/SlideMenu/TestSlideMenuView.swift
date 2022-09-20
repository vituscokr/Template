//
//  TestSlideMenuView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/03.
//

import SwiftUI

// 참고: https://github.com/globulus/swiftui-side-menu/blob/main/Sources/SwiftUISideMenu/SwiftUISideMenu.swift
public struct SlideMenu<MenuContent: View>: ViewModifier {
    @Binding var isShowing: Bool
    private let menuContent: () -> MenuContent
    public init(isShowing: Binding<Bool>,
                @ViewBuilder menuContent: @escaping () -> MenuContent) {
        _isShowing = isShowing
        self.menuContent = menuContent
    }
    public func body(content: Content) -> some View {
        let drag = DragGesture().onEnded { event in
            if event.location.x < 200 && abs(event.translation.height) < 50 && abs(event.translation.width) > 50 {
                withAnimation {
                    self.isShowing = event.translation.width > 0
                }
            }
        }
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                content
                    .disabled(isShowing)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.isShowing ? geometry.size.width / 2: 0 )
                menuContent()
                    .frame(width: geometry.size.width / 2 )
                    .transition(.move(edge: .leading))
                    .offset(x: self.isShowing ? 0: -geometry.size.width / 2 )
            }.gesture(drag)
        }
    }
}

public extension View {
    func slideMenu<MenuContent: View>(
        isShowing: Binding<Bool>,
        @ViewBuilder menuContent: @escaping () -> MenuContent
    ) -> some View {
        self.modifier(SlideMenu(isShowing: isShowing, menuContent: menuContent))
    }
}
struct TestSlideMenuView: View {
    @State private var showSlideMenu: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List(1..<6) { index in
                    Text("Item: \(index)")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("DashBoard")
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showSlideMenu.toggle()
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                })
            ))
            .navigationBarBackButtonHidden(true)
        }
        .slideMenu(isShowing: $showSlideMenu) {
            VStack(alignment: .leading) {
                Button {
                    self.showSlideMenu = false
                } label: {
                    HStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.green)
                        Text("Close")
                            .foregroundColor(Color.green)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            // .edgesIgnoringSafeArea()
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct TestSlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TestSlideMenuView()
    }
}
