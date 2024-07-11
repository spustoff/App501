//
//  HomeView.swift
//  App501
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(viewModel.balance)")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("Your balance")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .padding(20)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                
                HStack {
                    
                    Image("up")
                    
                    Text(viewModel.double2)
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        ForEach(viewModel.valutes, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentValute = index
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Text(viewModel.currentValute)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                            
                        }
                    })
                    
                    Spacer()
                    
                    Image("down")
                    
                    Text(viewModel.double1)
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentType = index
                            viewModel.fetchCollections()
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(viewModel.currentType == index ? 1 : 0)))
                                .padding(2)
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.3)))
                
                if viewModel.collections.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                        
                        Text("There is nothing in your collection")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))

                                
                                Text("Add")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            }
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 5).padding(4))
                    
                    Spacer()
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.collections, id: \.self) { index in
                        
                        VStack {
                            
                            HStack {
                                
                                Image(index.colPhoto ?? "")
                                    .resizable()
                                    .frame(width: 65, height: 65)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(index.colName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Text(index.colCat ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    
                                    Text("$ \(index.colPurchase ?? "")")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    HStack {
                                        
                                        Text(index.colPrice ?? "")
                                            .foregroundColor(viewModel.currentType == "Profit" ? .green : .red)
                                        
                                        Image(index.colStrelka ?? "")
                                    }
                                }
                            }
                            
                            Rectangle()
                                .fill(.gray.opacity(0.4))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCollections()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCollection(viewModel: CollectionViewModel())
        })
    }
}

#Preview {
    HomeView()
}
