//
//  CoreDataManager.swift
//  Dox
//
//  Created by Bia Plutarco on 29/05/19.
//  Copyright © 2019 Bia Plutarco. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    static let sharedManager = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Dox")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var allDebts: [Debt] = {
        let allDebts: [Debt] = []
        return allDebts
    }()
    
    private init() {}
    
    func saveDebt(name: String, reason: String, value: String, type: DebtType) -> Debt {
        let debt = Debt(context: persistentContainer.viewContext)
        debt.name = name
        debt.reason = reason
        debt.value = value
        debt.type = type.rawValue
        saveContext()
        return debt
    }
    
    func getDebtsFrom(type: DebtType) -> [Debt] {
        do {
            allDebts = try persistentContainer.viewContext.fetch(NSFetchRequest<Debt>(entityName: "Debt"))
        } catch {
            allDebts = []
            print("error get debts")
        }
        let debts = allDebts.filter { (debt) -> Bool in
            debt.type == type.rawValue
        }
        return debts
    }
    
    func deleteDebt(_ debt: Debt) {
        persistentContainer.viewContext.delete(debt)
        saveContext()
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
