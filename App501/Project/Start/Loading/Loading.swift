//
//  Loading.swift
//  App501
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct Loading: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    Loading()
}
