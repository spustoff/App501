//
//  R2.swift
//  App501
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Convenient operation")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("All in one place")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    R2()
}
