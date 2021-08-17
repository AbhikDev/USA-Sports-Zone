

import UIKit
import WebKit

class AccountCell: UITableViewCell {
    
    @IBOutlet weak var heightWeb: NSLayoutConstraint!
    @IBOutlet weak var viewweb: WKWebView!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var viewBackImage: ViewX!
    @IBOutlet weak var imgViewSection: UIImageView!
    @IBOutlet weak var imgContent: UIImageView!
    @IBOutlet weak var lblImage: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
