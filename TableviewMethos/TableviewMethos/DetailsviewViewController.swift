//
//  DetailsviewViewController.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 22/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import UIKit

class DetailsviewViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var title3: UILabel!
    
    var details : Any?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let songs = details as? songs{
            name.text = songs.name
            title3.text = songs.title
        }
        
        
     }

    
    
 

}
