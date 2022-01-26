//
//  SampleGalleryView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/26.
//

import SwiftUI
import Photos

class GalleryModel : ObservableObject {
    
    @Published var collection : PHFetchResult<PHAsset>?
    @Published var images = [UIImage]()
    init() {
    }
    
    func fetch() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        fetchOptions.predicate = NSPredicate(format: "mediaType == %d || mediaType == %d", PHAssetMediaType.image.rawValue,
                            PHAssetMediaType.video.rawValue
        )
        
        fetchOptions.fetchLimit = 0
        fetchOptions.includeHiddenAssets = true
        
        self.collection = PHAsset.fetchAssets(with: fetchOptions)
        images.removeAll()
        
        let option = PHImageRequestOptions()
        option.deliveryMode = .highQualityFormat //.fastFormat
        option.isSynchronous = true
        let imageSize = CGSize(width: 250, height: 250)
        
        
        let imageManager = PHCachingImageManager()
        
        self.collection?.enumerateObjects({ asset, _, _ in
            imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: option) { image, info in
                
                guard let image = image else { return }
                self.images.append(image)
            }
        })
    }
}

struct SampleGalleryView: View {
    
    @ObservedObject var model  = GalleryModel()
    /// For Grid View
    let spacing: CGFloat = 20.0
    let col : Int = 3
    var itemWidth : CGFloat {
       return  (UIScreen.main.bounds.width  - ( spacing * CGFloat(col - 1) )) / CGFloat(col)
    }
    var columns : [GridItem] {
        return Array(repeating: .init(.fixed(itemWidth) ,spacing: spacing, alignment: .center), count: col)
    }
    
    var body: some View {

        ScrollView {
        LazyVGrid(columns: columns, spacing:spacing) {
            
            Button(action: {
                
            }){
                Image(systemName: "camera")
            }
            .frame(width: itemWidth , height:itemWidth, alignment: .center)
            
            ForEach(0..<(model.collection?.count ?? 0) , id: \.self ) { i in
                Image(uiImage: model.images[i] )
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidth, height: itemWidth, alignment: .center)
                    .clipped()
            }
        }
        }
        .onAppear {
            model.fetch()
        }
            
        
        
    }
}

struct SampleGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        SampleGalleryView()
    }
}
