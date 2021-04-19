//
//  ProductCell.swift
//  USA Sport Zone
//
//  Created by Gali Srikanth on 18/04/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var lblRelatedProduct: UILabel!
    @IBOutlet weak var lblRelatedProductFeature: UILabel!
    @IBOutlet weak var imgReletedProduct: UIImageView!
    
    @IBOutlet weak var vawImgContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
