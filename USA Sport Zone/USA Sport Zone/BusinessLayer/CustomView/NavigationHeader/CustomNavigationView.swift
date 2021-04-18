
import UIKit

class CustomNavigationView: UIView {
    @IBOutlet fileprivate var view:UIView!
   
    @IBOutlet weak var bacKVWWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lblHeader: UILabel!
    
    @IBOutlet weak var imgBack: UIImageView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    private func setup() {
        if let view = Bundle.main.loadNibNamed("CustomNavigationView", owner: self, options: nil)?.first as? UIView {
            self.view = view
            self.view.backgroundColor = .clear
            self.view.frame = self.bounds
            
            self.imgBack.image = UIImage(named:"backIcon")
            //arrow_forward
       
            //backIcon
            self.addSubview(self.view)
            
            /*
             self.translatesAutoresizingMaskIntoConstraints = false
             self.view.translatesAutoresizingMaskIntoConstraints = false
             
             let consTop = NSLayoutConstraint.init(item: self, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0)
             consTop.isActive = true
             
             let consRight = NSLayoutConstraint.init(item: self, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0.0)
             consRight.isActive = true
             
             let consBottom = NSLayoutConstraint.init(item: self, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0)
             consBottom.isActive = true
             
             let consLeft = NSLayoutConstraint.init(item: self, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0.0)
             consLeft.isActive = true
             
             self.addConstraints([consTop,consRight,consBottom,consLeft])
             
             self.view.layoutIfNeeded()
             */
            
        }
    }
}

extension CustomNavigationView{
    @IBAction func leftButtonPressed(_ btn:UIButton) {
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.windows.first?.rootViewController)?.view.endEditing(true)
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.windows.first?.rootViewController)?.navigationController?.popViewController(animated: true)
    }
}
