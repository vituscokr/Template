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
import Combine


struct LSSFile : Codable {

    var url :String
    var name : String
    var size : Int
    var type : String
    
    
    enum CodingKeys :CodingKey {
        case url
        case name
        case size
        case type
    }
}

extension LSSFile : Identifiable {
    var id : String { return url }
}

class PhotoModel : ObservableObject{
    static var shared :PhotoModel = PhotoModel()
    @Published var isDone : Bool = false
    @Published var items : [LSSFile] = [LSSFile]()
}

class PhotoPickerViewDelegate : UIViewController, UINavigationControllerDelegate {
    
    
    var close : () -> ()
    private var disposeBag = Set<AnyCancellable>()
    
    init (close:  @escaping () -> () ) {
        
        self.close = close
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PhotoPickerViewDelegate {
    
    func appendImage( asset : TLPHAsset) {
        guard let image = asset.fullResolutionImage else {
            return
        }
        var newImage = image
        if image.size.width > 2500 || image.size.height > 2500 {
            newImage = image
        }
        
        guard let pngData = newImage.pngData() else {
            return
        }
        
        guard let filename = asset.originalFileName else {
            return
        }
        
        let filesize = pngData.count
        
        
        let file = MyFile(filename: filename)
        file.saveTemp(data: pngData)
        let urlString =  file.filePath
        
        
        let item = LSSFile(url: urlString, name: filename, size: filesize, type: "image")
        
        DispatchQueue.main.async {
            PhotoModel.shared.items.append(item)
        }
    }
    
    func appendVideo( asset : TLPHAsset ) {
        
        asset.videoSize { size in
            
            asset.exportVideoFile { url, string in
                
                let urlString = url.absoluteString
                
                let filename = url.lastPathComponent
                
                let item = LSSFile(url: urlString, name: filename, size: size, type: "video")
                DispatchQueue.main.async {
                    PhotoModel.shared.items.append(item)
                }
            }
        }
        
        
    }
}
extension PhotoPickerViewDelegate: TLPhotosPickerViewControllerDelegate{
    
    func canSelectAsset(phAsset: PHAsset) -> Bool {
        return true
    }
    func shouldDismissPhotoPicker(withTLPHAssets: [TLPHAsset]) -> Bool {
        return true
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        
        
        
         let publisher = withTLPHAssets.publisher
        
        
        publisher
            .map { asset in
                
                let mediaType = asset.phAsset?.mediaType
    
                switch(mediaType) {
                case .video:
                    self.appendVideo(asset: asset)
                case .image:
                    self.appendImage(asset: asset)
                default:
                    return
                }
                
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                Debug.log("completion")
                //self.close()
                
            } receiveValue: { _ in
                
                Debug.log("receive")
            }
            .store(in: &disposeBag)

    }

    func photoPickerDidCancel() {
        Debug.log("cancel")
        self.close()
        
    }
    
    func dismissComplete() {
        Debug.log("dismissComplete")
        self.close()
        
    }
    
    
}

struct TestPhotoPickerView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model : PhotoModel
    
    var configure : TLPhotosPickerConfigure = TLPhotosPickerConfigure()
    var delegate: TLPhotosPickerViewControllerDelegate?

    init( ) {
        //https://github.com/tilltue/TLPhotoPicker. 참고 
        self.configure = TLPhotosPickerConfigure()
        configure.singleSelectedMode = false
        configure.cancelTitle = "취소"
        configure.doneTitle = "완료"
        configure.allowedVideo = true // 비디오 여부
        configure.allowedLivePhotos = false // 라디오 포토 여부
        configure.usedCameraButton = true // 카메라 사용여부
        configure.maxSelectedAssets = 3 - PhotoModel.shared.items.count // 최대 선택수
        configure.selectedColor = UIColor.red //선택했을때의 칼라 (UIColor)
        configure.numberOfColumn = 3 // 칼럼수

        self.delegate = PhotoPickerViewDelegate(close: {
            PhotoModel.shared.isDone = true
        })

    }
    var body: some View {
        PhotoPikcerView(configure: self.configure, delegate: self.delegate!)
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onChange(of: model.isDone) { newValue in

                if newValue {
                    self.presentationMode.wrappedValue.dismiss()
                    model.isDone = false
                }
            }
    }
}


struct TestPhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TestPhotoPickerView()
    }
}
