//
//  ProductDetailVC.swift
//  USA Sport Zone
//
//  Created by Gali Srikanth on 27/05/21.
//

import UIKit
import SwiftSoup
class ProductDetailVC: BaseVC {
    var selectedProduct : [String:Any] = [String:Any]()
    @IBOutlet weak var imgviewProduct: UIImageView!
    @IBOutlet weak var lbltProductTitle: UILabel!
    @IBOutlet weak var lblProductDetail: UILabel!
    @IBOutlet weak var btnRequestProduct: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProductData()
        btnRequestProduct.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    
    func setProductData(){
        
        if let dictTemp =  selectedProduct["title"] as? [String:Any]{
            if let data = (dictTemp["rendered"] as! String).data(using: .utf8) {
            var attributedText: NSMutableAttributedString!
            let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: NSNumber(value: String.Encoding.utf8.rawValue)
            ]
            do {
                attributedText = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
                lbltProductTitle.attributedText = attributedText//(dictTemp["rendered"] as! String)
            }catch{
                lbltProductTitle.text = (dictTemp["rendered"] as! String)
            }
            }else{
                lbltProductTitle.text = (dictTemp["rendered"] as! String)
            }
            
            lbltProductTitle.textAlignment = .center
            lbltProductTitle.font = UIFont(name: "Arial", size: 12)
        }else{
            lbltProductTitle.text = ""
        }
        lblProductDetail.text = "  " + (selectedProduct["type"] as! String) + "  "
       
        imgviewProduct.image = UIImage(named: "ic_launcher_round")
        if let dictTemp =  selectedProduct["acf"] as? [String:Any]{
            let contents = (dictTemp["product_image"] as! String)
            //do {
            
            do {
                let doc: Document = try SwiftSoup.parse(contents)
                
                let src: Element = try doc.select("img").first()!
                let srcText: String = try src.attr("src")
                let imagePath = "http:" + srcText
                imgviewProduct.downloadImageWith(URL:imagePath , Placeholder: UIImage(named: "AppLogo")!)
                imgviewProduct.contentMode = .scaleAspectFit
                imgviewProduct.image = imgviewProduct.image?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right:5))
            } catch Exception.Error( _, let message) {
                print(message)
            } catch {
                print("error")
            }
            
        }
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func requestForProduct(_ sender: UIButton) {
        
        
        
        let refreshAlert = UIAlertController(title: App_Title, message: "Do you want to request an order by", preferredStyle: .actionSheet)

        refreshAlert.addAction(UIAlertAction(title: "Mail", style: .default, handler: { (action: UIAlertAction!) in
            let email = "mail.usasportzone@gmail.com"
            if let url = URL(string: "mailto:\(email)") {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))

        refreshAlert.addAction(UIAlertAction(title: "Phone", style: .default, handler: { (action: UIAlertAction!) in
            if let urlMobile = NSURL(string: "tel:+19497717739"){
                if UIApplication.shared.canOpenURL(urlMobile as URL) {
                    
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(urlMobile as URL, options: [:], completionHandler: nil)
                    }
                    else {
                        UIApplication.shared.openURL(urlMobile as URL)
                    }
                }
            }
        }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
        }))

        present(refreshAlert, animated: true, completion: nil)
        
    }
    
}
