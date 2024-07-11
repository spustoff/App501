//
//  Reviewa.swift
//  App501
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import StoreKit

struct Reviewa: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .background(Color.white)
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviewa()
}
