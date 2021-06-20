//
//  SignUpCollectionViewCell.swift
//  CollectionScrollProject
//
//  Created by macbook on 09/06/2021.
//

import UIKit

class SignUpCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblSignUp: UILabel!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnBackPressed(_ sender: Any) {
    }
}
