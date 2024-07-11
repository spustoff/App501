//
//  CollectionView.swift
//  App501
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel = CollectionViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Collection")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    })
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategory = index
                                viewModel.fetchCollections()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.currentCategory == index ? .white : .black)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding()
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentCategory == index ? Color("prim") : .white))
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                    .padding(1)
                            })
                        }
                    }
                }
                .frame(height: 60)
                
                if viewModel.collections.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                        
                        Text("There is nothing in your collection")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 5).padding(4))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.collections, id: \.self) { index in
                                
                                VStack {
                                    
                                    Image(index.colPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 130)
                                    
                                    HStack {
                                        
                                        Text(index.colCat ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text(index.colCat ?? "")
                                            .foregroundColor(.gray.opacity(0.3))
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("$\(index.colPurchase ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("$ \(index.colPrice ?? "")")
                                            .foregroundColor(.green)                        .font(.system(size: 16, weight: .medium))
                                        
                                        Image(index.colStrelka ?? "")
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5).padding(4))
                            }
                        })
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCollections()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCollection(viewModel: viewModel)
        })
    }
}

#Preview {
    CollectionView()
}
