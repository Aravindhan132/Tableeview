//
//  CollectionViewCell.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 23/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    
    
}
extension UIImageView{
    var circled : UIImageView{
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
        self.clipsToBounds = true
        return self
    }
}
