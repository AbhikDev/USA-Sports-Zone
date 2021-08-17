

import UIKit
import CoreData
import CoreData
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    lazy var window:UIWindow? = {
           return UIWindow.init(frame: UIScreen.main.bounds)
       }()
       lazy var operationQueue:OperationQueue = {
           let queue = OperationQueue()
           queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
           queue.name = "ServerInteractionQueue"
           queue.qualityOfService = .background
           return queue
       }()
       lazy var rechability: Reachability? = {
              return Reachability.networkReachabilityForInternetConnection()
          }()
       static var kQueueOperationsChanged = "kQueueOperationsChanged"
       
       
       lazy var operationQueue_background:OperationQueue = {
           let queue = OperationQueue()
           queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
           queue.name = "ServerInteractionQueueBackground"
           queue.qualityOfService = .background
           return queue
       }()
       static var kQueueOperationsChangedBackground = "kQueueOperationsChangedBackground"
       
       
       
       var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent // .default
       }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        
        /// Operation queue for Api Call Structure
        
        self.operationQueue.addObserver(self, forKeyPath: "operations", options: NSKeyValueObservingOptions(rawValue: 0), context: &AppDelegate.kQueueOperationsChanged)
        
        /////// Operation queue for background Api call
        self.operationQueue_background.addObserver(self, forKeyPath: "operationsBackground", options: NSKeyValueObservingOptions(rawValue: 0), context: &AppDelegate.kQueueOperationsChangedBackground)
                // Override point for customization after application launch.
        
        
        
        
        
        return true
    }
    // MARK: - NAVIGATION
    internal func topViewControllerWithRootViewController(rootViewController: UIViewController!) -> UIViewController? {
        
        if (rootViewController == nil) { return nil }
        
        if (rootViewController.isKind(of: (UITabBarController).self)) {
            
            
            return topViewControllerWithRootViewController(rootViewController: (rootViewController as! UITabBarController).selectedViewController)
            
        } else if (rootViewController.isKind(of:(UINavigationController).self)) {
            
            return topViewControllerWithRootViewController(rootViewController: (rootViewController as! UINavigationController).visibleViewController)
            
        } else if (rootViewController.presentedViewController != nil) {
            return topViewControllerWithRootViewController(rootViewController: rootViewController.presentedViewController)
        }
        return rootViewController
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
           
         }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "USA_Sport_Zone")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


// MARK: - ObServer for Api Call

extension AppDelegate {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (((object as? OperationQueue) === self.operationQueue) && (keyPath == "operations") && (context == &AppDelegate.kQueueOperationsChanged)) {
            DispatchQueue.main.async {
                if self.operationQueue.operationCount > 0 {
                    /*
                    if #available(iOS 13.0, *) {
                        let keyWindow = UIApplication.shared.connectedScenes
                            .filter({$0.activationState == .foregroundActive})
                            .map({$0 as? UIWindowScene})
                            .compactMap({$0})
                            .first?.windows
                            .filter({$0.isKeyWindow}).first
                        
                       
                        CustomActivityIndicator.sharedInstance.display(onView: keyWindow, done: {
                            
                        })
                    } else {
                       */
                        UIApplication.shared.keyWindow?.rootViewController?.view.endEditing(true)
                        
                        CustomActivityIndicator.sharedInstance.display(onView: UIApplication.shared.keyWindow, done: {
                            
                        })
                   // }
                    
                }else{
                    CustomActivityIndicator.sharedInstance.hide {
                        
                    }
                }
                
            }
        }
        else if(((object as? OperationQueue) === self.operationQueue) && (keyPath == "operationsBackground") && (context == &AppDelegate.kQueueOperationsChangedBackground)){
           
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}
