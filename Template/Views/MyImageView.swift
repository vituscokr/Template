//
//  MyImageView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//
import SwiftUI

struct MyImageView: View {
    @State var url: String  = ""
    // "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03373/
    // opgs/edr/ncam/NRB_696919762EDR_S0930000NCAM00594M_.JPG"
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
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
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView()
    }
}
