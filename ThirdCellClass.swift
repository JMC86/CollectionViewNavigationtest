//
//  ThirdCellClass.swift
//  CollectionScrollProject
//
//  Created by James McAdam on 20/06/2021.
//

import UIKit

class ThirdCellClass: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(classLbl)
        classLbl.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
        classLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        classLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    var onLoginButtonCallBack: ((String, Int) -> Void)?
    
    let classLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Third Cell"
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: "Hiragino Sans", size: 20)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        
        return lbl
    }()

    
}
