

import Foundation
import UIKit
@IBDesignable open class designableImage: UIImageView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white
    public override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    open override func layoutSubviews() {
         self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = 1.0
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
    @IBInspectable
    public var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
}
