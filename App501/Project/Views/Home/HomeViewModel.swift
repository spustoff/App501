//
//  HomeViewModel.swift
//  App501
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var types: [String] = ["Profit", "Loss"]
    @Published var currentType = "Profit"

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var double1: String = String(Double(.random(in: 400...600)))
    @Published var double2: String = String(Double(.random(in: 200...900)))
    
    @Published var categories: [String] = ["Art", "Vases", "Caskets", "Furniture", "Picture"]
    @Published var currentCategory = ""
    
    @AppStorage("balance") var balance: Int = 0
    
    @Published var pictures: [String] = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10"]
    @Published var currentPic = ""
    
    @Published var valutes: [String] = ["USD", "EUR", "GBP", "AUD", "NZD", "CHF"]
    @Published var currentValute = "USD"
    
    @AppStorage("GenValute") var GenValute = "USD"
    
    @Published var strelkas: [String] = ["up", "down"]
    @Published var currentStrelka = ""
    
    @Published var colPhoto = ""
    @Published var colCat = ""
    @Published var colName = ""
    @Published var colValute = ""
    @Published var colPurchase = ""
    @Published var colPrice = ""
    @Published var colStrelka = ""

    @Published var collections: [ColModel] = []
    @Published var selectedCollection: ColModel?
    
    func addCollection() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ColModel", into: context) as! ColModel
        
        loan.colPhoto = colPhoto
        loan.colCat = colCat
        loan.colName = colName
        loan.colValute = colValute
        loan.colPurchase = colPurchase
        loan.colPrice = colPrice
        loan.colStrelka = colStrelka

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCollections() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ColModel>(entityName: "ColModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.collections = result.filter{($0.colType ?? "") == currentType}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.collections = []
        }
    }
}
