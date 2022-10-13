//
//  MemoCell.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/13.
//

import Foundation
import UIKit

class MemoCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    // static let cell = "MemoCell"
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
}
