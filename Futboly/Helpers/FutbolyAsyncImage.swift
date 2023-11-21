//
//  FutbolyAsyncImage.swift
//  Futboly
//
//  Created by Andrei Tanc on 21.11.2023.
//

import SwiftUI
import Kingfisher

struct FutbolyAsyncImage: View {
    @State var imageUrlString: String
    var size: CGFloat = 60
    
    var body: some View {
        KFImage(URL(string: imageUrlString))
            .placeholder {
                Image(.defaultProfile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(.rect(cornerRadius: 18))
                    .padding(.trailing, 5)
            }.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(.rect(cornerRadius: 18))
            .padding(.trailing, 5)
    }
}

#Preview {
    FutbolyAsyncImage(imageUrlString: "")
}
