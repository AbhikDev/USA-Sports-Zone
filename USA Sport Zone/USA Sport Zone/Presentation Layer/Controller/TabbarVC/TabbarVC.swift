
import UIKit
class TabbarCollCell:UICollectionViewCell{
    
    @IBOutlet weak var imageTab: UIImageView!
    @IBOutlet weak var labelTap: UILabel!
    @IBOutlet weak var viewBackground: UIView!
}

class TabbarVC: UIViewController {
    
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    var selectedIndex:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        tabBarCollectionView.reloadData()
    }
    
    func reloadUI(tempSelectedIndex:Int){
        selectedIndex = tempSelectedIndex
        tabBarCollectionView.reloadData()
    }
}

extension TabbarVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "TabbarCollCell", for: indexPath) as! TabbarCollCell
        if (indexPath.row == 0){
            if (selectedIndex == indexPath.row){
                cell.imageTab.tintColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.textColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.text = "Home"
                
            }
            else {
                cell.imageTab.tintColor = .darkGray
                cell.labelTap.textColor = .darkGray
                cell.labelTap.text = ""
                
            }
            cell.imageTab.image = UIImage.init(named: "Home")
        }
        else if (indexPath.row == 1){
            
            if (selectedIndex == indexPath.row){
                cell.imageTab.tintColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.textColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.text = "Shop"
                
            }
            else {
                cell.imageTab.tintColor = .darkGray
                cell.labelTap.textColor = .darkGray
                cell.labelTap.text = ""
                
            }
            cell.imageTab.image = UIImage.init(named: "ShoppingCart")
            
            
        }
        else if (indexPath.row == 2){
            
            if (selectedIndex == indexPath.row){
                cell.imageTab.tintColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.textColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.text = "Blog"
            }
            else {
                cell.viewBackground.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
                cell.labelTap.text = ""
                cell.imageTab.tintColor = .darkGray
                cell.labelTap.textColor = .darkGray
                
            }
            
            cell.imageTab.image = UIImage.init(named: "Blog")
            
            
        }
        else if indexPath.row == 3{
            
            if (selectedIndex == indexPath.row){
                cell.imageTab.tintColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.textColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.text = "More"
            }
            else {
                cell.imageTab.tintColor = .darkGray
                cell.labelTap.textColor = .darkGray
                cell.labelTap.text = ""
            }
            cell.imageTab.image = UIImage.init(named: "Info")
        }
        else {
            cell.imageTab.image = UIImage.init(named: "Info")
            if (selectedIndex == indexPath.row){
                cell.imageTab.tintColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.textColor = UIColor(named:"AppPurple")//APP_THEAM_COLOR
                cell.labelTap.text = "More"
            }
            else {
                cell.viewBackground.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
                
                cell.imageTab.tintColor = .darkGray
                cell.labelTap.textColor = .darkGray
                cell.labelTap.text = ""
            }
            
            cell.imageTab.image = UIImage.init(named: "Info")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if selectedIndex != indexPath.row{
            if (indexPath.row == 0){
                if let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
                    //viewController.newsObj = newsObj
                    let navigationController = UINavigationController(rootViewController: VC)
                    navigationController.isNavigationBarHidden = true
                    self.view.window?.rootViewController = navigationController
                }
            }
            else if (indexPath.row == 1){
                
                
                if let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShopVC") as? ShopVC {
                let navigationController = UINavigationController(rootViewController: VC)
                navigationController.isNavigationBarHidden = true
                self.view.window?.rootViewController = navigationController
                }
            }
            else if (indexPath.row == 2){
                if let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlogVC") as? BlogVC {
                    //viewController.newsObj = newsObj
                    let navigationController = UINavigationController(rootViewController: VC)
                    navigationController.isNavigationBarHidden = true
                    self.view.window?.rootViewController = navigationController
                }
                
            }else {
                
                if let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoreVC") as? MoreVC {
                    //viewController.newsObj = newsObj
                    let navigationController = UINavigationController(rootViewController: VC)
                    navigationController.isNavigationBarHidden = true
                    self.view.window?.rootViewController = navigationController
                }
            }
            self.selectedIndex = indexPath.row
            self.tabBarCollectionView.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.tabBarCollectionView.frame.width/4, height: self.tabBarCollectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    
}
