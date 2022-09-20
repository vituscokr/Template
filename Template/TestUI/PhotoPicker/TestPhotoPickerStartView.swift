//
//  TestPhotoPickerStartView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/03.
//

import SwiftUI
import AVKit
import LSSLibrary

struct TestPhotoPickerStartView: View {
    @StateObject var model: PhotoModel = PhotoModel.shared
    func getDuration(item: LSSFile) -> String {
        let url = URL(fileURLWithPath: item.url)
        let player = AVPlayer(url: url)
        return player.duration
    }
    var body: some View {
        VStack {
            ForEach(model.items) { item in
                if item.type == "video" {
                    AVPlayerView(player: AVPlayer(
                        url: URL(fileURLWithPath: item.url) ),
                        showController: true)
                   // .transition(.move(edge: .bottom))
                    .frame(width: 200, height: 200, alignment: .center)
                    Text( getDuration(item: item) )
               } else {
                    AsyncImage(url: URL(fileURLWithPath: item.url )) { phase in
                        switch phase {
                        case .empty: // placeholder
                            Text("loading")
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure(let error):
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
                    .frame(width: 200, height: 200)
                }
            }
            NavigationLink {
               TestPhotoPickerView()
                    .environmentObject(model)
            }label: {
                Text("사진선택")
            }
        }
    }
}

struct TestPhotoPickerStartView_Previews: PreviewProvider {
    static var previews: some View {
        TestPhotoPickerStartView()
    }
}
