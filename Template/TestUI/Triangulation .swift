//
//  Triangulation .swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI
//https://github.com/younatics/Triangulation.git
import LSSLibrary

extension UIImage {

    func resize(size:CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.draw(in:CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let scaled : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return scaled
    }
}

struct TriangulrView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        Debug.log(UIScreen.main.bounds.size)
        
        let view = TriangulationView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width), image: UIImage(named: "sample")!)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct TestTriangulationView: View {
    var body: some View {

        
        TriangulrView()
        
    }
}

struct TestTriangulationView_Previews: PreviewProvider {
    static var previews: some View {
        TestTriangulationView()
    }
}
