
import Foundation
import UIKit

@IBDesignable
class ButtionX: UIButton {
    @IBInspectable var cornerRadious:CGFloat = 0{
        didSet {
            self.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == .pad ? cornerRadious + 10 :  cornerRadious
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var isRound: Bool = false {
        didSet{
           

            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                
            }
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
 
}



@IBDesignable
class ImageViewX: UIImageView {
    @IBInspectable var cornerRadious:CGFloat = 0{
        didSet {
            //self.layer.cornerRadius = cornerRadious
            self.layer.cornerRadius = cornerRadious
         
            
        }
    }
    @IBInspectable var isRound: Bool = false {
        didSet{
           

            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}


@IBDesignable
class TextFieldX: UITextField {
    @IBInspectable var cornerRadious:CGFloat = 0{
        didSet {
            //self.layer.cornerRadius = cornerRadious
            self.layer.cornerRadius = cornerRadious
         
            
        }
    }
    @IBInspectable var isRound: Bool = false {
        didSet{
           

            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable public var placeholderColor: UIColor = .lightGray {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}


@IBDesignable
class LabelX: UILabel {
    @IBInspectable var cornerRadious:CGFloat = 0{
        didSet {
            //self.layer.cornerRadius = cornerRadious
            self.layer.cornerRadius = cornerRadious
         
            
        }
    }
    @IBInspectable var isRound: Bool = false {
        didSet{
           

            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}


@IBDesignable
class ViewX: UIView {
    
    @IBInspectable var cornerRadious:CGFloat = 0{
        didSet {
            self.layer.cornerRadius = cornerRadious
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var isRound: Bool = false {
        didSet{
           

            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            } else {
                
            }
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}



