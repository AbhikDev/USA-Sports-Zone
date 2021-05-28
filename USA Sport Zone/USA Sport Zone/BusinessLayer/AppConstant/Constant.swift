

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
//MARK : AppDelegate instant
let appDel = UIApplication.shared.delegate as! AppDelegate
var concern_number = ""
var contact_us_number = ""
var contact_us_wp_number = ""

var fcm_Token = ""
let App_Title:String! = "USA Sport Zone"

let deviceBounds:CGRect! = UIScreen.main.bounds

let genericDateFormatter = "dd MMM,yyyy"
///Mark: API
let BaseUrl:String  = "http://www.usasportzone.com"
let ApiBaseUrl:String  = BaseUrl + "/wp-json/"
let ImageBaseUrl:String  = BaseUrl + "/wp-content/themes/usasportzone"
let AboutUS = "<h3><strong>About Us</strong></h3>USA Sport Zone has brought forth the best deals and collections from Amazon right under one roof. Now you can shop your favorite sports accessories, sunglasses, smartwatches and tons of other products with just a single tap on your smartphone.Now you don’t have to get confused with thousands of options on Amazon. Wouldn’t it be a tad easier if you could narrow down the best options and choose the right product? This is where the mobile application of USA Sport Zone comes into play. We have handpicked the top-notch products from multiple categories to cater to your daily and usual requirements. Choose the product you want and buy the same at unbelievably low prices from Amazon.<h4>Range of products</h4>From sunglasses to smartwatches, we have a wide range of products up our sleeves. Do you want workout equipment? Is it some classy headphones that you are looking for? No matter what your choice, we have them all for you. All you have to do is download our application and purchase the desired product.<h4>Highly competitive prices</h4>Being an affiliate site, we have always focused on bringing forth the best deals for you. We want ALL our clients to explore and experience the best headphone, sports accessories, car supplies, electronic gadgets, T-shirts, etc., without having to worry about the budget."

