//
//  TestViewController2.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/21.
//

import UIKit

protocol Pro1: AnyObject {
    func abc()
}


class TestViewController2: UIViewController {
    
    var delegate: Pro1?
    
    
    
    private lazy var settingView = UIView()
    private lazy var rightBottomButton: UIButton = {
        let rightBottomButton = UIButton(type: .system)
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        let image = UIImage(systemName: "timelapse", withConfiguration: imageConfig)
        
        rightBottomButton.setImage(image, for: .normal)
        rightBottomButton.tintColor = .purple
        rightBottomButton.alpha = 1
        
        rightBottomButton.addTarget(self, action: #selector(dismissTapped(sender:)), for: .touchUpInside)
        
        return rightBottomButton
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

  
        
        
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let vc = TestViewController1()
        vc.rightBottomButton.alpha = 1
        
        delegate?.abc()
        print("Test2 DidDisappear")
    }
    
    
    
    
    // MARK: @objc Action
    @objc private func dismissTapped(sender: UIButton) {
        animateView(sender)
        
        print(#function)
    }
    
    
    fileprivate func animateView(_ viewToAnimate: UIView) {

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
        
        //
        
            self.dismiss(animated: true)
            let vc = TestViewController1()
            vc.rightBottomButton.isHidden = false
        
        
        
    }
    
    
    
    
    
    
// MARK: =====================
    
}

// MARK: =====================



// MARK: Layout
extension TestViewController2 {
    
    
    private func layout() {
        layoutSettingView()
        layoutSettingButton()
    }
    
    
    
    // SettingView
    private func layoutSettingView() {
        self.view.addSubview(self.settingView)
        
        self.settingView.backgroundColor = .systemGray2
        self.settingView.alpha = 0.5
        
        self.settingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.settingView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.settingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.settingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.settingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
    // SettingButton
    private func layoutSettingButton() {
        self.settingView.addSubview(self.rightBottomButton)
        
        self.rightBottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.rightBottomButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.rightBottomButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}
    
    
    
    

 
