//
//  GameRowView.swift
//  Futboly
//
//  Created by Andrei Tanc on 22.11.2023.
//

import SwiftUI

struct GameRowView: View {
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            VStack(spacing: 0) {
                Image(.teamDefault)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 35)
                    .padding(.bottom, 5)
                
                Text("Real Madrid").font(.system(size: 15))
            }
            
            Spacer(minLength: 0)
            VStack(spacing: 10) {
                Text("7:30 PM").font(.system(size: 16))
                Text("7 August").font(.system(size: 14, weight: .medium)).foregroundStyle(.gray)
            }
            Spacer(minLength: 0)
            
            VStack(spacing: 0) {
                Image(.teamDefault)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 35)
                    .padding(.bottom, 5)
                
                Text("Real Madrid").font(.system(size: 15))
            }
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    GameRowView()
}
