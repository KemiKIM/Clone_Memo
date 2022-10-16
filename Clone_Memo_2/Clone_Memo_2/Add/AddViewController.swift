//
//  AddViewController.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/11.
// ComposeViewController

import UIKit

class AddViewController: UIViewController {

    private lazy var contentView = UIView()
    private lazy var textView: UITextView = {
       let textView = UITextView()
        
        //textView.frame = CGRect(x: 10, y: 100, width: 350, height: 170)
        
        textView.translatesAutoresizingMaskIntoConstraints = false

        textView.delegate = self
        textView.contentInsetAdjustmentBehavior = .automatic
        
        return textView
    }()
    
    let memoManager = CoreDataManager.shared

        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        configure()

    }
    
    
    private func configure() {
        configureTextView()
        configureBarButton()
        
    }
    
    /*
    private func configureContentView() {
        self.view.addSubview(self.contentView)
        
        self.contentView.backgroundColor = .systemGray6
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
     
     //
        
    }
     */

    
    private func configureTextView() {
        self.view.addSubview(self.textView)
        
        self.textView.backgroundColor = .systemGray3
        
        self.textView.textContainerInset = UIEdgeInsets(top: 16, left: 18, bottom: 16, right: 18)
        
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.textView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.textView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            //self.textView.heightAnchor.constraint(equalToConstant: 300)
        ])
         
        
    }
    
    
    
    private func configureBarButton() {
        let rightBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.barButtonTapped))
            self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    // 저장 method 구현
    @objc func barButtonTapped() {
        guard let memo = textView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요.")
            return
        }
        
        let memoText = textView.text
        memoManager.saveData(memoText: memoText) {
            print("?????")
        }
        
        
        NotificationCenter.default.post(name: AddViewController.newMemoDidInsert, object: nil)
        
        self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    

// MARK: -- --------------------------
}
// MARK: -- --------------------------



extension AddViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}



// uitextview height를 contents height와 같게 하기.
extension AddViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
           
           let size = CGSize(width: view.frame.width, height: .infinity)
           let estimatedSize = textView.sizeThatFits(size)
           
           textView.constraints.forEach { (constraint) in
           
             /// 180 이하일때는 더 이상 줄어들지 않게하기
               if estimatedSize.height <= 180 {
               
               }
               else {
                   if constraint.firstAttribute == .height {
                       constraint.constant = estimatedSize.height
                   }
               }
           }
       }
}

