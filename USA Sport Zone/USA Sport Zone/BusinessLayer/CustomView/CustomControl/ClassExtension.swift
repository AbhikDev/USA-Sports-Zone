

import Foundation
import UIKit
import Toast_Swift
import Kingfisher
struct UtilityClass {
    static func tosta(message: String, duration: CGFloat, vc:UIViewController)  {
        var style = ToastStyle()
        
        style.backgroundColor = UIColor(named: "AppGreenColor")!
        //style.maxWidthPercentage
        style.messageFont = UIFont.systemFont(ofSize: 15.0)
        //UIFont(name: "System", size: 15.0)!
        style.messageColor = .white
        ToastManager.shared.style = style
        
        vc.view?.makeToast(message, duration: 2.0, position: .bottom)
    }
    static func calculateAge(birthday: String) -> Int{
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"//"dd/MM/yyyy"
        guard let birthdayDate = dateFormater.date(from: birthday) else {
            return 0
        }
        
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let now: NSDate! = NSDate()
        guard let presentDate = now as Date?  else {  return 0 }
        
        let calcAge = calendar.components(.day, from: presentDate, to: birthdayDate, options: [])
        guard let age = calcAge.day else { return 0 }
        return age
        
    }
    static func calculateTimeSpan(fromTime: String) -> Bool{
        
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm a"
        guard let birthdayDate = dateFormater.date(from: fromTime) else {
            return false
        }
        
        
        let calendar = Calendar.current
        let now = birthdayDate
        let eight_today = calendar.date(
            bySettingHour: 12,
            minute: 00,
            second: 0,
            of: now)!
        
        let four_thirty_today = calendar.date(
            bySettingHour: 23,
            minute: 59,
            second: 0,
            of: now)!
        
        if now >= eight_today &&
            now <= four_thirty_today
        {
            return true
        }
        return false
    }
    static func dateFormatterFlexibleLocal(strDate:String, fromDateFromat:String, toDateFormat:String)->String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale =  NSLocale.init(localeIdentifier: "en") as Locale
        let tempLocale = dateFormatter.locale // save locale temporarily
        
        dateFormatter.dateFormat = fromDateFromat//"dd-MM-yyyy hh:mm a"
        guard let date = dateFormatter.date(from: strDate) else {
            return strDate
        }
        //let date = try dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = toDateFormat//"hh:mm a"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        //print("EXACT_DATE : \(dateString)")
        return dateString
    }
    // #pragma mark Color from HEX code
    
    static func getColorFromHexString(_ hexString: String?) -> UIColor? {
        var cleanString = hexString?.replacingOccurrences(of: "#", with: "")
        if cleanString!.count == 3 {
            cleanString = "\((cleanString! as NSString).substring(with: NSRange(location: 0, length: 1)))\((cleanString! as NSString).substring(with: NSRange(location: 0, length: 1)))\((cleanString! as NSString).substring(with: NSRange(location: 1, length: 1)))\((cleanString! as NSString).substring(with: NSRange(location: 1, length: 1)))\((cleanString! as NSString).substring(with: NSRange(location: 2, length: 1)))\((cleanString! as NSString).substring(with: NSRange(location: 2, length: 1)))"
            
        }
        
        if cleanString!.count == 6 {
            cleanString = cleanString! + "ff"
        }
        var baseValue:UInt32 = 0
        Scanner(string: cleanString!).scanHexInt32(&baseValue)
        
        let red: Float = Float(((baseValue >> 24) & 0xff)) / 255.0
        let green: Float = Float(((baseValue >> 16) & 0xff)) / 255.0
        let blue: Float = Float(((baseValue >> 8) & 0xff)) / 255.0
        let alpha: Float = Float(((baseValue >> 0) & 0xff)) / 255.0
        
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
}

