//
//  ViewController.swift
//  CollectionScrollProject
//
//  Created by macbook on 09/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Goto New", for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont(name: "Hiragino Sans", size: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(handleCheck), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleCheck() {
        let new = MultiCellTest(collectionViewLayout: UICollectionViewFlowLayout())
        let nav = UINavigationController(rootViewController: new)
        nav.modalTransitionStyle = .coverVertical
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    var totalScreend:[Int] = [1,2,3]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        btnNext.isHidden = true
        
        view.addSubview(viewBtn)
        viewBtn.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: -10, paddingRight: -10, width: 0, height: 100)
    }

    func registerCell(){
        collectionView.register(UINib(nibName: "SignUpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SignUpCollectionViewCell")
        collectionView.register(UINib(nibName: "LoginCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LoginCollectionViewCell")
    }
/*
    func scrollToNext(){
        guard let indexPath = collectionView.indexPathsForVisibleItems.first.flatMap({
               IndexPath(item: $0.row + 1, section: $0.section)
           }), collectionView.cellForItem(at: indexPath) != nil else {
               return
           }
        if  indexPath.row > totalScreend.count {
            return
        }
           collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    func scrollBack(){
        guard let indexPath = collectionView.indexPathsForVisibleItems.first.flatMap({
               IndexPath(item: $0.row - 1, section: $0.section)
           }), collectionView.cellForItem(at: indexPath) != nil else {
               return
           }
        if indexPath.row < 0 {
            return
        }
           collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
       
    }
    
    @IBAction func buttonNextPressed(_ sender: Any) {
       // collectionView.scrollToNextItem(count: totalScreend.count)
    }
*/
    
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalScreend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoginCollectionViewCell", for: indexPath) as! LoginCollectionViewCell
            cell.onLoginButtonCallBack = {
                [weak self] (text, pageNumber) in
                print(text)
                DispatchQueue.main.async {
                    self?.collectionView.scrollToNextItem(count: self?.totalScreend.count ?? 0,pageNo: pageNumber)
                }
            }
            
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUpCollectionViewCell", for: indexPath) as! SignUpCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignUpCollectionViewCell", for: indexPath) as! SignUpCollectionViewCell
            cell.backgroundColor = .gray
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: collectionView.frame.size.width, height:  collectionView.frame.size.height)
    }
    /*
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      
     
    }
    */
}

extension UICollectionView {
    func scrollToNextItem(count: Int,pageNo: Int) {
        guard let indexPath = self.indexPathsForVisibleItems.first.flatMap({
            IndexPath(item: $0.row, section: $0.section)
        }) else {
            return
        }
        
        if indexPath.row == count - 1 {
            let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
            self.moveToFrame(contentOffset: contentOffset)
        } else {
            let contentOffset = CGFloat(floor(self.contentOffset.x + CGFloat(pageNo)*(self.bounds.size.width)))
            self.moveToFrame(contentOffset: contentOffset)
        }
    }
    
    func moveToFrame(contentOffset: CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: false)
    }
}
