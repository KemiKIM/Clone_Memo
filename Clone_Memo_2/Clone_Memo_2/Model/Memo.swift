//
//  Memo.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/05.
//

import Foundation


class Memo {
    
    var content: String
    var contentDate: Date
    
    
    init(content: String) {
        self.content = content
        contentDate = Date()
    }
    
    static var dummyData = [
        Memo(content: "test")
    ]
    
}