extension UIDevice {
    var isSimulator:Bool {
        get{
            var isSim = false
            #if arch(i386) || arch(x86_64)
            isSim = true
            #endif
            return isSim
        }
    }
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    var iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    enum ScreenType: String {
        case iPhone4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhoneX = "iPhone X"
        case iPhoneXR = "iPhone XR"
        case iPhoneXS_MAX = "iPhone XS MAX"
        case iPadPro9_7 = "iPad 9.7"
        case iPadPro10_5 = "iPad 10.5"
        case iPadPro12_9 = "iPad 12.9"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhoneX
        case 1792:
            return .iPhoneXR
        case 2688:
            return .iPhoneXS_MAX
        case 2048:
            return .iPadPro9_7
        case 2224:
            return .iPadPro10_5
        case 2732:
            return .iPadPro12_9
        default:
            return .unknown
        }
    }
}
extension UIButton {
    func makeButtonCornerRadius(){
        let radius = (self.frame.size.height / 2)
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    init?(htmlEncodedString: String) {
        
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString.string)
    }
    
}

extension String {
    
    var roundOfPrice: String {
        
        let charset = CharacterSet(charactersIn: ".")
        if self.rangeOfCharacter(from: charset) != nil {
            return  self.components(separatedBy: ".").first ?? ""
        }else{
            return self
        }
    }
    var trimSpace: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var isValidTenDigitMobileNumber : Bool{
        let p = self.trimSpace
        return p.count >= 10 ? true : false
    }
    
    func toDate(withFormate formet: String) -> Date? {
        let dateFormatter = DateFormatter()
        //let utcTimeZone = TimeZone(secondsFromGMT: 0)
        //dateFormatter.timeZone = utcTimeZone
        dateFormatter.dateFormat = formet
        let date = dateFormatter.date(from: self)
        return date
    }
    
    
    var isValidPhoneNumberCountryWise: Bool{
        let PHONE_REGEX = "^\\+(?:[0-9] ?){10,11}[0-9]$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return  phoneTest.evaluate(with: self)
        
    }
    // MARK: -  PasswordValidation(Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character)
    var isPasswordValidation: Bool{
        let Password_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{6,}"
        let Password = NSPredicate(format: "SELF MATCHES %@", Password_REGEX)
        return  Password.evaluate(with: self)
        
    }
    
    //
    
    var containsDigits : Bool {
        return (self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil)
    }
}

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    func downloadImageWith(URL imageUrl:String,Placeholder image:UIImage){
        self.image = image
        self.contentMode = .scaleAspectFit
        if let url = URL(string: imageUrl){
            let resource = ImageResource(downloadURL:url)
            KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
                switch result {
                case .success(let value):
                    //print("Image: \(value.image). Got from: \(value.cacheType)")
                    self.image = value.image
                    self.contentMode = .scaleAspectFit
                case .failure( _):
                    self.contentMode = .scaleAspectFit
                //print("Error: \(error)")
                }
            }
        }
    }
    /*
     func downloadImage(from url: URL) {
     print("Download Started")
     getData(from: url) { data, response, error in
     guard let data = data, error == nil else { return }
     print(response?.suggestedFilename ?? url.lastPathComponent)
     print("Download Finished")
     DispatchQueue.main.async() { [weak self] in
     self?.image = UIImage(data: data)
     }
     }
     }
     func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
     URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
     }*/
}
extension UINavigationController {
    //Mark:  - Check in navigation stack
    func containsViewController(ofKind kind: AnyClass) -> Bool {
        return self.viewControllers.contains(where: {$0.isKind(of: kind)})
    }
    //function use to check whether that VC is in the Stack or not , if in tha stack tha pop or Push
    func popPushToVC(ofKind Kind: AnyClass, pushController: UIViewController) {
        if containsViewController(ofKind: Kind) {
            for controller in self.viewControllers{
                if controller.isKind(of: Kind){
                    popToViewController(controller, animated: true)
                    break
                }
            }
        } else{
            pushViewController(pushController, animated: true)
        }
    }
    
    func backToPreviousPage() {
        self.popViewController(animated: true)
        
    }
    
}
extension UIView {
    func makeRound(){
        let radius = (self.frame.size.width / 2)
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.clipsToBounds = true
    }
    
