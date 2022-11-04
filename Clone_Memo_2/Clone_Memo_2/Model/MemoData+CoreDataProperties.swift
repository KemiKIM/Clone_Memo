//
//  MemoData+CoreDataProperties.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/16.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var memoText: String?

    var dateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yy.MM.dd"
        guard let date = self.date else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
}

extension MemoData : Identifiable {

}
