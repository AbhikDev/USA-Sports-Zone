//
//  HomeVC.swift
//  USA Sport Zone
//
//  Created by User on 18/04/21.
//

import UIKit

class HomeVC: UIViewController {

    var arrAllData : Array<Array<[String:Any]>> = []
    @IBOutlet weak var tableHome: UITableView!
    //var userModel : ModelUser!
    override func viewDidLoad() {
        super.viewDidLoad()
          tableHome.contentInsetAdjustmentBehavior = .never
            arrAllData.removeAll()
            arrAllData.append([]) // 0 for Banner product
            arrAllData.append([]) // 1 for Category product
            arrAllData.append([]) // 1 productDASHBOARD_SECTION_SEARCH
            arrAllData.append([]) // 2 for Best Offer
           
            let cellNib = UINib(nibName: "SingleImageLblCell", bundle: nil)
            self.tableHome.register(cellNib, forCellReuseIdentifier: "SingleImageLblCell")
            
            self.tableHome.register(UINib(nibName: "MainProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMainProduct")
            
            //self.tableHome.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
            var frame = CGRect.zero
            frame.size.height = .leastNormalMagnitude
            tableHome.tableHeaderView = UIView(frame: frame)
            // Do any additional setup after loading the view.
            
            //////get User Modeland Initialize value
        
        // Do any additional setup after loading the view.
        var data : Array<[String:Any]> = []
        for _ in 1...5 {
            var param1:[String:AnyObject] = [String:AnyObject]()
            param1["banner_image"] =  "AppLogo" as AnyObject
            data.append(param1)
        }
       arrAllData[0] = data
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 0
            childVC.tabBarCollectionView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arrAllData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        ////TopCollCell
        case DashboardSection.DASHBOARD_SECTION_HIGHLITE.rawValue:
            return 200
        case DashboardSection.DASHBOARD_SECTION_FEATURED.rawValue:
            return 100 //160
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue:
            return 160
        case DashboardSection.DASHBOARD_SECTION_TOP.rawValue:
            let productCount =  90
            return CGFloat((productCount / 2 * 100))
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleImageLblCell", for: indexPath) as? SingleImageLblCell
            {
                cell.backgroundColor = .black
                cell.cellConfigure(arrDataSet: arrAllData[0])
                cell.collectionView.reloadData()
                cell.selectionStyle = .none
                return cell
                
            }
        }else{
            let cell: MainProductTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cellMainProduct", for: indexPath) as? MainProductTableViewCell
            cell.backgroundColor = .white
            var rc =  cell.collMainProduct.frame
            cell.indexPathForCell = indexPath.section
            //cell.delegate = self
            cell.backgroundColor = .white
            if indexPath.section == DashboardSection.DASHBOARD_SECTION_FEATURED.rawValue {
                rc.size.height = cell.collMainProduct.contentSize.height
                cell.cellConfigure(arrDataSet: arrAllData[1])
                cell.collMainProduct.frame = rc
                if let layout = cell.collMainProduct.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
                }
                cell.collMainProduct.backgroundColor = .white
                cell.collMainProduct.bounces = false
               
            }
            else if indexPath.section == DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue {
                rc.size.height = cell.collMainProduct.contentSize.height
                cell.backgroundColor = UIColor(named: "AppLightGrayColor")
                cell.collMainProduct.frame = rc
                if let layout = cell.collMainProduct.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                }
                cell.collMainProduct.bounces = true
                cell.cellConfigure(arrDataSet: arrAllData[2])
            }
            else if indexPath.section == DashboardSection.DASHBOARD_SECTION_TOP.rawValue {
                rc.size.height = cell.collMainProduct.contentSize.height
                
                cell.collMainProduct.frame = rc
                if let layout = cell.collMainProduct.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                }
                cell.collMainProduct.bounces = true
                cell.cellConfigure(arrDataSet: arrAllData[3])
            }
            else {
                rc.size.height = 100
                if let layout = cell.collMainProduct.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
                }
                cell.collMainProduct.bounces = true
            }
            //cell.layoutSubviews()
            cell.collMainProduct.reloadData()
            return cell
        }
        return UITableViewCell()
    }
    
}
