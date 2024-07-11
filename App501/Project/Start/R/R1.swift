//
//  R1.swift
//  App501
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("The ability to edit")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("All data will be saved")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
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
    R1()
}
