//
//  LoginCollectionViewCell.swift
//  CollectionScrollProject
//
//  Created by macbook on 09/06/2021.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var txtFieldUserName: UITextField!
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    var onLoginButtonCallBack:((String,Int)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func btnNextPressed(_ sender: Any) {
        print("Input:", txtFieldUserName.text)
        //String for text value to get in viewController and 2 is the page number where you want to go for specific page 
        onLoginButtonCallBack?(self.txtFieldUserName.text ?? "", 1)
    }
    
    
}
