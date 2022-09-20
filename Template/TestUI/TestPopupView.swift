//
//  TestPopupView.swift
//  SusudaB2B
//
//  Created by Gyeongtae Nam on 2022/03/08.
//

import SwiftUI
import LSSLibrary

struct PopupCenterView: View {
    var title: String = "Title"
    var description: String = "Description"
    var sentences: String = "Sentencs"
    var buttonTitle: String = "확인"
    var isCancelButton: Bool = false
    var isDoubleButton: Bool = true
    var confirmAction: () -> Void
    @State var isDisableCancel: Bool = false
    @State var isDisableConfirm: Bool = false
    var body: some View {
        /*
        GeometryReader { geomery in
            ZStack {
                Color.dim
                VStack {
                    Spacer()
                    //PopupStart
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color:Color(hexString: "#D6D8DA").opacity(0.7), radius: 32, x: 0, y:16)
                        VStack(spacing:0) {
                            
                            VStack(spacing:24) {
                                Text(title)
                                    .applyLabelFont(font: .bold18)
                                   
                                VStack(spacing:4) {
                                    Text(description)
                                       
                                       
                                    if sentences != "" {
                                        Text(sentences)
                                           
                                           
                                    }

                                }
                                
                                VStack {
                                    
                                    if isCancelButton {
//                                        PrimaryTextButtonView(action: {
////                                            Debug.log("hi")
//                                        },
//                                              buttonSize: .large,
//                                              title: "버튼",
//                                              isDisable: $isDisableCancel)
                                    }
                                    HStack(spacing:8) {
                                        
                                        if isDoubleButton {
//                                        PrimaryOutlineButtonView(action: {
//
//                                        },
//                                            buttonSize: .large,
//                                            title: "버튼",
//                                            isDisable: $isDisableConfirm)
//                                                .frame(width:110)
//                                        }
//
//                                        PrimaryButtonView(action: confirmAction,
//                                            buttonSize: .large,
//                                            title: buttonTitle,
//                                            isDisable: $isDisableConfirm)
                                    }

                                }
                            
                            }

                            
                            
                            
                        }
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 0, maxWidth: 327,minHeight: 0,  maxHeight: isCancelButton ?  320: 258)
                    //.frame(width:327, height: 320)

                    //PopupEnd
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
   */
        EmptyView()
         }
}

