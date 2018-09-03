//
//  JsoncontrollerViewController.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 23/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable {
    let name:String
}
class JsoncontrollerViewController: UIViewController  {
    
    @IBOutlet weak var tableview: UITableView!
    var arrdata = [jsonstruct]()
    @IBOutlet weak var searchbar: UISearchBar!
    var currarrdata = [String]()
    var seccurrarrdata = [String]()
    var i:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
        for _ in self.arrdata
        {
            self.i = self.i + 1
            self.currarrdata.append(self.arrdata[self.i].name)
            
        }
        seccurrarrdata = currarrdata
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Slice.png")!)

    }
    func loaddata() {
        let url :String = "https://restcountries.eu/rest/v2/all"
        guard let url2 = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url2) { (data, response, error) in
            do{
                if error == nil{
                    let decoder = JSONDecoder()
                    self.arrdata = try decoder.decode([jsonstruct].self, from: data!)
                    
                    print("arrdata" , self.arrdata[0].name)
                   
                    for _ in self.arrdata{
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                        
                    }
                }
                
            }catch{
                print("Parsing the json error")
            }
            
            }.resume()
    }
}
extension JsoncontrollerViewController : UISearchBarDelegate
{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            seccurrarrdata = currarrdata
            tableview.reloadData()
            return

        }

        seccurrarrdata = currarrdata.filter({animal -> Bool in
             animal.lowercased().contains(searchText.lowercased())
            
        })
        tableview.reloadData()
        
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {

    }
}
extension JsoncontrollerViewController : UITableViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/7.0
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?)->Int {
        return self.arrdata.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:JsoncellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! JsoncellTableViewCell
        cell.lablename.text = "Name : \(arrdata[indexPath.row].name)"
        cell.backgroundColor = .clear
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Slice"))
        self.tableview.backgroundView = imageView
        return cell
    }
}
