

import Foundation
import UIKit

//////DashBoardData
//////DashBoardData
enum DashboardSection : Int {
    case DASHBOARD_SECTION_HIGHLITE // 0
    case DASHBOARD_SECTION_FEATURED //1
    case DASHBOARD_SECTION_CATEGORY //2
    case DASHBOARD_SECTION_TOP // 3
    
}
var concern_number = ""
var contact_us_number = ""
var contact_us_wp_number = ""

var fcm_Token = ""
let App_Title:String! = "Pharma Store"
let APP_THEAM_COLOR : UIColor =
    UIColor(red: 186.0/255, green: 163.0/255, blue: 91.0/255, alpha: 1)
var THEME_COLOR_LIGHT: UIColor = UIColor(displayP3Red: 89.0/255.0, green: 191.0/255.0, blue: 148.0/255.0, alpha: 1.0)
var THEME_COLOR_DARK: UIColor = UIColor(displayP3Red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
var BACKGROUNG_LIGHT: UIColor = UIColor(displayP3Red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0, alpha: 1.0)
var BACKGROUNG_DARK: UIColor = UIColor(displayP3Red: 244.0/255.0, green: 249.0/255.0, blue: 253.0/255.0, alpha: 1.0)

let deviceBounds:CGRect! = UIScreen.main.bounds
//MARK : AppDelegate instant
let appDel = UIApplication.shared.delegate as! AppDelegate

let genericDateFormatter = "dd MMM,yyyy"
///Mark: API
let BaseUrl:String  = "http://www.usasportzone.com"
let ApiBaseUrl:String  = BaseUrl + "/wp-json/"
let ImageBaseUrl:String  = BaseUrl + "/wp-content/themes/usasportzone"
   
//Mark : Api Url 
public enum API:Int {
    case getTrainParcel
    case banners
    case productByCategory
    func getURL() -> URL? {
        switch self {
            
        case .getTrainParcel:
            return URL.init(string: (ApiBaseUrl+"/parcel_train"))
        case .banners:
            return URL.init(string: (ApiBaseUrl+"wp/V2/banners?_embed"))
        case .productByCategory:
            return URL.init(string: (ApiBaseUrl+"wp/v2/"))
            
        }
    }
}



var shadowView = UIView()
//var mulListV = MultipleSelecetionListPicker()
//var listV = ListPickerView()
//var dtPickerView = DatePickerView()
class MyBasics: NSObject {
    
    
    class func showPopup(Title:String?, Message:String?, InViewC:UIViewController?) {
        
        let popUpAlert = UIAlertController(title: Title!, message: Message!, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        popUpAlert.addAction(okAction)
        InViewC?.present(popUpAlert, animated: true, completion: nil)
        
    }
    class func isValidPhoneNumberByCountry(numberStr:String) -> Bool {
        
        let PHONE_REGEX = "^\\+(?:[0-9] ?){10,11}[0-9]$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: numberStr)
        return result
    }
    class func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    class func isValidPhoneNumber(numberStr:String) -> Bool {
        
        let PHONE_REGEX = "^[0-9]{10,15}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: numberStr)
        return result
    }
    
    class func isPasswordValid(passwordStr : String) -> Bool
    {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$&*%^&~ ]).{8,}$")
        return passwordTest.evaluate(with: passwordStr)
    }
    
    
    class func heightForText(text:String!, viewWidth:CGFloat, font:UIFont) -> CGFloat {
        
        let constraintRect = CGSize(width: viewWidth, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height + 4
    }
    
    func makeShadowToChildView(shadowView:UIView)
    {
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(1.0))
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 4
    }
    
    // MARK: Multiple List picker
    /*
    class func showMultipleListDropDown(Items:Array<String>,selectedIncludedName:[Bool] ,ParentViewC:UIViewController) {
        
        shadowView = UIView(frame: deviceBounds)
        shadowView.backgroundColor = UIColor.black
        shadowView.alpha = 0.0
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideMultipleListView))
        tapGes.numberOfTapsRequired = 1
        shadowView.addGestureRecognizer(tapGes)
        mulListV = Bundle.main.loadNibNamed("ListPickerView", owner: ParentViewC, options: nil)?[1] as! MultipleSelecetionListPicker
        mulListV.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
        ParentViewC.view.addSubview(shadowView)
        ParentViewC.view.addSubview(mulListV)
        ParentViewC.view.endEditing(true)
        mulListV.myDelegate = ParentViewC as? CustomListMultipleDelegate
        mulListV.ReloadPickerView(dataArray: Items,selectedIncludedName:selectedIncludedName)
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.3
            mulListV.frame = CGRect(x: 0, y: deviceBounds.size.height - 227.0, width: deviceBounds.size.width, height: 227.0)
            
        }, completion: nil)
        
    }
    
    @objc class func hideMultipleListView() {
        
        UIView.animate(withDuration: 0.3, animations: {
            shadowView.alpha = 0.0
            mulListV.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
            
        }) { (Bool) in
            //listV.myDelegate?.ListDidHide!()
            shadowView.removeFromSuperview()
            mulListV.removeFromSuperview()
        }
    }
    
    
    
    // MARK: List picker
    class func showListDropDownFromView(Items:Array<String>, ParentViewC:UIView) {
        
        shadowView = UIView(frame: deviceBounds)
        shadowView.backgroundColor = UIColor.black
        shadowView.alpha = 0.0
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideListView))
        tapGes.numberOfTapsRequired = 1
        shadowView.addGestureRecognizer(tapGes)
        listV = Bundle.main.loadNibNamed("ListPickerView", owner: ParentViewC, options: nil)?.first as! ListPickerView
        listV.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)!.view.addSubview(shadowView)
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)!.view.addSubview(listV)
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)!.view.endEditing(true)
        listV.myDelegate = ParentViewC as? CustomListDelegate
        listV.ReloadPickerView(dataArray: Items)
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.3
            listV.frame = CGRect(x: 0, y: deviceBounds.size.height - 227.0, width: deviceBounds.size.width, height: 227.0)
            
        }, completion: nil)
        
    }
    class func showListDropDown(Items:Array<String>, ParentViewC:UIViewController) {
        
        shadowView = UIView(frame: deviceBounds)
        shadowView.backgroundColor = UIColor.black
        shadowView.alpha = 0.0
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideListView))
        tapGes.numberOfTapsRequired = 1
        shadowView.addGestureRecognizer(tapGes)
        listV = Bundle.main.loadNibNamed("ListPickerView", owner: ParentViewC, options: nil)?.first as! ListPickerView
        listV.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
        ParentViewC.view.addSubview(shadowView)
        ParentViewC.view.addSubview(listV)
        ParentViewC.view.endEditing(true)
        listV.myDelegate = ParentViewC as? CustomListDelegate
        listV.ReloadPickerView(dataArray: Items)
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.3
            listV.frame = CGRect(x: 0, y: deviceBounds.size.height - 227.0, width: deviceBounds.size.width, height: 227.0)
            
        }, completion: nil)
        
    }
    
    @objc class func hideListView() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.0
            listV.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
            
        }) { (Bool) in
            
            //listV.myDelegate?.ListDidHide!()
            shadowView.removeFromSuperview()
            listV.removeFromSuperview()
            
        }
    }
    
    
    // MARK: Date picker
    class func showDatePickerDropDownFromView(PickerType:UIDatePicker.Mode, ParentViewC:UIView) {
        
        shadowView = UIView(frame: deviceBounds)
        shadowView.backgroundColor = UIColor.black
        shadowView.alpha = 0.0
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideDatePickerView))
        tapGes.numberOfTapsRequired = 1
        shadowView.addGestureRecognizer(tapGes)
        dtPickerView = Bundle.main.loadNibNamed("ListPickerView", owner: ParentViewC, options: nil)?[2] as! DatePickerView
        dtPickerView.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
        dtPickerView.dtPicker.datePickerMode = PickerType
        dtPickerView.ReloadDatePickerView()
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)!.view.addSubview(shadowView)
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)!.view.addSubview(dtPickerView)
        appDel.topViewControllerWithRootViewController(rootViewController: UIApplication.shared.keyWindow?.rootViewController)!.view.endEditing(true)
        dtPickerView.delegate = ParentViewC as? DatePickerDelegate
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.3
            dtPickerView.frame = CGRect(x: 0, y: deviceBounds.size.height - 227.0, width: deviceBounds.size.width, height: 227.0)
            
        }, completion: nil)
        
    }
    class func showDatePickerDropDown(PickerType:UIDatePicker.Mode, ParentViewC:UIViewController) {
        
        shadowView = UIView(frame: deviceBounds)
        shadowView.backgroundColor = UIColor.black
        shadowView.alpha = 0.0
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(hideDatePickerView))
        tapGes.numberOfTapsRequired = 1
        shadowView.addGestureRecognizer(tapGes)
        dtPickerView = Bundle.main.loadNibNamed("ListPickerView", owner: ParentViewC, options: nil)?[2] as! DatePickerView
        dtPickerView.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
        dtPickerView.dtPicker.datePickerMode = PickerType
        ParentViewC.view.addSubview(shadowView)
        ParentViewC.view.addSubview(dtPickerView)
        ParentViewC.view.endEditing(true)
        dtPickerView.delegate = ParentViewC as? DatePickerDelegate
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.3
            dtPickerView.frame = CGRect(x: 0, y: deviceBounds.size.height - 227.0, width: deviceBounds.size.width, height: 227.0)
            
        }, completion: nil)
        
    }
    
    @objc class func hideDatePickerView() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            shadowView.alpha = 0.0
            dtPickerView.frame = CGRect(x: 0, y: deviceBounds.size.height, width: deviceBounds.size.width, height: 227.0)
            
        }) { (Bool) in
            
            //listV.myDelegate?.ListDidHide!()
            shadowView.removeFromSuperview()
            dtPickerView.removeFromSuperview()
            
        }
    }
    */
}
class APIManager: NSObject{
    
    static  func postRequest(url strUrl: String?, parameters: [String:Any], completion: @escaping ([String: Any]?, Error?) -> Void) {

        //declare parameter as a dictionary which contains string as key and value combination.
       // let parameters = ["name": username, "password": password]

        print("URL body paframeters===>", parameters)
    
        //create the url with NSURL
        guard let url =  URL(string: strUrl ?? "") else { return }

        //create the session object
        let session = URLSession.shared

        //now create the Request object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }

        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                return
            }

            do {
                //create json object from data
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                print(json)
                completion(json, nil)
            } catch let error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        })

        task.resume()
    }
    
    
}
