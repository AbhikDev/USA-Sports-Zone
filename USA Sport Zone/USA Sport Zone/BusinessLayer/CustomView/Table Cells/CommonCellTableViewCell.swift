//
//  CommonCellTableViewCell.swift


import UIKit
import SkyFloatingLabelTextField

class CommonCellTableViewCell: UITableViewCell {
    @IBOutlet weak var cellText:SkyFloatingLabelTextField!
    @IBOutlet weak var cellSelectionText:UITextField!
    @IBOutlet weak var cellSelectionTextView: UITextView!
    //@IBOutlet weak var viewSwitch: UISwitch!
    @IBOutlet weak var vwContainer1:UIView!
    @IBOutlet weak var vwContainer2:UIView!
    
    
    
    @IBOutlet weak var lblHeader:UILabel!
    @IBOutlet weak var lblInfo:UILabel!
    @IBOutlet weak var lblInfoExtra1:UILabel!
    @IBOutlet weak var lblInfoExtra2:UILabel!
    @IBOutlet weak var lblInfoExtra3:UILabel!
    @IBOutlet weak var lblInfoExtra4:UILabel!
    @IBOutlet weak var lblInfoExtra5:UILabel!
    @IBOutlet weak var lblInfoExtra6:UILabel!
    @IBOutlet weak var lblInfoExtra7:UILabel!
    @IBOutlet weak var lblInfoExtra8:UILabel!
    
    
   
    @IBOutlet weak var imgContent0:UIImageView!
    @IBOutlet weak var imgContent1:UIImageView!
    @IBOutlet weak var imgContent2:UIImageView!
    @IBOutlet weak var imgContent3:UIImageView!
    @IBOutlet weak var imgContent4:UIImageView!
    @IBOutlet weak var imgContent5:UIImageView!
    
    @IBOutlet weak var btnInstance:UIButton!
    @IBOutlet weak var btnInstance1:UIButton!
    @IBOutlet weak var btnInstance2:UIButton!
    @IBOutlet weak var btnInstance3:UIButton!
    @IBOutlet weak var btnInstance4:UIButton!
    @IBOutlet weak var btnInstance5:UIButton!
    
    
    @IBOutlet weak var heightLayoutForAllReview: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    
    
    @IBOutlet weak var vwFiveRatingTrail: NSLayoutConstraint!
    @IBOutlet weak var vwFiourRatingTrail: NSLayoutConstraint!
    @IBOutlet weak var vwThreeRatingTrail: NSLayoutConstraint!
    @IBOutlet weak var vwTwoRatingTrail: NSLayoutConstraint!
    @IBOutlet weak var vwOneRatingTrail: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
