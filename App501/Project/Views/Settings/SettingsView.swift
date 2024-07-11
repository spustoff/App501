//
//  SettingsView.swift
//  App501
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()

                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 12) {

                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Rate Us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding(25)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/9bc58d3f-c3c1-44ff-985e-ac8255b0b5bc") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(spacing: 12) {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding(25)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
