

import UIKit
@objc protocol CustomTabbarDelegate {
    func GetSelectedIndex(Index:Int)
}
class CustomTabbarView: UIView {
    
    var myDelegate:CustomTabbarDelegate?
    
    @IBOutlet var view: UIView?
    
    @IBOutlet var viewHome: UIView?
    @IBOutlet var viewQuotes: UIView?
    @IBOutlet var viewContact: UIView?
    @IBOutlet var viewAbout: UIView?
    
    @IBOutlet var imgHome: UIImageView?
    @IBOutlet var imgQuotes: UIImageView?
    @IBOutlet var imgContact: UIImageView?
    @IBOutlet var imgAbout: UIImageView?
    
    
    @IBOutlet var lblHome: UILabel?
    @IBOutlet var lblQuotes: UILabel?
    @IBOutlet var lblContact: UILabel?
    @IBOutlet var lblAbout: UILabel?
    
    func setup(activeFor:String) -> Void {
        self.view = Bundle.main.loadNibNamed("CustomTabbarView", owner: self, options: nil)?.first as! UIView?
        self.view?.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.view?.backgroundColor = .white
        self.addSubview(self.view!)
        
       changeUIAsperUserSelection(activeFor: activeFor)
    }
    func changeUIAsperUserSelection(activeFor:String){
      
        imgHome?.tintColor = UIColor(named: "AppLightDark")
        
        lblHome?.textColor = UIColor(named: "AppLightDark")
        
        imgQuotes?.tintColor = UIColor(named: "AppLightDark")
        lblQuotes?.textColor = UIColor(named: "AppLightDark")
        
        imgContact?.tintColor = UIColor(named: "AppLightDark")
        lblContact?.textColor = UIColor(named: "AppLightDark")
        
        imgAbout?.tintColor = UIColor(named: "AppLightDark")
        lblAbout?.textColor = UIColor(named: "AppLightDark")
      
       
        if(activeFor == "Home"){
            imgHome?.tintColor = UIColor(named: "AccentColor")
            lblHome?.textColor = UIColor(named: "AccentColor")
        }else if(activeFor == "Quotes"){
            imgQuotes?.tintColor = UIColor(named: "AccentColor")
            lblQuotes?.textColor = UIColor(named: "AccentColor")
        }else if(activeFor == "Contact"){
            imgContact?.tintColor = UIColor(named: "AccentColor")
            lblContact?.textColor = UIColor(named: "AppBlue")
        }
        else if(activeFor == "About"){
            imgAbout?.tintColor = UIColor(named: "AccentColor")
            lblAbout?.textColor = UIColor(named: "AccentColor")
        }
       
        lblHome?.text = "Home"
        
        lblQuotes?.text =  "Get a Quote"
        lblContact?.text = "Contact Us"
       
        lblAbout?.text = "Ablout Us"
        
        lblQuotes?.textAlignment = .center
        lblHome?.textAlignment = .center
        lblAbout?.textAlignment = .center
        lblContact?.textAlignment = .center
    }
    @IBAction func selectionTabbar(_ sender: UIButton){
        myDelegate?.GetSelectedIndex(Index: sender.tag)
    }
}
