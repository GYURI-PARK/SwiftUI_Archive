//
//  RenderedImageView.swift
//  ImageRendering
//
//  Created by GYURI PARK on 2023/05/13.
//

import SwiftUI

struct RenderedImageView: View {
    @Binding var renderedImage: Image?
    var body: some View {
        if let renderedImage {
            renderedImage
                .resizable()
                .scaledToFit()
                .frame(width: 325)
        } else {
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 275, height: 275)
                .foregroundColor(.accentColor)
        }
    }
}

struct RenderedImageView_Previews: PreviewProvider {
    static var previews: some View {
        RenderedImageView(renderedImage: .constant(nil))
    }
}
