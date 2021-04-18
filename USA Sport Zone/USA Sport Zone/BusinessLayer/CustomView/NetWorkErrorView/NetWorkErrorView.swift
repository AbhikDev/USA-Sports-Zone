
import UIKit
import Lottie
class NetWorkErrorView: UIView {
    // 1. Create the AnimationView
    private var animationView: AnimationView?
    @IBOutlet var mainView: UIView!
    @IBOutlet var vwConatianer: UIView!
    @IBAction func dissmissAlert(_ sender: Any) {
        removeFromSuperview()
    }
    
    
    func setupContentUI() {
        if let first = Bundle.main.loadNibNamed("NetWorkErrorView", owner: self, options: nil)?.first as? UIView {
            mainView = first
        }
        mainView.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        
        
        // 2. Start AnimationView with animation name (without extension)
        
        animationView = .init(name: "network_error")
        
        animationView!.frame = vwConatianer.bounds
        
        // 3. Set animation content mode
        
        animationView!.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        
        animationView!.animationSpeed = 0.5
        
        vwConatianer.addSubview(animationView!)
        vwConatianer.bringSubviewToFront(animationView!)
        // 6. Play animation
        
        animationView!.play()
        addSubview(mainView)
        
    }
}
