//
//  HomeVC.swift
//  USA Sport Zone
//
//  Created by User on 18/04/21.
//

import UIKit

class HomeVC: BaseVC {
static let ALERT_MESSAGE_WRONG = "Something Went wrong"
    var arrAllData : Array<Array<[String:Any]>> = []
    @IBOutlet weak var tableHome: UITableView!
    var arrayImages:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
          tableHome.contentInsetAdjustmentBehavior = .never
            arrAllData.removeAll()
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
            
    
        
        // Do any additional setup after loading the view.
        var data : Array<[String:Any]> = []
        for _ in 1...5 {
            var param1:[String:AnyObject] = [String:AnyObject]()
            param1["banner_image"] =  "AppLogo" as AnyObject
            data.append(param1)
        }
       arrAllData[0] = data
        
        data.removeAll()
        let arr = ["Headphones", "Gym Supplies", "Car Product","Sports","Shoes","Tea Shirt","Sunglasses","Smart Watches","Electronic","PC Gaming", "Real Favorite"]
        let arr_keyCategory = ["headphones", "gym_supplies", "car_products","tv_video","shoes","tee_shirt","sunglasses","smart_watches","electronic","computer_accessories", "raul_favorite"]
        
        let arr_ImageCategory = ["/assets/images/himg.png",
                                 "/assets/images/gimg.png",
                                "/assets/images/cimg.png",
                                 "/assets/images/timg.png",
                                 "/assets/images/shimg.png",
                                 "/assets/images/tsimg.png",
                                 "/assets/images/suimg.png",
                                 "/assets/images/imgw.png",
                                 "/assets/images/elimg.png",
                                 "/assets/images/coimg.png",
                                 "/assets/images/rfimg.png"]
        
        for index in 0...(arr.count - 1) {
            var param1:[String:AnyObject] = [String:AnyObject]()
            param1["banner_image"] =  arr_ImageCategory[index] as AnyObject
            param1["banner_name"] =  arr[index] as AnyObject
            param1["banner_key"] =  arr_keyCategory[index] as AnyObject
            data.append(param1)
        }
       arrAllData[2] = data
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 0
            childVC.tabBarCollectionView.reloadData()
        }
        self.callApiPopuleBannerList { (status, message) in
            
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
            return 200
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue:
            return 130
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section == DashboardSection.DASHBOARD_SECTION_TOP.rawValue){
            return 300
        }
        return 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       
        if(section == DashboardSection.DASHBOARD_SECTION_TOP.rawValue){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommonCellTableViewCell") as! CommonCellTableViewCell
            return cell
        }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleImageLblCell", for: indexPath) as? SingleImageLblCell
            {
                cell.backgroundColor = .clear
                cell.cellConfigure(arrDataSet: self.arrayImages)
                if self.arrayImages.count > 0{
                    cell.collectionView.isHidden = false
                    cell.indicator.stopAnimating()
                }else{
                    cell.collectionView.isHidden = true
                    cell.indicator.startAnimating()
                }
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
extension HomeVC{
     func callApiPopuleBannerList(complitionHandeler:@escaping(_ status: Int, _ message : String) -> ()){
        let operation = WebServiceOperation.init((API.banners.getURL()?.absoluteString ?? ""), nil, .WEB_SERVICE_GET, nil)
        operation.completionBlock = {
            print(operation.responseData?.arrDictionary ?? "")
            DispatchQueue.main.async {
                guard let dictResponse = operation.responseData?.arrDictionary, dictResponse.count > 0 else {
                    complitionHandeler(1, HomeVC.ALERT_MESSAGE_WRONG)
                    return
                }
                do{
                    let dictArray = try JSONDecoder().decode([Json4Swift_Base].self, from: dictResponse.data!)
                    for i in  0...dictArray.count - 1{
                        if let features = dictArray[i].embedded?.wpFeaturedmedia{
                            for feature in features {
                                self.arrayImages.append(feature.source_url ?? "")
                            }
                            
                        }
                    }
                    self.tableHome.reloadData()
                   
                    
                    
                    complitionHandeler(0, "Success")
                }catch let error {
                    print(error)
                    complitionHandeler(1, HomeVC.ALERT_MESSAGE_WRONG)
                }
                
               
                
            }
        }
        
        AppDelegate.init().operationQueue.addOperation(operation)
    }
}
extension Array {

    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}



extension MutableCollection {
    subscript(safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[ index] : nil
        }

        set(newValue) {
            if let newValue = newValue, indices.contains(index) {
                self[ index] = newValue
            }
        }
    }
}
