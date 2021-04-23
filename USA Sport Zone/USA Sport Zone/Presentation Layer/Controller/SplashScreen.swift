
import UIKit
import Lottie
class SplashScreen: UIViewController {
    @IBOutlet var vwContainer:UIView!
    // 1. Create the AnimationView
    private var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. Start AnimationView with animation name (without extension)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        animationView = .init(name: "Shop")//loader")
        
        animationView!.frame = vwContainer.bounds
        
        // 3. Set animation content mode
        
        animationView!.contentMode = .scaleAspectFit//scaleAspectFit
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        
        animationView!.animationSpeed = 0.5
        
        vwContainer.addSubview(animationView!)
        vwContainer.bringSubviewToFront(animationView!)
        // 6. Play animation
        
        animationView!.play()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //call any function
            self.navigateToInitial()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func navigateToInitial() {
        if #available(iOS 13.0, *) {
            let vc = self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Fallback on earlier versions
            let vc = HomeVC.init(nibName: "HomeVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
