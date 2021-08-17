

import UIKit
struct HomeSections {
    var key:String?
    var value:String?
    var object:Any?
}
class MoreVC: BaseVC {
   
    var isNewMessage :Int = 0
    var tempCate:[HomeSections] = []
    @IBOutlet weak var tableMore: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgviewProfile: UIImageView!
    @IBOutlet weak var bgVW: UIView!
    @IBOutlet weak var imgviewCover: UIImageView!
   
    
    let arrImg = ["user","terms","policy","contact","rateus","share"]
    let arrImgColor = ["#c6794d","#2a88d9","#f80100","#249937","#5B5B5B","#09967F"]
    let arrbgColor = ["#fff3eb" ,"#ecf6ff", "#ffebec", "#eaf9ed","#EBEBEB","#EBF7F7"]
    fileprivate func setupTable() {
        let section1 = HomeSections.init(key: "\u{f007}", value: "About Us", object: nil)
        let section2 = HomeSections.init(key: "\u{f0e0}", value: "Terms & Condition", object: nil)
        let section3 = HomeSections.init(key: "\u{f0f3}", value: "Privacy Policy", object: nil)
        let section4 = HomeSections.init(key: "\u{f004}", value: "Contact Us", object: nil)
        let section5 = HomeSections.init(key: "rateus", value: "Rate Us", object: nil)
        let section6 = HomeSections.init(key: "share", value: "Share App", object: nil)
        tempCate = [section1,section2,section3,section4,section5,section6]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTable()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 3
            childVC.tabBarCollectionView.reloadData()
        }
        
    }
    
}
extension MoreVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempCate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        cell.lblName.text = tempCate[indexPath.row].value
       //cell.lblImage.text = tempCate[indexPath.row].key ?? ""
        
        let bgColor = UtilityClass.getColorFromHexString(arrbgColor[indexPath.row])
        let imgtintColor = UtilityClass.getColorFromHexString(arrImgColor [indexPath.row])
        let imgName = arrImg[indexPath.row]
        
        cell.imgContent.image = UIImage(named: imgName)
        cell.imgContent.tintColor = imgtintColor
        cell.viewBackImage.backgroundColor = bgColor
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "CMSVC") as! CMSVC
        if indexPath.row == 0{
            nextVC.stringCMSDetails = AboutUS
        }else if indexPath.row == 1{
            nextVC.stringCMSDetails = TermsCondition
        }else if indexPath.row == 2{
            nextVC.stringCMSDetails = PrivacyPolicy
        }else if indexPath.row == 3{
            nextVC.stringCMSDetails = contactus
        }else if indexPath.row == 4{
            if let url = URL(string: "https://www.apple.com/app-store/") {
                UIApplication.shared.open(url)
            }
            return
        }else if indexPath.row == 5{
            let text = "Let me recommend you this application"
            //let image = UIImage(named: "Product")
            let myWebsite = NSURL(string:"https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8")
            let shareAll = [text , myWebsite! as URL] as [Any]
            
            
            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // exclude some activity types from the list (optional)
            self.present(activityViewController, animated: true, completion: nil)
            return
        }
        nextVC.getIndex = indexPath.row
        navigationController?.pushViewController(nextVC,animated: true)
    }
}
