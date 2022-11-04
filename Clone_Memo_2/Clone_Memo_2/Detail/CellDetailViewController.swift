//
//  CellDetailViewController.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/12.
//


/*
 
 어쨌든 이 celldetail이 메모작성이니깐, 앨런앱과 동일하게, if문을 사용해서 휴지통기능이 있는지 없는지만, 또한 버튼의 모양을 변화하는 그런 내용을 줘야겠다.
 
 */


// 디테일뷰에 우측 하단 버튼 2가지 버튼으로 수정, 삭제 버튼이 있었으면 좋겠다.
// 우측 맨 위에는 공유버튼
// 가운데 상단에는 상세한 날짜 정도?




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
        
        
        let abc = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonTapped))
        let dfe = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editButtonTapped))
        
        self.navigationItem.rightBarButtonItems = [abc, dfe]
        
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
    
    
    // 편집 method 구현
    @objc private func editButtonTapped() {
        
        let vc = AddViewController()
        vc.addData = memo
        self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    
    



}

extension CellDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    // cellForRowAt
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





