
import UIKit

@IBDesignable open class designableButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    open override func layoutSubviews() {
        self.layer.borderColor = self.borderColor.cgColor
        
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
              self.layer.cornerRadius = self.cornerRadius
        }
    }
}
