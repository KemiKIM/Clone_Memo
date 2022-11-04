//
//  AddViewController.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/11.
//  ComposeViewController



/*
 
 근데 메모 바로 수정하는 그런 기능은...
 
 */

import UIKit

class AddViewController: UIViewController {
    
    var addData: MemoData?

    private lazy var contentView = UIView()
    private lazy var textView: UITextView = {
       let textView = UITextView()
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        edit()
        print(#function)
    }
    
    
    private func edit() {
        if let memo = self.addData {
            
            guard let text = memo.memoText else { return }
            textView.text = text
            print("44")
        } else {
            print("55")
        }
    }
    
    
    
    private func configure() {
        configureContentView()
        configureTextView()
        configureBarButton()
        
    }
    
    
    private func configureContentView() {
        self.view.addSubview(self.contentView)
        
        self.contentView.backgroundColor = .systemBrown
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.contentView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            //self.textView.heightAnchor.constraint(equalToConstant: 300)
        ])
     //
        
    }
     

    
    private func configureTextView() {
        self.contentView.addSubview(self.textView)
        
        self.textView.backgroundColor = .systemGray3
        
        //self.textView.textContainerInset = UIEdgeInsets(top: 16, left: 18, bottom: 16, right: 18)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            self.textView.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.textView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            self.textView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8)
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
            print("save")
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
           
             // 180 이하일때는 더 이상 줄어들지 않게하기
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

