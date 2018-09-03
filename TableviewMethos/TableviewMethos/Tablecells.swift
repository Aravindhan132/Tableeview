//
//  Tablecells.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 22/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import UIKit

class Tablecells: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func config(name2:String , title2:String){
        name.text = name2
        title.text = title2
    }
    
}
