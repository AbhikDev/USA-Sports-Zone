//
//  AccountVC.swift
//  WilCity
//
//  Created by Mahesh Mahalik on 26/06/20.
//  Copyright © 2020 Mahesh Mahalik. All rights reserved.
//

import UIKit
struct HomeSections {
    var key:String?
    var value:String?
    var object:Any?
}
class MoreVC: BaseVC {
   
    var isNewMessage :Int = 0
    var tempCate:[HomeSections] = []
    @IBOutlet weak var tableMore: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgviewProfile: UIImageView!
    @IBOutlet weak var imgviewCover: UIImageView!
   
    fileprivate func setupTable() {
        let section1 = HomeSections.init(key: "\u{f007}", value: "About Us", object: nil)
        let section2 = HomeSections.init(key: "\u{f0e0}", value: "Terms & Condition", object: nil)
        let section3 = HomeSections.init(key: "\u{f0f3}", value: "Privacy Policy", object: nil)
        let section4 = HomeSections.init(key: "\u{f004}", value: "Contact Us", object: nil)
        tempCate = [section1,section2,section3,section4]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTable()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 3
            childVC.tabBarCollectionView.reloadData()
        }
        
    }
    
}
extension MoreVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempCate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        cell.lblName.text = tempCate[indexPath.row].value
        cell.lblImage.text = tempCate[indexPath.row].key ?? ""
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
       
    
   
    
}
