//
//  CollectionViewController.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 23/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import UIKit

 
class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionview?.delegate = self
        self.collectionview?.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Slice.png")!)
       
        
         // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
}

 
extension CollectionViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 349   , height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! CollectionViewCell
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Slice"))
        self.collectionview.backgroundView = imageView
        let image = UIImage(named: "header")
        cell.imageview!.image = image
        cell.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 2.0
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.opacity = 10
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    
}
