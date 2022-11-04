//
//  PracticeTableViewCell.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/05.
//


// 아직 정확하게 이게 뭔지는 .. 이해하지 못했음.


import UIKit

class PracticeTableViewCell: UITableViewCell {
    // static let cellID = "PracticeTableViewCell"
    
    // static var identifier: String { return String(describing: self) }
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    // 이거 뭔가 get set method에 대해 정확한 이해가 먼저 필요한 것 같다.
    
    // style을 .value1으로 설정함으로 인해 셀 우측에 날짜가 나오도록 설정함
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    

    
}
