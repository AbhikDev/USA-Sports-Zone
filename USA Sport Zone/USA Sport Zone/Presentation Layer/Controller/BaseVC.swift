//
//  BaseVC.swift

// //  WilCity
//  Created by Mahesh Mahalik on 30/01/20.
//  Copyright © 2020 Mahesh Mahalik. All rights reserved.
//

import UIKit


class BaseVC: UIViewController {
    
    
    var appDel:AppDelegate? = nil
    
    var inputAccView : UIView?
    var statusBar : UIView?
    var originalframe :CGRect?
    var heightStatus : CGFloat = 0.0
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDel = (UIApplication.shared.delegate as! AppDelegate)
        statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
        originalframe = statusBar?.frame
        heightStatus = statusBar?.frame.height ?? 0.0
        let statusBarColor = UIColor(named:"AppPurple")
        statusBar?.backgroundColor = statusBarColor
        view.addSubview(statusBar ?? UIView())
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showInternetCheckCustomPopUp(vc:UIViewController) {
        
        if let foundView = vc.view.viewWithTag(2000) {
            foundView.removeFromSuperview()
        }
        
        
        let vw = NetWorkErrorView()
        vw.tag = 2000
        vw.frame = UIScreen.main.bounds
        vw.setupContentUI()
        vc.view.addSubview(vw)
    }
    
}

