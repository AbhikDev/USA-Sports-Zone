
import UIKit

class CustomNavigationGeneralView: UIView {
    @IBOutlet fileprivate var view:UIView!
   
    
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
        if let view = Bundle.main.loadNibNamed("CustomNavigationGeneralView", owner: self, options: nil)?.first as? UIView {
            self.view = view
            self.view.backgroundColor = .clear
            self.view.frame = self.bounds
         
            self.addSubview(self.view)
        }
    }
}
