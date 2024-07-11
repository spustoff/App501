//
//  U1.swift
//  App501
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Show your financial growth")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviewa()
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
    }
}

#Preview {
    U1()
}
