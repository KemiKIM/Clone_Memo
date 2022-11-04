//
//  NotiTestViewController1.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/26.
//
// 루트 뷰
import UIKit

class NotiTestViewController1: UIViewController {
    
    private lazy var button1 : UIButton = {
       let t = UIButton()
        
        t.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return t
    }()
    
    
    private lazy var view1 = UIView()
    private lazy var view2 = UIView()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        layout()
        layoutTest()
    }
    
    @objc private func buttonTapped() {
        let vc = NotiTestViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func layout() {
        self.view1.addSubview(self.button1)
        
        self.button1.backgroundColor = .black
        
        self.button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.button1.centerXAnchor.constraint(equalTo: self.view1.centerXAnchor),
            self.button1.centerYAnchor.constraint(equalTo: self.view1.centerYAnchor)
        ])
    }
    
    
    private func layoutTest() {
        self.view.addSubview(view1)
        
        self.view1.translatesAutoresizingMaskIntoConstraints = false
        
        self.view1.backgroundColor = .yellow
        
        
        self.view1.layer.borderWidth = 10
        self.view1.layer.borderColor = UIColor.red.cgColor
        
        
        
        NSLayoutConstraint.activate([
            
            
            self.view1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.view1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.view1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.view1.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100)
            
        ])
        
        
        
    }
    
    
}
