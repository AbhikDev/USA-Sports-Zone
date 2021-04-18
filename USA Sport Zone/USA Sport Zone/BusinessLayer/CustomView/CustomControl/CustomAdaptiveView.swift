//


import UIKit

protocol CustomAdaptiveViewDelegate:NSObjectProtocol {
    func numberOfItems(forView adaptiveView:CustomAdaptiveView) -> Int
    func widthForItem(forView adaptiveView:CustomAdaptiveView, item:Int) -> CGFloat
    func viewForItem(forView adaptiveView:CustomAdaptiveView, item:Int) -> UIView
    func openedPage(pageCount:Int)
}
class CustomAdaptiveView: UIView , UIScrollViewDelegate {

    private var myScrollView:UIScrollView = UIScrollView()
    public weak var delegate:CustomAdaptiveViewDelegate? = nil
    
    public var pageNumber:Int {
        let width = self.myScrollView.frame.size.width
        let page = (self.myScrollView.contentOffset.x + (0.5 * width)) / width
        return Int(page)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        print("CUSTOM VIEW HEIGHT")
        print(self.frame.size.height)
        print(self.frame.size.width)
        print(self.bounds.size.height)
        print(self.bounds.size.width)
        myScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        self.addSubview(myScrollView)
        myScrollView.isScrollEnabled=true
        myScrollView.bounces = false
        myScrollView.isPagingEnabled = true
        myScrollView.delegate = self
    }
    public func reload(){
        
        self.layoutIfNeeded()
        myScrollView.layoutIfNeeded()
        
        for vw in myScrollView.subviews {
            vw.removeFromSuperview()
        }
        
        var lastPosition = CGFloat(0.0)
//        print(Int((self.delegate?.numberOfItems(forView: self))!)
        for i in 0..<Int((self.delegate?.numberOfItems(forView: self))!) {
            let vwTemp = self.delegate?.viewForItem(forView: self, item: i)
            vwTemp?.frame = CGRect(x: lastPosition, y: 0.0, width: (self.delegate?.widthForItem(forView: self, item: i))!, height: self.frame.size.height)
            lastPosition += (self.delegate?.widthForItem(forView: self, item: i))!
            print("vwTemp!")
            print(vwTemp!)
            myScrollView.addSubview(vwTemp!)
        }
        myScrollView.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        myScrollView.contentSize = CGSize(width: lastPosition, height: self.frame.size.height)
    }
    
    func moveToPage(PageNumber page:Int){
  
        myScrollView.scrollRectToVisible(CGRect(x: (myScrollView.frame.size.width * CGFloat(page)), y: 0, width: myScrollView.frame.size.width, height: myScrollView.frame.size.height), animated: true)
    }
    
    func moveToOffSet(_ offset:CGPoint) {
        
        myScrollView.setContentOffset(offset, animated: true)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        let page = (scrollView.contentOffset.x + (0.5 * width)) / width
        
        if self.delegate != nil && (((self.delegate?.openedPage(pageCount:)) != nil)) {
            self.delegate?.openedPage(pageCount: Int(page))
        }
    }

}
