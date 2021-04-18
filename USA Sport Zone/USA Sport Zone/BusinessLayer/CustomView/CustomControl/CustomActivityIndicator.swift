

import UIKit
import NVActivityIndicatorView
class CustomActivityIndicator: UIView {

    @IBOutlet var view: UIView?
    var activityIndicator : NVActivityIndicatorView!

    static let sharedInstance = CustomActivityIndicator()
    
    var vwContainer : UIView?
    override init(frame:CGRect){
        super.init(frame: frame)
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() -> Void {
        self.view = Bundle.main.loadNibNamed("CustomActivityIndicator", owner: self, options: nil)?.first as! UIView?
        self.view?.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.addSubview(self.view!)
    }
    
    
    func display(onView vw:UIView!,done:@escaping ()->()){
        
        if((self.viewWithTag(1000)) == nil){
            vwContainer = UIView(frame: UIScreen.main.bounds)
            vwContainer?.backgroundColor =  UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 0.5)
            self.addSubview(vwContainer!)
            
            let frame = CGRect(x: ((vw.frame.size.width / 2) - 25), y: ((vw.frame.size.height / 2) - 25), width: 50, height: 50)
            
            activityIndicator = NVActivityIndicatorView(frame: frame)
            activityIndicator.type = .ballGridPulse // add your type
            activityIndicator.color = UIColor(named: "AppGreenColor")! // add your color
            activityIndicator.tag = 1000
            //activityIndicator.backgroundColor = .clear
            self.addSubview(activityIndicator) // or use  webView.addSubview(activityIndicator)
            vw.addSubview(self)
            activityIndicator.startAnimating()
        }
    }
    
    func hide(_:@escaping ()->()){
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        vwContainer?.removeFromSuperview()
    }
}
