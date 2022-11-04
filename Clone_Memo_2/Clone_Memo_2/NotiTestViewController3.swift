//
//  NotiTestViewController3.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/26.
//
// 전달을 '하는' 뷰 / present로 받는 뷰
import UIKit



class NotiTestViewController3: UIViewController {
    
    
    private lazy var button1 : UIButton = {
       let t = UIButton()
        
        t.addTarget(self, action: #selector(mainTapped), for: .touchUpInside)
        
        return t
    }()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        layout()
    }
    
    
    @objc private func mainTapped() {
        

        self.dismiss(animated: true)
        
        NotificationCenter.default.post(name: NotiTestViewController3.test1, object: nil)
        
        
    }

    
    
    private func layout() {
        self.view.addSubview(self.button1)
        
        self.button1.backgroundColor = .orange
        
        self.button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
   
    }
    
}


extension NotiTestViewController3 {
    static let test1 = Notification.Name(rawValue: "test")
}
