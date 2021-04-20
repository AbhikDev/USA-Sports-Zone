
import UIKit
protocol CustomDelegate: class {
    func didSelectItem(indexPath: Int)
}
class MainProductTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collMainProduct: UICollectionView!
    var delegate: CustomDelegate?
    var indexPathForCell: Int?
    //var banner:NSMutableArray = []
    var arrCategory_banner:NSMutableArray = []
    var arrMDataSet: Array<[String:Any]> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collMainProduct.dataSource = self
        collMainProduct.delegate = self
        
       
        collMainProduct.register(UINib(nibName: "MainItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemMain")
  
        collMainProduct.register(UINib(nibName: "ReletedProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemReletedProduct")
        
    
        collMainProduct.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        
        
        collMainProduct.register(UINib(nibName: "CategoryColCell", bundle: nil), forCellWithReuseIdentifier: "CategoryColCell")
        
        //banner = ["Promotional.png", "AllItems.png"]
        arrCategory_banner =  ["sub_banner_1", "sub_banner_2","sub_banner_3"]
        //    self.startTimer()
        
    }
    
    func cellConfigure(arrDataSet: Array<[String:Any]>) {
        
        arrMDataSet = arrDataSet
        collMainProduct.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //     MARK:- CollectionView DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(indexPathForCell as Any)
        switch indexPathForCell {
        case DashboardSection.DASHBOARD_SECTION_HIGHLITE.rawValue?:
            return arrMDataSet.count
        case DashboardSection.DASHBOARD_SECTION_FEATURED.rawValue?:
            return arrCategory_banner.count//arrMDataSet.count
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue?:
            return arrMDataSet.count
        case DashboardSection.DASHBOARD_SECTION_TOP.rawValue?:
            return arrMDataSet.count
        default:
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPathForCell {
        case DashboardSection.DASHBOARD_SECTION_HIGHLITE.rawValue?:
            
            let cell:ShopByCategoryItemCollectionViewCell!  = collectionView.dequeueReusableCell(withReuseIdentifier: "itemShopByCategory", for: indexPath) as? ShopByCategoryItemCollectionViewCell
            
            let dict = arrMDataSet[indexPath.row]
            //Ru : Added chking
            cell.backgroundColor = .white
            if !dict.isEmpty{
                
                cell.lblBannerTitle.text = ""
                cell.imgBanner.downloadImageWith(URL: "", Placeholder: UIImage(named: "AppLogo")!)
                /*
                cell.lblBannerTitle.text = ""
                if let productName = dict["category"] as? String{
                    cell.lblBannerTitle.text = productName
                }
                let imgPath =  dict["category_image"] as! String
                cell.imgBanner.downloadImageWith(URL: imgPath, Placeholder: UIImage(named: "no_product")!)
                */
                
                //cell.contentView.layer.borderWidth = 1.0
                
                cell.frame.size = CGSize(width: (collMainProduct.frame.width)/4-8, height: (collMainProduct.frame.width)/4-8)
            }
            
            return cell
        case DashboardSection.DASHBOARD_SECTION_FEATURED.rawValue?:
           
            /*let cell: ProductCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            
            cell.frame.size = CGSize(width: 150, height: 160)
            
            cell.vawImgContainer.layer.cornerRadius = 10.0
            cell.vawImgContainer.layer.borderWidth = 1
            cell.vawImgContainer.layer.borderColor = UIColor.clear.cgColor
            
            cell.vawImgContainer.backgroundColor = UIColor(named: "AppLightGrayColor")
            cell.backgroundColor = .white
            */
            
            let cell: MainItemCollectionViewCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "itemMain", for: indexPath) as! MainItemCollectionViewCell
            collMainProduct.backgroundColor = .white
            cell.frame.size = CGSize(width: (collMainProduct.frame.width), height: 1)
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.frame.size = CGSize(width: 200, height: 160)
            
            cell.imgMainProductItem.image = UIImage(named: arrCategory_banner[indexPath.row] as! String)
            return cell
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue?:
            let cell: CategoryColCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "CategoryColCell", for: indexPath) as! CategoryColCell
            collMainProduct.backgroundColor = UIColor(named: "AppLightGrayColor")
            cell.frame.size = CGSize(width:150, height: 130)
            
          
            cell.backgroundColor = .clear
            
            let dict = arrMDataSet[indexPath.row]
            cell.lblInfo.text = (dict["banner_name"] as! String)
           
            let imgPath =  (dict["banner_image"] as! String)
            let imagePathFull = ImageBaseUrl + imgPath
            cell.imgCellContent.image = UIImage(named: "ic_launcher_round")
            
            cell.imgCellContent.downloadImageWith(URL: imagePathFull, Placeholder: UIImage(named: "AppLogo")!)
            
           
            return cell
        case DashboardSection.DASHBOARD_SECTION_TOP.rawValue?:
            let cell: ProductCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "itemMain", for: indexPath) as! ProductCell
          
            cell.frame.size = CGSize(width: (collMainProduct.frame.width - 40), height: 100)
            
            return cell
        default:
            let cell: MainItemCollectionViewCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "itemMain", for: indexPath) as! MainItemCollectionViewCell
            collMainProduct.backgroundColor = .white
            cell.frame.size = CGSize(width: (collMainProduct.frame.width), height: 1)
            cell.contentView.layer.borderWidth = 2
            return cell
        }
    }
    
    //     MARK:- CollectionView Delegate (Size)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPathForCell == DashboardSection.DASHBOARD_SECTION_HIGHLITE.rawValue {
            return CGSize(width:collMainProduct.frame.width, height: collMainProduct.frame.height)
        }
        else if indexPathForCell == DashboardSection.DASHBOARD_SECTION_FEATURED.rawValue {
            return CGSize(width:200, height: 160)
        }
        else if indexPathForCell == DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue {
            return CGSize(width:150, height: 130)
        }else if indexPathForCell == DashboardSection.DASHBOARD_SECTION_TOP.rawValue {
            return CGSize(width: (collMainProduct.frame.width - 40), height: 90)
        } else {
            return CGSize(width: 1, height: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    //     MARK:- CollectionView Delegate (Action)
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPathForCell {
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue?:
            delegate?.didSelectItem(indexPath: indexPath.item)
            
        default:
            break
        }
    }
   
    func startTimer() {
        
        let _ =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: false)
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        /*
        if let coll  = collMainProduct {
            for cell in coll.visibleCells {
                if indexPathForCell == 1 {
                    let indexPath: IndexPath? = coll.indexPath(for: cell)
                    if ((indexPath?.row)!  < banner.count - 1){
                        let indexPath1: IndexPath?
                        indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                        
                        coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    }
                    else{
                        let indexPath1: IndexPath?
                        indexPath1 = IndexPath.init(row: 0, section: indexPathForCell!)
                        coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                    }
                }
            }
        }
        */
    }
   
}