//
// struct MyPopupView: View {
//    
//    
//
//    
//    var height: CGFloat = 292 
//    var title: String = "Title"
//    @State var description:String = "Description"
//    var sentences: String = "Sentencs"
//    var areaId: Int   {
//        return  Int(Config.shared.read(key: .areaId, initStr: "1"))!
//    }
//    var areaType: AreaType  {
//        guard let id = Int(Config.shared.read(key: .areaId, initStr: "1")) else {
//            return .daegu
//        }
//        return AreaType.from(type: id)
//    }
//    var buttonTitle: String = "확인"
//    var cancelButtonTitle: String = "취소"
//    var isCancelButton: Bool = false
//    var isDoubleButton: Bool = true
//    
//    var confirmAction: () ->()
//    var cancelAction: () ->()
//    
//    @State var isDisableCancel: Bool = false
//    @State var isDisableConfirm: Bool = false
//    
//    
//    
//    
//    var body:some View {
//        GeometryReader { geomery in
//            ZStack {
//                Color.dim
//                VStack {
//                    Spacer()
//                    //PopupStart
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(Color.white)
//                            .shadow(color:Color(hexString: "#D6D8DA").opacity(0.7), radius: 32, x: 0, y:16)
//                        VStack(spacing:0) {
//                            
//                            VStack(spacing:24) {
//                                Text(title)
//                                    .apply18Bold()
//                                    .foregroundColor(Color.blackLight)
//                                VStack(alignment:.center, spacing:4) {
//                                    Text(description)
//                                        .apply16Regular()
//                                        .foregroundColor(Color.gray2)
//                                        .multilineTextAlignment(.center)
//                                    if sentences != "" {
//                                        Text(sentences)
//                                            .apply16Regular()
//                                            .foregroundColor(Color.gray2)
//                                    }
//
//                                }
//                                
//                                VStack {
//                                    
//                                    if isCancelButton {
//                                        PrimaryTextButtonView(action: {
//                                            Debug.log("hi")
//                                        },
//                                              buttonSize: .large,
//                                              title: cancelButtonTitle,
//                                              isDisable: $isDisableCancel)
//                                    }
//                                    HStack(spacing:8) {
//                                        
//                                        if isDoubleButton {
//                                        PrimaryOutlineButtonView(action: cancelAction,
//                                            buttonSize: .large,
//                                            title: cancelButtonTitle,
//                                            isDisable: $isDisableConfirm)
//                                                .frame(width:110)
//                                        }
//                                        
//                                        PrimaryButtonView(action: confirmAction,
//                                            buttonSize: .large,
//                                            title: buttonTitle,
//                                            isDisable: $isDisableConfirm)
//                                    }
//
//                                }
//                            
//                            }
//
//                            
//                            
//                            
//                        }
//                        .padding(.horizontal, 16)
//                    }
//                   //isCancelButton ?  292: 230
//                    .frame(minWidth: 0, maxWidth: 327,minHeight: 0,  maxHeight: height )
//                    //.frame(width:327, height: 320)
//
//                    //PopupEnd
//                    Spacer()
//                }
//            }
//            
//            .edgesIgnoringSafeArea(.all)
//            .onAppear {
//             
//
//              if !message.isEmpty {
//                    self.description  = message
//                }
//            }
//        }
//    }
// }
//
//
// struct MyPopupView2: View {
//    
//    @Binding var message: String
//
//    
//    var height: CGFloat = 292
//    var title: String = "Title"
//    @State var description:String = "Description"
//    var sentences: String = "Sentencs"
//    var areaId: Int   {
//        return  Int(Config.shared.read(key: .areaId, initStr: "1"))!
//    }
//    var areaType: AreaType  {
//        guard let id = Int(Config.shared.read(key: .areaId, initStr: "1")) else {
//            return .daegu
//        }
//        return AreaType.from(type: id)
//    }
//    var buttonTitle: String = "확인"
//    var cancelButtonTitle: String = "취소"
//    var isCancelButton: Bool = false
//    var isDoubleButton: Bool = true
//    
//    var confirmAction: () ->()
//    var cancelAction: () ->()
//    
//    @State var isDisableCancel: Bool = false
//    @State var isDisableConfirm: Bool = false
//    
//    
//    
//    
//    var body:some View {
//        GeometryReader { geomery in
//            ZStack {
//                Color.dim
//                VStack {
//                    Spacer()
//                    //PopupStart
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(Color.white)
//                            .shadow(color:Color(hexString: "#D6D8DA").opacity(0.7), radius: 32, x: 0, y:16)
//                        VStack(spacing:0) {
//                            
//                            VStack(spacing:24) {
//                                Text(title)
//                                    .apply18Bold()
//                                    .foregroundColor(Color.blackLight)
//                                VStack(alignment:.center, spacing:4) {
//                                    Text(description)
//                                        .apply16Regular()
//                                        .foregroundColor(Color.gray2)
//                                        .multilineTextAlignment(.center)
//                                    if sentences != "" {
//                                        Text(sentences)
//                                            .apply16Regular()
//                                            .foregroundColor(Color.gray2)
//                                    }
//
//                                }
//                                
//                                VStack {
//                                    
//                                    if isCancelButton {
//                                        PrimaryTextButtonView(action: {
//                                            Debug.log("hi")
//                                        },
//                                              buttonSize: .large,
//                                              title: cancelButtonTitle,
//                                              isDisable: $isDisableCancel)
//                                    }
//                                    HStack(spacing:8) {
//                                        
//                                        if isDoubleButton {
//                                        PrimaryOutlineButtonView(action: cancelAction,
//                                            buttonSize: .large,
//                                            title: cancelButtonTitle,
//                                            isDisable: $isDisableConfirm)
//                                                .frame(width:110)
//                                        }
//                                        
//                                        PrimaryButtonView(action: confirmAction,
//                                            buttonSize: .large,
//                                            title: buttonTitle,
//                                            isDisable: $isDisableConfirm)
//                                    }
//
//                                }
//                            
//                            }
//
//                            
//                            
//                            
//                        }
//                        .padding(.horizontal, 16)
//                    }
//                   //isCancelButton ?  292: 230
//                    .frame(minWidth: 0, maxWidth: 327,minHeight: 0,  maxHeight: height )
//                    //.frame(width:327, height: 320)
//
//                    //PopupEnd
//                    Spacer()
//                }
//            }
//            
//            .edgesIgnoringSafeArea(.all)
//            .onAppear {
//             
//
//                if !message.isEmpty {
//                    self.description  = message
//                }
//            }
//        }
//    }
// }
struct TestPopupView: View {
    @State var isPresentedPopupCenter: Bool = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Button {
                    isPresentedPopupCenter = true
                } label: {
                    Text("popup")
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
//            .modifier(Popup(isPresented: isPresentedPopupCenter, content: {
//                PopupCenterView()
//            }))
        }

    }
}

struct TestPopupView_Previews: PreviewProvider {
    static var previews: some View {
        TestPopupView()
    }
}
