//
//  MultiCellTest.swift
//  CollectionScrollProject
//
//  Created by James McAdam on 20/06/2021.
//

import UIKit

class MultiCellTest: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var totalScreend: [Int] = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .purple
        registerCell()
    }

    func registerCell(){
        collectionView.register(LoginCellClass.self, forCellWithReuseIdentifier: loginCellID)
        collectionView.register(SignUpCellClass.self, forCellWithReuseIdentifier: signUpCellID)
    }
    
    let loginCellID = "LoginCellIID"
    let signUpCellID = "SignUpCellID"
    let thirdCellID = "ThirdCellID"

    
}

extension MultiCellTest {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalScreend.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellID, for: indexPath) as! LoginCellClass
            cell.onLoginButtonCallBack = {
                [weak self] (text, pageNumber) in
                print("Login Cell Text:", text)
                
                DispatchQueue.main.async {
                    self?.collectionView.scrollToNextItem(count: self?.totalScreend.count ?? 0,pageNo: pageNumber)
                }
            }
            
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: signUpCellID, for: indexPath) as! SignUpCellClass

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdCellID, for: indexPath) as! ThirdCellClass
            
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: collectionView.frame.size.width, height:  collectionView.frame.size.height)
    }
   
    
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