    func makeRoundCornerRadius(){
        let radius = 5
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.clipsToBounds = true
    }
    /*
     func makeRoundCornerRadiusWithColor(color:UIColor){
     let radius = 5
     self.layer.cornerRadius = CGFloat(radius)
     self.layer.borderWidth = 1.0
     self.layer.borderColor = color.cgColor
     self.clipsToBounds = true
     }*/
    func makeShadow() {
        // Initialization code
        /*
         self.layer.shadowRadius = 2.5
         self.layer.shadowColor = UIColor(red: 176.0 / 255.0, green: 199.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0).cgColor
         self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
         self.layer.shadowOpacity = 0.9
         self.layer.masksToBounds = false
         
         let shadowInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         let shadowPath = UIBezierPath(rect: self.bounds.inset(by: shadowInsets))
         self.layer.shadowPath = shadowPath.cgPath
         self.layer.cornerRadius = 10
         */
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(1.0))
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 10
        
    }
    
    
}

extension Date {
    
    func afterMonth(getMonth:Int) -> Date{
        return Calendar.current.date(byAdding: .month, value: getMonth, to: noon)!
    }
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    static var nextMonth:  Date { return Date().monthAfter }
    static var nextyear:  Date { return Date().yearAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var monthAfter: Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: noon)!
    }
    var yearAfter: Date {
        return Calendar.current.date(byAdding: .year, value: 1, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}

extension UIImage {
    
    func fixedOrientation() -> UIImage? {
        
        guard imageOrientation != UIImage.Orientation.up else {
            //This is default orientation, don't need to do anything
            return self.copy() as? UIImage
        }
        
        guard let cgImage = self.cgImage else {
            //CGImage is not available
            return nil
        }
        
        guard let colorSpace = cgImage.colorSpace, let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil //Not able to create CGContext
        }
        
        var transform: CGAffineTransform = CGAffineTransform.identity
        
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
            break
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi / 2.0)
            break
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: CGFloat.pi / -2.0)
            break
        case .up, .upMirrored:
            break
        default:
            break
        }
        
        //Flip image one more time if needed to, this is to prevent flipped image
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        default:
            break
        }
        
        ctx.concatenate(transform)
        
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            break
        }
        
        guard let newCGImage = ctx.makeImage() else { return nil }
        return UIImage.init(cgImage: newCGImage, scale: 1, orientation: .up)
    }
    
    
}



extension Data {
    
    var dictionary:[String:Any]? {
        do{
            if let json = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableLeaves) as? [String:Any] {
                return json
            }
        }catch let e {
            print(e.localizedDescription)
            return nil
        }
        return nil
    }
    var arrDictionary:[[String:Any]]? {
        do{
            if let json = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableLeaves) as? [[String:Any]] {
                return json
            }
        }catch let e {
            print(e.localizedDescription)
            return nil
        }
        return nil
    }
}


extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    var prettyprintedJSON: String? {
        do {
            let data: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch let err {
            print(err.localizedDescription)
            return nil
        }
    }
    var data:Data? {
        do {
            let data: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return data
        } catch let err {
            print(err.localizedDescription)
            return nil
        }
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            
            let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
                NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
                NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
            ]
            let htmlString = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
            
            // Removing this line makes the bug reappear
            htmlString?.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.clear, range: NSMakeRange(0, 1))
            
            return htmlString
            /*
             return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
             */
            
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


extension UILabel {
    @objc public var substituteFontName : String {
        get {
            return self.font.fontName;
        }
        set {
            let fontNameToTest = self.font.fontName.lowercased();
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font.pointSize)
        }
    }
}

extension UITextView {
    @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}

extension UITextField {
    @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}
