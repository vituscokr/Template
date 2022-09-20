//
//  SampleButtonView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI

struct SampleButtonView: View {
    @State var primaryDisabled = false
    var body: some View {
        VStack {
            Button("Button") {
                primaryDisabled.toggle()
            }
            .buttonStyle( PrimaryButton() )
            .disabled(primaryDisabled )
            Button("Button") {
                primaryDisabled.toggle()
            }
            .buttonStyle( SecnondaryButton() )
            .disabled(primaryDisabled )
            Button("Button") {
                primaryDisabled.toggle()
            }
            .buttonStyle( DarkButton() )
            .disabled(primaryDisabled )
        }
    }
}

struct SampleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SampleButtonView()
    }
}
