//
//  ViewController.swift
//  USA Sport Zone
//
//  Created by Gali Srikanth on 18/04/21.
//

import UIKit



class BlogVC: BaseVC {
   
    @IBOutlet weak var tableBlog: UITableView!
    var isNewMessage :Int = 0
    var arrayBlog :[JsonSwift_Base] = []
    //@IBOutlet weak var tableBlog: UITableView!
    var aarrayImages : [String] = []
   
   
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.callApiPopuleblogList { (status, message) in
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let childVC = self.children.first as? TabbarVC {
            childVC.selectedIndex = 2
            childVC.tabBarCollectionView.reloadData()
        }
        
    }
    
}
extension BlogVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBlog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogCell", for: indexPath) as! BlogCell
        if let urlString = aarrayImages[safe:indexPath.row]{
        if let url = URL(string: urlString){
            cell.imgBlog.kf.indicatorType = .activity
            cell.imgBlog.kf.setImage(with: url,placeholder: UIImage(named: ""))
        }else{
            cell.imgBlog.kf.indicatorType = .activity
            cell.imgBlog.image = UIImage(named: "")
        }
        }else{
            cell.imgBlog.image = UIImage(named: "")
        }
        cell.lblTitle.text = arrayBlog[indexPath.row].title?.rendered
        //cell.lblContent.text = arrayBlog[indexPath.row].excerpt?.rendered
        if let data = arrayBlog[indexPath.row].excerpt?.rendered?.data(using: .utf8) {
        var attributedText: NSMutableAttributedString!
            let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: NSNumber(value: String.Encoding.utf8.rawValue)
            ]
        do {
            attributedText = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
          //  let paragraphStyle = NSMutableParagraphStyle()
            //paragraphStyle.lineBreakMode = .byWordWrapping


            //let htmlDesc = htmlforMobile.appending(stringCMSDetails ?? "")
//                cell.txtViewCMS.textAlignment = .leftstringCMSDetails
           //      paragraphStyle.alignment = .left
//
           // attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
//
            cell.lblContent.attributedText = attributedText
            cell.lblContent.font = UIFont(name: "Helvetica Neue", size: 13)
            cell.lblContent.textColor = .gray

        }catch{
            
        }
       
    }
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
    
       
    
   
    
}
extension BlogVC{
    func callApiPopuleblogList(complitionHandeler:@escaping(_ status: Int, _ message : String) -> ()){
        let operation = WebServiceOperation.init((API.Blog.getURL()?.absoluteString ?? ""), nil, .WEB_SERVICE_GET, nil)
        operation.completionBlock = {
            print(operation.responseData?.arrDictionary ?? "")
            DispatchQueue.main.async {
                guard let dictResponse = operation.responseData?.arrDictionary, dictResponse.count > 0 else {
                    complitionHandeler(1, HomeVC.ALERT_MESSAGE_WRONG)
                    return
                }
                do{
                    self.arrayBlog = try JSONDecoder().decode([JsonSwift_Base].self, from: dictResponse.data!)
                    if self.arrayBlog.count > 0{
                        for i in  0...self.arrayBlog.count - 1{
                        if let features = self.arrayBlog[i].embedded?.wpFeaturedmedia{
                            for feature in features {
                                self.aarrayImages.append(feature.source_url ?? "")
                            }

                        }
                    }
                    }
                    self.tableBlog.reloadData()
                    
                    
                    
                    complitionHandeler(0, "Success")
                }catch let error {
                    print(error)
                    complitionHandeler(1, HomeVC.ALERT_MESSAGE_WRONG)
                }
            }
        }
        
        appDel?.operationQueue.addOperation(operation)
    }
}
