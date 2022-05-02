//
//  TestPhotoPickerView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/02.
//

import SwiftUI
import LSSLibrary
import TLPhotoPicker
import MobileCoreServices
import Photos


public struct MyPhotoPickerView : UIViewControllerRepresentable {

    public var configure : TLPhotosPickerConfigure = TLPhotosPickerConfigure()
    public var delegate: TLPhotosPickerViewControllerDelegate?

    public func makeUIViewController(context: Context) -> some UIViewController {
        let vc = TLPhotosPickerViewController()
        vc.configure = configure
        vc.delegate = delegate
        return vc
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}


class PhotoPickerViewDelegate : UIViewController, UINavigationControllerDelegate  {
    static var shared  = PhotoPickerViewDelegate()
    
    var model = PhotoModel.shared
}

extension PhotoPickerViewDelegate :TLPhotosPickerViewControllerDelegate {
    
    
    func canSelectAsset(phAsset: PHAsset) -> Bool {
        return true
    }
    
    func shouldDismissPhotoPicker(withTLPHAssets: [TLPHAsset]) -> Bool {
        return true
    }
    
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        
//        withTLPHAssets.map { asset  in
//
//            let mediaType = asset.phAsset?.mediaType
//
//            switch(mediaType) {
//            case .video:
//            case .image:
//            default:
//
//            }
//        }
    }
    
    func photoPickerDidCancel() {
        Debug.log("photoPicckerDidCancel")
        model.isDone = true
    }
    
    func dismissComplete() {
        Debug.log("dismisComplete")
        model.isDone = true
    }
}


class PhotoModel: ObservableObject {
    
    static var shared: PhotoModel = PhotoModel()
    
    @Published var isDone : Bool = false
}

struct TestPhotoPickerView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var model: PhotoModel = PhotoModel.shared
    var configure : TLPhotosPickerConfigure = TLPhotosPickerConfigure()
    var delegate: TLPhotosPickerViewControllerDelegate?
    
    init( ) {
        
        self.configure = TLPhotosPickerConfigure()
        configure.singleSelectedMode = false
        configure.cancelTitle = "취소"
        configure.doneTitle = "완료"
        configure.allowedVideo = false // 비디오 여부
        configure.allowedLivePhotos = false // 라디오 포토 여부
        configure.usedCameraButton = true // 카메라 사용여부
        configure.maxSelectedAssets = 3 // 최대 선택수
        configure.selectedColor = UIColor.red //선택했을때의 칼라 (UIColor)
        configure.numberOfColumn = 3 // 칼럼수
        
        self.delegate = PhotoPickerViewDelegate.shared
    }
    
    
    var body: some View {

            MyPhotoPickerView(configure: configure , delegate: delegate)
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onChange(of: model.isDone) { newValue in
                
                Debug.log("isDone")
                
                if newValue {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }

        
    }
    
    
}


struct TestPhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TestPhotoPickerView()
    }
}
