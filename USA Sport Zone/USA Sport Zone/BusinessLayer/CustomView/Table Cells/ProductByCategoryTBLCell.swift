//
//  ProductByCategoryTBLCell.swift
//  USA Sport Zone
//
//  Created by Gali Srikanth on 20/04/21.
//

import UIKit
import SwiftSoup
protocol CustomCellProductDelegate: class {
    func didSelectProductItem(indexPath: Int)
}

class ProductByCategoryTBLCell: UITableViewCell {
    var arrMDataSet: Array<[String:Any]> = []
    var delegate: CustomCellProductDelegate?
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
       
        productCollectionView.register(UINib(nibName: "ProductByCategoryColCell", bundle: nil), forCellWithReuseIdentifier: "ProductByCategoryColCell")
  
    }
    func cellConfigure(arrDataSet: Array<[String:Any]>) {
        
        arrMDataSet = arrDataSet
        productCollectionView.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ProductByCategoryTBLCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMDataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductByCategoryColCell", for: indexPath) as! ProductByCategoryColCell
        
        cell.imgReletedProduct.makeShadow()
        
        let dictProduct = arrMDataSet[indexPath.row]
        if let dictTemp =  dictProduct["title"] as? [String:Any]{
           
            cell.lblRelatedProduct.text = (dictTemp["rendered"] as! String)
        }
        cell.lblRelatedProductCategory.text = " " + (dictProduct["type"] as! String) + " "
        cell.lblRelatedProductCategory.layer.cornerRadius = 10
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
                
            } catch Exception.Error( _, let message) {
                print(message)
            } catch {
                print("error")
            }
            
        }
        
        /*
         
         if (dictProduct["title"] as? [String:Any] !=nil ,let dictTemp =  dictProduct["title"] as? [String:Any] , let title = (dictTemp["rendered"] as? String{
         cell.lblRelatedProduct.text = title
         }
         */
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectProductItem(indexPath: indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.productCollectionView.frame.width/2, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
