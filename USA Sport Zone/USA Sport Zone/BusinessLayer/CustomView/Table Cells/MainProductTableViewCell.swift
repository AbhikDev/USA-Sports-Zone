
import UIKit

class MainProductTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collMainProduct: UICollectionView!
    
    var indexPathForCell: Int?
    var banner:NSMutableArray = []
    var arrMDataSet: Array<[String:Any]> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collMainProduct.dataSource = self
        collMainProduct.delegate = self
        
       
        collMainProduct.register(UINib(nibName: "MainItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemMain")
        
        
        collMainProduct.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "SearchCell")
        
        collMainProduct.register(UINib(nibName: "ReletedProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemReletedProduct")
        
        collMainProduct.register(UINib(nibName: "ShopByCategoryItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemShopByCategory")
        
        collMainProduct.register(UINib(nibName: "FeaturedItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemFeatureProduct")
        
        collMainProduct.register(UINib(nibName: "PromotionalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemPromotional")
        
        banner = ["Promotional.png", "AllItems.png"]
        
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
            return arrMDataSet.count
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue?:
            return 1
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
            let cell: ReletedProductCollectionViewCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "itemReletedProduct", for: indexPath) as! ReletedProductCollectionViewCell
            
            cell.frame.size = CGSize(width: (collMainProduct.frame.width)/2.8, height: 210)
            
            cell.layer.cornerRadius = 10.0
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.clear.cgColor
            
            cell.vawImgContainer.layer.borderColor = UIColor.clear.cgColor
            collMainProduct.backgroundColor = UIColor(named: "AppLightGrayColor")
            
            
            
            /*
            let dict = arrMDataSet[indexPath.row]
            let imgPath =  dict["product_image1"] as! String
            cell.imgReletedProduct.downloadImageWith(URL: imgPath, Placeholder: UIImage(named: "no_product")!)
            
            
            cell.lblRelatedProduct.text = ""
            if let productName = dict["product_name"] as? String{
                cell.lblRelatedProduct.text = productName
            }
            
            cell.lblRelatedProductPrice.text = ""
            if let productName = dict["product_price"] as? String{
                cell.lblRelatedProductPrice.text = productName
            }
            //print("IsInWishList",dict)
            if let value = dict["IsInWishList"] as? Bool{
                print(value)
            }
            cell.btnFav.tintColor = (dict["IsInWishList"] as? Bool ?? false) ? UIColor(named: "AppBlue") : .darkGray
            cell.btnFav.tag = indexPath.row
            cell.btnFav.addTarget(self, action: #selector(addToWishlist), for: .touchUpInside)
            */
            return cell
        case DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue?:
            let cell: ReletedProductCollectionViewCell = collMainProduct.dequeueReusableCell(withReuseIdentifier: "itemReletedProduct", for: indexPath) as! ReletedProductCollectionViewCell
            collMainProduct.backgroundColor = .white
            cell.frame.size = CGSize(width: (collMainProduct.frame.width)/2.8, height: 210)
            
            cell.vawImgContainer.layer.cornerRadius = 10.0
            cell.vawImgContainer.layer.borderWidth = 1
            cell.vawImgContainer.layer.borderColor = UIColor(named:"AppLightGrayColor")?.cgColor
            cell.backgroundColor = .white
            /*
            let dict = arrMDataSet[indexPath.row]
            let imgPath =  dict["product_image1"] as! String
            cell.imgReletedProduct.downloadImageWith(URL: imgPath, Placeholder: UIImage(named: "no_product")!)
            
            
            cell.btnFav.tintColor = (dict["IsInWishList"] as? Bool ?? false) ? UIColor(named: "AppBlue") : .darkGray
            cell.btnFav.tag = indexPath.row
            cell.btnFav.addTarget(self, action: #selector(addToWishlist), for: .touchUpInside)
            cell.lblRelatedProduct.text = ""
            if let productName = dict["product_name"] as? String{
                cell.lblRelatedProduct.text = productName
            }
            cell.lblRelatedProductPrice.text = ""
            if let productName = dict["product_price"] as? String{
                cell.lblRelatedProductPrice.text = productName
            }*/
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
            return CGSize(width: (collMainProduct.frame.width), height: 70)
        }
        else if indexPathForCell == DashboardSection.DASHBOARD_SECTION_CATEGORY.rawValue {
            return CGSize(width: (collMainProduct.frame.width)/2.8, height: 210)
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
    
    func startTimer() {
        
        let _ =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: false)
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
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
    }
    @objc func addToWishlist(sender:UIButton) {
        print("addToWishlist")
        //delegate?.didSelectItemToWishList(section: indexPathForCell!, indexPath: sender.tag)
        
        /*
         if indexPathForCell == 3 {
         let dict = arrMDataSet[3]
         delegate?.didSelectItemToWishList(section: indexPathForCell!, indexPath: sender.tag, strProductId: "0")
         
         }else if indexPathForCell == 5 {
         let dict = arrMDataSet[5]
         delegate?.didSelectItemToWishList(section: indexPathForCell!, indexPath: sender.tag, strProductId:"0")
         }*/
    }
    //     MARK:- CollectionView Delegate (Action)
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       //prasadhcu89@gmail.com delegate?.didSelectItem(section: indexPathForCell!, indexPath: indexPath.item)
    }
    
}