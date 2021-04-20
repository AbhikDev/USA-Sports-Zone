//
//  ProductByCategoryTBLCell.swift
//  USA Sport Zone
//
//  Created by Gali Srikanth on 20/04/21.
//

import UIKit

class ProductByCategoryTBLCell: UITableViewCell {
    //
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
       
        productCollectionView.register(UINib(nibName: "ProductByCategoryColCell", bundle: nil), forCellWithReuseIdentifier: "ProductByCategoryColCell")
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ProductByCategoryTBLCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductByCategoryColCell", for: indexPath) as! ProductByCategoryColCell
        cell.imgReletedProduct.layer.cornerRadius = 10
        cell.imgReletedProduct.layer.borderColor = UIColor.lightGray.cgColor
        cell.imgReletedProduct.layer.borderWidth = 5.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.productCollectionView.frame.width/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    
}