let TermsCondition = """
<h2>Terms &amp; Conditions</h2><p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Usa Sport Zone. </p> <p> Usa Sport Zone is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for. </p> <p> The Usa Sport Zone app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Usa Sport Zone app won’t work properly or at all. </p> <div><p> The app does use third party services that declare their own Terms and Conditions. </p> <p> Link to Terms and Conditions of third party service providers used by the app </p> <ul><li><a href="https://policies.google.com/terms" target="_blank" rel="noopener noreferrer">Google Play Services</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p>
You should be aware that there are certain things that
Usa Sport Zone will not take responsibility for. Certain
functions of the app will require the app to have an active
internet connection. The connection can be Wi-Fi, or provided
by your mobile network provider, but Usa Sport Zone
cannot take responsibility for the app not working at full
functionality if you don’t have access to Wi-Fi, and you don’t
have any of your data allowance left.
</p> <p></p> <p>
If you’re using the app outside of an area with Wi-Fi, you
should remember that your terms of the agreement with your
mobile network provider will still apply. As a result, you may
be charged by your mobile provider for the cost of data for
the duration of the connection while accessing the app, or
other third party charges. In using the app, you’re accepting
responsibility for any such charges, including roaming data
charges if you use the app outside of your home territory
(i.e. region or country) without turning off data roaming. If
you are not the bill payer for the device on which you’re
using the app, please be aware that we assume that you have
received permission from the bill payer for using the app.
</p> <p>
Along the same lines, Usa Sport Zone cannot always take
responsibility for the way you use the app i.e. You need to
make sure that your device stays charged – if it runs out of
battery and you can’t turn it on to avail the Service,
Usa Sport Zone cannot accept responsibility.
</p> <p>
With respect to Usa Sport Zone’s responsibility for your
use of the app, when you’re using the app, it’s important to
bear in mind that although we endeavour to ensure that it is
updated and correct at all times, we do rely on third parties
to provide information to us so that we can make it available
to you. Usa Sport Zone accepts no liability for any
loss, direct or indirect, you experience as a result of
relying wholly on this functionality of the app.
</p> <p>
At some point, we may wish to update the app. The app is
currently available on Android – the requirements for
system(and for any additional systems we
decide to extend the availability of the app to) may change,
and you’ll need to download the updates if you want to keep
using the app. Usa Sport Zone does not promise that it
will always update the app so that it is relevant to you
and/or works with the Android version that you have
installed on your device. However, you promise to always
accept updates to the application when offered to you, We may
also wish to stop providing the app, and may terminate use of
it at any time without giving notice of termination to you.
Unless we tell you otherwise, upon any termination, (a) the
rights and licenses granted to you in these terms will end;
(b) you must stop using the app, and (if needed) delete it
from your device.
</p> <p><strong>Changes to This Terms and Conditions</strong></p> <p>
I may update our Terms and Conditions
from time to time. Thus, you are advised to review this page
periodically for any changes. I will
notify you of any changes by posting the new Terms and
Conditions on this page.
</p> <p>
These terms and conditions are effective as of 2021-04-15
</p> <p><strong>Contact Us</strong></p> <p>
If you have any questions or suggestions about my
Terms and Conditions, do not hesitate to contact me
at mail.usasportzone@gmail.com.
"""
let PrivacyPolicy = """
<h2>Privacy Policy</h2>
 <p>Your privacy is important to us. It is Usa Sport Zone&#39;s policy to respect your privacy and comply with any applicable law and regulation regarding any personal information we may collect about you, including across our website, <a href="http://www.usasportzone.com">http://www.usasportzone.com</a>, and other sites we own and operate. </p>
 <p>This policy is effective as of 15 April 2021 and was last updated on 15 April 2021. </p>
 <h3>Information We Collect</h3>
 <p>Information we collect includes both information you knowingly and actively provide us when using or participating in any of our services and promotions, and any information automatically sent by your devices in the course of accessing our products and services. </p>
 <h4>Log Data</h4>
 <p>When you visit our website, our servers may automatically log the standard data provided by your web browser. It may include your device’s Internet Protocol (IP) address, your browser type and version, the pages you visit, the time and date of your visit, the time spent on each page, other details about your visit, and technical details that occur in conjunction with any errors you may encounter. </p>
 <p>Please be aware that while this information may not be personally identifying by itself, it may be possible to combine it with other data to personally identify individual persons. </p>
 <h4>Collection and Use of Information</h4>
 <p>We may collect personal information from you when you do any of the following on our website: </p>
 <ul>
 <li>Use a mobile device or web browser to access our content</li>
 <li>Contact us via email, social media, or on any similar technologies</li>
 <li>When you mention us on social media</li>
 </ul>
 <p>We may collect, hold, use, and disclose information for the following purposes, and personal information will not be further processed in a manner that is incompatible with these purposes: </p>
 <p>Please be aware that we may combine information we collect about you with general information or research data we receive from other trusted sources. </p>
 <h4>Security of Your Personal Information</h4>
 <p>When we collect and process personal information, and while we retain this information, we will protect it within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use, or modification. </p>
 <p>Although we will do our best to protect the personal information you provide to us, we advise that no method of electronic transmission or storage is 100% secure, and no one can guarantee absolute data security. We will comply with laws applicable to us in respect of any data breach. </p>
 <p>You are responsible for selecting any password and its overall security strength, ensuring the security of your own information within the bounds of our services. </p>
 <h4>How Long We Keep Your Personal Information</h4>
 <p>We keep your personal information only for as long as we need to. This time period may depend on what we are using your information for, in accordance with this privacy policy. If your personal information is no longer required, we will delete it or make it anonymous by removing all details that identify you. </p>
 <p>However, if necessary, we may retain your personal information for our compliance with a legal, accounting, or reporting obligation or for archiving purposes in the public interest, scientific, or historical research purposes or statistical purposes. </p>
 <h3>Children’s Privacy</h3>
 <p>We do not aim any of our products or services directly at children under the age of 13, and we do not knowingly collect personal information about children under 13. </p>
 <h3>International Transfers of Personal Information</h3>
 <p>The personal information we collect is stored and/or processed where we or our partners, affiliates, and third-party providers maintain facilities. Please be aware that the locations to which we store, process, or transfer your personal information may not have the same data protection laws as the country in which you initially provided the information. If we transfer your personal information to third parties in other countries: (i) we will perform those transfers in accordance with the requirements of applicable law; and (ii) we will protect the transferred personal information in accordance with this privacy policy. </p>
 <h3>Your Rights and Controlling Your Personal Information</h3>
 <p>You always retain the right to withhold personal information from us, with the understanding that your experience of our website may be affected. We will not discriminate against you for exercising any of your rights over your personal information. If you do provide us with personal information you understand that we will collect, hold, use and disclose it in accordance with this privacy policy. You retain the right to request details of any personal information we hold about you. </p>
 <p>If we receive personal information about you from a third party, we will protect it as set out in this privacy policy. If you are a third party providing personal information about somebody else, you represent and warrant that you have such person’s consent to provide the personal information to us. </p>
 <p>If you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time. We will provide you with the ability to unsubscribe from our email-database or opt out of communications. Please be aware we may need to request specific information from you to help us confirm your identity. </p>
 <p>If you believe that any information we hold about you is inaccurate, out of date, incomplete, irrelevant, or misleading, please contact us using the details provided in this privacy policy. We will take reasonable steps to correct any information found to be inaccurate, incomplete, misleading, or out of date. </p>
 <p>If you believe that we have breached a relevant data protection law and wish to make a complaint, please contact us using the details below and provide us with full details of the alleged breach. We will promptly investigate your complaint and respond to you, in writing, setting out the outcome of our investigation and the steps we will take to deal with your complaint. You also have the right to contact a regulatory body or data protection authority in relation to your complaint. </p>
 <h3>Limits of Our Policy</h3>
 <p>Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and policies of those sites, and cannot accept responsibility or liability for their respective privacy practices. </p>
 <h3>Changes to This Policy</h3>
 <p>At our discretion, we may change our privacy policy to reflect updates to our business processes, current acceptable practices, or legislative or regulatory changes. If we decide to change this privacy policy, we will post the changes here at the same link by which you are accessing this privacy policy. </p>
 <p>If required by law, we will get your permission or give you the opportunity to opt in to or opt out of, as applicable, any new uses of your personal information. </p>
 <h3>Contact Us</h3>
 <p>For any questions or concerns regarding your privacy, you may contact us using the following details: </p>
 <p>Usa Sport Zone<br />
 http://www.usasportzone.com/ </p>
"""
let contactus = """
<h3><strong>Details :&nbsp;</strong></h3>
 <ul>
 <li>&nbsp;Contact number - <a href="tel:+19497717739">+1 949 771 7739</a></li>
 <li>&nbsp;Contact email - <a href="mailto:mail.usasportzone@gmail.com">mail.usasportzone@gmail.com</a></li>
 <li>&nbsp;Address - 27762 Antonio Pkwy Ste L-1-206 ,Ladera Ranch, CA 92694</li>
 </ul>
"""
//Mark : Api Url 
public enum API:Int {
    case getTrainParcel
    case banners
    case productByCategory
    case Blog
    case iOSCheck
    func getURL() -> URL? {
        switch self {
        case .iOSCheck:
            return URL.init(string: (ApiBaseUrl+"ios_app/link"))
        case .getTrainParcel:
            return URL.init(string: (ApiBaseUrl+"/parcel_train"))
        case .banners:
            return URL.init(string: (ApiBaseUrl+"wp/V2/banners?_embed"))
        case .productByCategory:
            return URL.init(string: (ApiBaseUrl+"wp/v2/"))
        case .Blog:
            return URL.init(string: (ApiBaseUrl+"wp/v2/posts?per_page=100&order=desc&_embed"))
            
        }
    }
}

var isOpenAmazone = true

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
