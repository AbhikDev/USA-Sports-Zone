//  Copyright © 2020 Mahesh Mahalik. All rights reserved.


import UIKit


class ShopVC: BaseVC {
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    var arrMDataSet: Array<[String:Any]> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        tabBarCollectionView.reloadData()
        
        
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
            arrMDataSet.append(param1)
        }
       
    }
    
    func reloadUI(tempSelectedIndex:Int){
       
        tabBarCollectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 1
            childVC.tabBarCollectionView.reloadData()
        }
        
    }
}

extension ShopVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMDataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "TabbarCollCell", for: indexPath) as! TabbarCollCell
        cell.backgroundColor = .clear
        
        let dict = arrMDataSet[indexPath.row]
        cell.labelTap.text = (dict["banner_name"] as! String)
       
        let imgPath =  (dict["banner_image"] as! String)
        let imagePathFull = ImageBaseUrl + imgPath
      
        cell.imageTab.downloadImageWith(URL: imagePathFull, Placeholder: UIImage(named: "ic_launcher_round")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dict = arrMDataSet[indexPath.row]
        if #available(iOS 13.0, *) {
            let nextVC = self.storyboard?.instantiateViewController(identifier: "ProductList") as! ProductList
            nextVC.SelectedCategory = dict
            self.navigationController?.pushViewController(nextVC, animated: true)
        } else {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "ProductList") as! ProductList
            nextVC.SelectedCategory = dict
            navigationController?.pushViewController(nextVC,animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.tabBarCollectionView.frame.width/3, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    
}
