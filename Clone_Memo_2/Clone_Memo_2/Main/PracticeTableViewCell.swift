//
//  PracticeTableViewCell.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/05.
//


// 아직 정확하게 이게 뭔지는 .. 이해하지 못했음.


import UIKit

class PracticeTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    // static let cellID = "PracticeTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
}
