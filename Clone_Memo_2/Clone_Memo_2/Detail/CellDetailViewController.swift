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
    
    var memo: MemoData?
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        naviCustom()
        layout()
    }
    
    
    private func naviCustom() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .red
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
    
    
    // 삭제 method 구현
    @objc private func trashButtonTapped() {
        let alert = UIAlertController(title: "삭제 확인", message: "메모를 삭제하시겠어요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "삭제", style: .destructive)
        { [ weak self ] (action) in
            // 삭제 method 구현
            if let delete = self?.memo {
                CoreDataManager.shared.deleteData(data: delete) {
                    print("123")
                }
            }
          
            // 삭제 후 다시 리스트로 돌아가기
            self?.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
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
            
            cell.textLabel?.text = memo?.dateString
            cell.textLabel?.textColor = .lightGray
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MemoCell.identifier, for: indexPath)
            
            cell.textLabel?.text = memo?.memoText
            //cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            
            
            return cell
           
        default:
            fatalError()
        }
    }
}





