//
//  ViewController.swift
//  TableviewMethos
//
//  Created by aravind-pt2199 on 22/08/18.
//  Copyright © 2018 aravind-pt2199. All rights reserved.
//

import UIKit

struct  songs {
    let name:String
    let title:String
}

class ViewController: UIViewController{
    
    var datasource : Any = [
        songs(name:"Araivnd",title:"Develoepr"),
        songs(name:"Araivnd",title:"Develoepr"),
        songs(name:"Araivnd",title:"Develoepr")]
    private var number : Int = 0
    var name = ["Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.", "Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.", "Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.","Aravind", "AravindAravindAravindAravindAravindhanaravindarqavinvasdadasdsdAravindAravindAravindAravindAravindhanaravindarqavinvasdadasdsdAravindAravindAravindAravindAravindhanaravindarqavinvasdadasdsdAravindAravindAravindAravindAravindhanaravindarqavinvasdadasdsd", "Kumar","Aravind", "Bala", "Kumar","Aravind", "Bala", "Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time."]
    var title2 = ["Tamil" , "English" , "Malayalam","Tamil", "English", "Malayalam","Tamil" , "English" , "Malayalam","Tamil", "English", "Malayalam"]
    private var lastContentOffset: CGFloat = 0
    
    @IBOutlet weak var tblview: UITableView!
    let maxHeaderHeight: CGFloat = 69;
    let minHeaderHeight: CGFloat = 44;
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.dataSource = self
        tblview.delegate = self
        tblview.register(UINib(nibName: "Tablecells", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        tblview.estimatedRowHeight = 74
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Slice.png")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func constructcell(cellModel:Any ,tableview:UITableView) ->UITableViewCell
    {
        var cell = UITableViewCell()
        switch cellModel {
        case let songmodel as songs:
            if let songcell = tableview.dequeueReusableCell(withIdentifier: "cell") as? Tablecells {
                songcell.config(name2: songmodel.name, title2: songmodel.title)
                cell = songcell
                return cell
            }
        default:
            
            print ("default")
        }
        
        return cell
    }
    
    
    @IBAction func addrow(_ sender: Any) {
        
        print(name,title2)
        
        
        self.name.insert("Aravind" , at: 0)
        self.title2.insert("Datanew" , at: 0)
        self.tblview.beginUpdates()
        self.tblview.insertRows(at: [IndexPath.init(row:0, section: 0)], with: UITableViewRowAnimation.left)
        self.tblview.endUpdates()
    }
    
    
    @IBAction func jsontable(_ sender: Any) {
        let detail:JsoncontrollerViewController = self.storyboard?.instantiateViewController(withIdentifier: "JsoncontrollerViewController") as! JsoncontrollerViewController
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    @IBAction func collectionbutton(_ sender: Any) {
        let collection:CollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        self.navigationController?.pushViewController(collection, animated: true)
    }
    
    
}

extension ViewController : UITableViewDelegate
{
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headercell = Bundle.main.loadNibNamed("Headcell", owner: self, options: nil)?.first as! Headcell
        headercell.headerlabel.text = "Aravind"
        headercell.backgroundColor = UIColor.blue
        return headercell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 69
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view: Detailsviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Detailsviewcontroller") as! Detailsviewcontroller
        self.navigationController?.pushViewController(view, animated: true)
        if (name.count > indexPath.row && title2.count > indexPath.row)
        {
            view.name4 = name[indexPath.row]
            view.title4 = title2[indexPath.row]
            
        }
        else {return }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        
        if(number < indexPath.row){
            cell.transform = CGAffineTransform(scaleX: 100.8, y: 100.8)
            UIView.animate(withDuration: 0.4) {
                cell.transform = CGAffineTransform.identity
            }
            print("Animate", indexPath.row)
            
        }
        else{
            print("Not animate" , indexPath.row)
        }
        number = indexPath.row
    }
 }

extension ViewController : UITableViewDataSource   {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height : CGFloat = 69
        return height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            
            let shareMenu = UIAlertController(title: nil, message: "Sample POP", preferredStyle: .actionSheet)
            
            let twitterAction = UIAlertAction(title: "Swip1", style: UIAlertActionStyle.default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            
            self.present(shareMenu, animated: true, completion: nil)
        })
        
        
        return [shareAction]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Tablecells
        cell2?.config(name2: name[indexPath.row], title2: title2[indexPath.row])
        let content = name[indexPath.row]
        let content2 = title2[indexPath.row]
        cell2?.name.text = content
        cell2?.title.text = content2
        cell2?.backgroundColor = UIColor.white
        return cell2!
    }
    
}

