//
//  NotiTestViewController2.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/26.
// 
// 전달을 '받는' 뷰 / push로 받는 뷰
import UIKit

class NotiTestViewController2: UIViewController {
  
    private lazy var button1 : UIButton = {
       let t = UIButton()
        
        t.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return t
    }()
    
    
    
    lazy var button2 : UIButton = {
        let t = UIButton(type: .system)
        
        //t.addTarget(self, action: #selector(move1), for: .touchUpInside)
        
        return t
    }()
    
    
    
  
    
    @objc func testmove1() {
        //button2.addTarget(self, action: #selector(move1), for: .touchUpInside)
    }
    
    func move1() {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        layout()
        
        NotificationCenter.default.addObserver(forName: NotiTestViewController3.test1, object: nil, queue: OperationQueue.main) { [weak self](noti) in
            
            self?.move1()
            
        }
        
    }
    
   
    
    
    
    @objc private func buttonTapped() {
        
        let vc = NotiTestViewController3()
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
        
        
        
    }
    
    
    
    
    
    
    
    
    private func layout() {
        self.view.addSubview(self.button1)
        
        self.button1.backgroundColor = .red
        
        self.button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        
        
        self.view.addSubview(self.button2)
        
        self.button2.backgroundColor = .blue
        
        self.button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.button2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            self.button2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40)
        ])
    }
    
}



