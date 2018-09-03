//
//  Detailviewcontroller.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 22/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import Foundation
import UIKit
class Detailsviewcontroller : UIViewController
{
    
    @IBOutlet weak var name3: UILabel!
    
    @IBOutlet weak var title3: UILabel!
    var name4:String!
    var title4:String!
    var detailmode :Any?
    
    override func viewDidLoad() {
         super.viewDidLoad()
     name3.text = name4
     title3.text = title4
     print("getting data", name3.text ?? "Not receive")
    }
}
