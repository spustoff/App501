//
//  AddCollection.swift
//  App501
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct AddCollection: View {

    @StateObject var viewModel: CollectionViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Collection")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.pictures, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPic = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPic.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 36, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 240)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.3)))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentPic)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 240)
                            }
                        })
                        .padding()
                        
                        Menu(content: {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentCategory = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                if viewModel.currentCategory.isEmpty {
                                    
                                    Text("Category")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                } else {
                                    
                                    Text(viewModel.currentCategory)
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray.opacity(0.4))
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.colName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.colName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        .padding(1)
                        
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
                                
                                Spacer()

                            }
                        })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Purchase")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.colPurchase.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.colPurchase)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Price change")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.colPrice.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.colPrice)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        .padding(1)

                        HStack {
                            
                            ForEach(viewModel.strelkas, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentStrelka = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .stroke(viewModel.currentStrelka == index ? .green : .black.opacity(0.5))
                                                .frame(width: 17)
                                            
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.green)
                                                .font(.system(size: 11, weight: .regular))
                                                .opacity(viewModel.currentStrelka == index ? 1 : 0)
                                        }
                                        
                                        Image(index)
                                    }
                                    .padding(.trailing, 30)
                                })
                            }
                            
                            Spacer()
                        }
                        .padding(1)
                    }
                }
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(Color.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    })
                    
                    Button(action: {
   
                        viewModel.colPhoto = viewModel.currentPic
                        viewModel.colValute = viewModel.currentValute
                        viewModel.colStrelka = viewModel.currentStrelka
                        viewModel.colCat = viewModel.currentCategory
                        
                        if viewModel.currentStrelka == "up" {
                            
                            viewModel.colType = "Profit"
                            
                        } else if viewModel.currentStrelka == "down" {
                            
                            viewModel.colType = "Loss"
                        }
                        
                        viewModel.balance += Int(viewModel.colPrice) ?? 0
                        
                        viewModel.addCollection()
                        
                        viewModel.currentCategory = ""
                        viewModel.currentPic = ""
                        viewModel.currentStrelka = ""
                        viewModel.colName = ""
                        viewModel.colPurchase = ""
                        viewModel.colPrice = ""
                        
                        viewModel.fetchCollections()
                        
                        withAnimation(.spring()) {

                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .opacity(viewModel.currentPic.isEmpty || viewModel.currentCategory.isEmpty || viewModel.colName.isEmpty || viewModel.currentValute.isEmpty || viewModel.colPurchase.isEmpty || viewModel.colPrice.isEmpty || viewModel.currentStrelka.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentPic.isEmpty || viewModel.currentCategory.isEmpty || viewModel.colName.isEmpty || viewModel.currentValute.isEmpty || viewModel.colPurchase.isEmpty || viewModel.colPrice.isEmpty || viewModel.currentStrelka.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddCollection(viewModel: CollectionViewModel())
}
