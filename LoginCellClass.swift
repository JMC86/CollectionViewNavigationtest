//
//  LoginCellClass.swift
//  CollectionScrollProject
//
//  Created by James McAdam on 20/06/2021.
//

import UIKit

class LoginCellClass: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        let stack = UIStackView(arrangedSubviews: [loginTextField, index1Btn, index2Btn])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 30
        
        addSubview(stack)
        stack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 180)
        stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    var onLoginButtonCallBack: ((String, Int) -> Void)?
    
    let loginTextField: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.font = UIFont(name: "Hiragino Sans", size: 16)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.backgroundColor = .white
        tf.textColor = .black
        
        return tf
    }()
    
    let index1Btn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Goto Index 1", for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont(name: "Hiragino Sans", size: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(handleIndex1), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleIndex1() {
        print("Initial:", loginTextField.text!)
        //guard let loginText = loginTextField.text else { return }
        let loginText = loginTextField.text
        print("Input:", loginText)
        onLoginButtonCallBack?(loginText ?? "", 1)
    }
    
    let index2Btn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Goto Index 2", for: .normal)
        button.backgroundColor = UIColor.green
        button.titleLabel?.font = UIFont(name: "Hiragino Sans", size: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(handleIndex2), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleIndex2() {
        //guard let loginText = loginTextField.text else { return }
        let loginText = loginTextField.text
        print("Input:", loginText)
        onLoginButtonCallBack?(loginText ?? "", 2)
    }
    
    
}