/*
 extension UIView {
 
 private struct AssociatedKeys {
 static var descriptiveName = "AssociatedKeys.DescriptiveName.blurView"
 }
 
 private (set) var blurView: BlurView {
 get {
 if let blurView = objc_getAssociatedObject(
 self,
 &AssociatedKeys.descriptiveName
 ) as? BlurView {
 return blurView
 }
 self.blurView = BlurView(to: self)
 return self.blurView
 }
 set(blurView) {
 objc_setAssociatedObject(
 self,
 &AssociatedKeys.descriptiveName,
 blurView,
 .OBJC_ASSOCIATION_RETAIN_NONATOMIC
 )
 }
 }
 
 class BlurView {
 
 private var superview: UIView
 private var blur: UIVisualEffectView?
 private var editing: Bool = false
 private (set) var blurContentView: UIView?
 private (set) var vibrancyContentView: UIView?
 
 var animationDuration: TimeInterval = 0.1
 
 /**
 * Blur style. After it is changed all subviews on
 * blurContentView & vibrancyContentView will be deleted.
 */
 var style: UIBlurEffect.Style = .light {
 didSet {
 guard oldValue != style,
 !editing else { return }
 applyBlurEffect()
 }
 }
 /**
 * Alpha component of view. It can be changed freely.
 */
 var alpha: CGFloat = 0 {
 didSet {
 guard !editing else { return }
 if blur == nil {
 applyBlurEffect()
 }
 let alpha = self.alpha
 UIView.animate(withDuration: animationDuration) {
 self.blur?.alpha = alpha
 }
 }
 }
 
 init(to view: UIView) {
 self.superview = view
 }
 
 func setup(style: UIBlurEffect.Style, alpha: CGFloat) -> Self {
 self.editing = true
 
 self.style = style
 self.alpha = alpha
 
 self.editing = false
 
 return self
 }
 
 func enable(isHidden: Bool = false) {
 if blur == nil {
 applyBlurEffect()
 }
 
 self.blur?.isHidden = isHidden
 }
 
 private func applyBlurEffect() {
 blur?.removeFromSuperview()
 
 applyBlurEffect(
 style: style,
 blurAlpha: alpha
 )
 }
 
 private func applyBlurEffect(style: UIBlurEffect.Style,
 blurAlpha: CGFloat) {
 superview.backgroundColor = UIColor.clear
 
 let blurEffect = UIBlurEffect(style: style)
 let blurEffectView = UIVisualEffectView(effect: blurEffect)
 
 let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
 let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
 blurEffectView.contentView.addSubview(vibrancyView)
 
 blurEffectView.alpha = blurAlpha
 
 superview.insertSubview(blurEffectView, at: 0)
 
 blurEffectView.addAlignedConstrains()
 vibrancyView.addAlignedConstrains()
 
 self.blur = blurEffectView
 self.blurContentView = blurEffectView.contentView
 self.vibrancyContentView = vibrancyView.contentView
 }
 }
 
 private func addAlignedConstrains() {
 translatesAutoresizingMaskIntoConstraints = false
 addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.top)
 addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.leading)
 addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.trailing)
 addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute.bottom)
 }
 
 private func addAlignConstraintToSuperview(attribute: NSLayoutConstraint.Attribute) {
 superview?.addConstraint(
 NSLayoutConstraint(
 item: self,
 attribute: attribute,
 relatedBy: NSLayoutConstraint.Relation.equal,
 toItem: superview,
 attribute: attribute,
 multiplier: 1,
 constant: 0
 )
 )
 }
 }*/
extension Array {
    var data:Data? {
        get{
            do{
                return (try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted))
            }catch let e {
                print(e.localizedDescription)
                return nil
            }
        }
    }
    
}
/*
 extension UIView {
 func fadeIn(_ duration: TimeInterval = 0.25,_ delay:TimeInterval = 0.0, completion:((Bool) -> ())? = nil) {
 self.alpha = 0.0
 UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
 self.alpha = 1.0
 }) { (finished:Bool) in
 if let completion = completion {
 completion(finished)
 }
 }
 }
 func fadeOut(_ duration: TimeInterval = 0.25,_ delay:TimeInterval = 0.0, completion:((Bool) -> ())? = nil) {
 self.alpha = 1.0
 UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
 self.alpha = 0.0
 }) { (finished:Bool) in
 if let completion = completion {
 completion(finished)
 }
 }
 }
 }
 */


extension UINavigationController {
    
    ///Get previous view controller of the navigation stack
    func previousViewController() -> UIViewController?{
        
        let lenght = self.viewControllers.count
        
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
        
        return previousViewController
    }
    
}
extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}

extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
        //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
        // locationOfTouchInLabel.y - textContainerOffset.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}

