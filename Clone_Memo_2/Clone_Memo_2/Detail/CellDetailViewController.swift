//
//  CellDetailViewController.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/12.
//

import Foundation
import UIKit

class CellDetailViewController: UIViewController {
    static var identifier: String { return String(describing: self) }
    
    private lazy var tableView = UITableView()
    
    var memo: Memo?
    
    private lazy var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        layout()
    }



    private func layout() {
        layoutTableView()
    }
    
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: MemoCell.identifier)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: DateCell.identifier)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }



}

extension CellDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // 2개의 셀을 한 테이블 뷰에 넣는 방법.
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DateCell.identifier, for: indexPath)
            
            cell.textLabel?.text = formatter.string(for: memo?.contentDate)
            cell.textLabel?.textColor = .lightGray
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.identifier, for: indexPath)
            
            cell.textLabel?.text = memo?.content
            //cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            
            
            return cell
           
        default:
            fatalError()
        }
    }
}





