//
//  DateCell.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/12.
//

import Foundation
import UIKit

class DateCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    // static let cell = "DateCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
}
