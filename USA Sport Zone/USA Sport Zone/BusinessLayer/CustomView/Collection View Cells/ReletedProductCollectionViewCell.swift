
import UIKit

class ReletedProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblRelatedProduct: UILabel!
    @IBOutlet weak var lblRelatedProductPrice: UILabel!
    @IBOutlet weak var imgReletedProduct: UIImageView!
    
    @IBOutlet weak var vawImgContainer: UIView!
    @IBOutlet weak var btnFav: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
