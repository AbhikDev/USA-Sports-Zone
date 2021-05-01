//
//  CMSVC.swift
//  USA Sport Zone
//
//  Created by User on 21/04/21.
//

import UIKit
import WebKit
class CMSVC: BaseVC,WKNavigationDelegate {
    
    var cellheight:CGFloat = 0.0
    @IBOutlet weak var tableCMS: UITableView!
    var stringCMSDetails:String?
    var isloadedwebview : Bool = false
    var getIndex :Int = 0
    var htmlforMobile = """
<meta name="viewport" content="width=device-width,initial-scale=1.0">
"""
    @IBOutlet weak var lblHeader: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if getIndex == 0{
            lblHeader.text = "About Us"
        }else if getIndex == 1{
            lblHeader.text = "Terms & Condition"
        }else if getIndex == 2{
            lblHeader.text = "Privacy Policy"
        }else if getIndex == 3{
            lblHeader.text = "Contact Us"
        }
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension CMSVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        // cell.lblName.text = stringCMSDetails
        //cell.lblImage.text = tempCate[indexPath.row].key ?? ""
        
       // if let data = stringCMSDetails?.data(using: .utf8) {
//            var attributedText: NSMutableAttributedString!
//            let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
//                .documentType: NSAttributedString.DocumentType.html,
//                .characterEncoding: NSNumber(value: String.Encoding.utf8.rawValue)
//            ]
         //   do {
//                attributedText = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
//                let paragraphStyle = NSMutableParagraphStyle()
//                paragraphStyle.lineBreakMode = .byWordWrapping
                
                
                let htmlDesc = htmlforMobile.appending(stringCMSDetails ?? "")
                //                cell.txtViewCMS.textAlignment = .leftstringCMSDetails
                //                 paragraphStyle.alignment = .left
                //
                //            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
                //
                //            cell.txtViewCMS.attributedText = attributedText
                //
                //                cell.txtViewCMS.font = UIFont(name: "Arial", size: 17)
                cell.viewweb.navigationDelegate = self
                if self.isloadedwebview == false{
                    cell.viewweb.loadHTMLString(htmlDesc, baseURL: nil)
                }
                
                cell.heightWeb.constant = self.cellheight
                cell.viewweb.scrollView.bounces = false
                
                cell.viewweb.scrollView.showsVerticalScrollIndicator = false
                
                cell.viewweb.navigationDelegate = self
                
               
                cell.viewweb.isUserInteractionEnabled = true
                //let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
                //tap.delegate = self
                //cell.viewweb.addGestureRecognizer(tap)
                
//            }catch{
//                
//            }
        //}
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
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.isloadedwebview = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let tableIndex = IndexPath(row: 0, section: 0)
            if let cell = self.tableCMS.cellForRow(at: tableIndex) as? AccountCell{
                
                //UIView.animate(withDuration: 0.5) {
                cell.heightWeb.constant = webView.scrollView.contentSize.height
                self.cellheight =  webView.scrollView.contentSize.height
                self.tableCMS.reloadData()
                // }
                
                
                
                
                //cell.webviewDetails.frame = CGRect(x: 10, y: webView.frame.origin.y, width: webView.frame.width, height: webView.scrollView.contentSize.height)
            }
            
            //            UIView.animate(withDuration: 0.5) {
            //                self.view.layoutIfNeeded()
            //            }
            //            CustomActivityIndicator.sharedInstance.hide {
            //
            //                                      }
        }
        
        //let tableIndex = IndexPath(row: 0, section: 0)
        //if let cell = self.tableDetails.cellForRow(at: tableIndex) as? DoctorInformationCell{
        //            webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
        //                //self.webviewHeightConstraint?.constant = height as! CGFloat
        //                self.cellheight = height as! CGFloat
        //                self.tableDetails.reloadData()
        //                //cell.heightWeb.constant =  height //webView.scrollView.contentSize.height
        //            })
        
        //}
        
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        //         CustomActivityIndicator.sharedInstance.hide {
        //
        //                           }
    }
    
}
extension CMSVC{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
         
         if let url = navigationAction.request.url {
                 if url.absoluteString == "tel:+19497717739" {
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
                    decisionHandler(.cancel)
                     return
                 } else if url.absoluteString == "mailto:mail.usasportzone@gmail.com" {
                    
                    let email = "mail.usasportzone@gmail.com"
                    if let url = URL(string: "mailto:\(email)") {
                      if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url)
                      } else {
                        UIApplication.shared.openURL(url)
                      }
                    }
                    decisionHandler(.cancel)
                     return
                 }
             }

             decisionHandler(.allow)
    }
    
}
