//
//  CoreDataManager.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/16.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    lazy var modelName: String = "MemoData"
    
    // MARK: -- [Read]
    func getDataFromCoreData() -> [MemoData] {
        var data: [MemoData] = []
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                if let fetchData = try context.fetch(request) as? [MemoData] {
                    data = fetchData
                }
            } catch {
                print("data read fail")
            }
        }
        
        
        return data
    }
    
    // MARK: -- [Create]
    func saveData(memoText: String?, completion: @escaping () -> Void) {
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                if let data = NSManagedObject(entity: entity, insertInto: context) as? MemoData {
                    
                    data.memoText = memoText
                    data.date = Date()
                    
                    appDelegate?.saveContext()
                }
            }
        }
    }
    
    
    
    
    // MARK: -- [Delete]
    func deleteData(data: MemoData, completion: @escaping() -> Void) {
        guard let date = data.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                if let fetchedData = try context.fetch(request) as? [MemoData] {
                    if let targetMemo = fetchedData.first {
                        
                        context.delete(targetMemo)
                        
                        appDelegate?.saveContext()
                    }
                }
            } catch {
                print("delete fail")
            }
        }
    }
    
    
    
    
    
    // MARK: -- [Update]
    func updateData(newData: MemoData, completion: @escaping() -> Void) {
        guard let date = newData.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            do {
                if let fetchedData = try context.fetch(request) as? [MemoData] {
                    if var targetMemo = fetchedData.first {
                        
                        targetMemo = newData
                        
                        appDelegate?.saveContext()
                    }
                }
                
            } catch {
                print("update fail")
            }
        }
    }
    
    
    
    
    
}
