//
//  ProductList.swift
//  USA Sport Zone
//
//  Created by Gali Srikanth on 20/04/21.
//

import UIKit
import SwiftSoup
class ProductList: BaseVC {
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    var arrMDataSet: Array<[String:Any]> = []
    var SelectedCategory = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        tabBarCollectionView.reloadData()
        // Do any additional setup after loading the view.
        tabBarCollectionView.register(UINib(nibName: "ProductByCategoryColCell", bundle: nil), forCellWithReuseIdentifier: "ProductByCategoryColCell")
        
        
        self.callApiProductListByCategory(categoryName: (SelectedCategory["banner_key"] as! String)){ (status, message) in
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 1
            childVC.tabBarCollectionView.reloadData()
        }
        
    }
}
extension ProductList:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMDataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductByCategoryColCell", for: indexPath) as! ProductByCategoryColCell
        cell.imgReletedProduct.makeShadow()
       
        let dictProduct = arrMDataSet[indexPath.row]
        if let dictTemp =  dictProduct["title"] as? [String:Any]{
            cell.lblRelatedProduct.text = (dictTemp["rendered"] as! String)
        }
        cell.lblRelatedProductCategory.text = (dictProduct["type"] as! String)
        
        cell.imgReletedProduct.image = UIImage(named: "ic_launcher_round")
        if let dictTemp =  dictProduct["acf"] as? [String:Any]{
            let contents = (dictTemp["product_image"] as! String)
            //do {
            
            do {
                let doc: Document = try SwiftSoup.parse(contents)
                
                let src: Element = try doc.select("img").first()!
                let srcText: String = try src.attr("src")
                let imagePath = "http:" + srcText
                cell.imgReletedProduct.downloadImageWith(URL:imagePath , Placeholder: UIImage(named: "AppLogo")!)
                cell.imgReletedProduct.contentMode = .scaleAspectFit
                cell.imgReletedProduct.image = cell.imgReletedProduct.image?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right:5))
            } catch Exception.Error( _, let message) {
                print(message)
            } catch {
                print("error")
            }
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dictProduct = arrMDataSet[indexPath.row]
        if let dictTemp =  dictProduct["acf"] as? [String:Any]{
            let contents = (dictTemp["product_image"] as! String)
            //do {
            
            do {
                let doc: Document = try SwiftSoup.parse(contents)
                
                let src: Element = try doc.select("a").first()!
                let srcText: String = try src.attr("href")
                let refPath = srcText
                
                guard let url = URL(string: refPath) else { return }
                UIApplication.shared.open(url)
            } catch Exception.Error( _, let message) {
                print(message)
            } catch {
                print("error")
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.tabBarCollectionView.frame.width/2, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
extension ProductList{
    func callApiProductListByCategory(categoryName: String,complitionHandeler:@escaping(_ status: Int, _ message : String) -> ()){
        //
        let url =  (API.productByCategory.getURL()?.absoluteString ?? "") + categoryName + "?per_page=100&order=asc"
        let operation = WebServiceOperation.init(url, nil, .WEB_SERVICE_GET, nil)
        operation.completionBlock = {
            print(operation.responseData?.arrDictionary ?? "")
            DispatchQueue.main.async {
                guard let dictResponse = operation.responseData?.arrDictionary, dictResponse.count > 0 else {
                    complitionHandeler(1, HomeVC.ALERT_MESSAGE_WRONG)
                    return
                }
                
                
                self.arrMDataSet = dictResponse
                
                self.tabBarCollectionView.reloadData()
                complitionHandeler(0, "Success")
                
            }
        }
        appDel?.operationQueue.addOperation(operation)
       
    }
}
