//
//  BookContainerView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/20.
//

import SwiftUI

struct BookContainerView: View {
    @StateObject var book  = Book()
    
    var body: some View {
        
        BookView(model: book)
    }
}

struct BookContainerView_Previews: PreviewProvider {
    static var previews: some View {
        BookContainerView()
    }
}
