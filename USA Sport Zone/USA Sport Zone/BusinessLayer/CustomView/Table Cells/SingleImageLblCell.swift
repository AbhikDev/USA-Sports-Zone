
import UIKit

class SingleImageLblCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var pageControl: UIPageControl!
    var presentationPageIndex: NSInteger = 0
    
    var arrBannerDataSet: Array<[String:Any]> = []
    
    //let customFlowLayout = CustomFlowLayout()
    var isEventSelected = false
    var isCornerRadiousNotRequired = true
    //weak var delegate: TableViewGalleryCellDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var timer = Timer()
    var CallFor = ""
    
    var visibleIndexPath: IndexPath? = nil
    
    var direction: UICollectionView.ScrollDirection = .horizontal
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        pageControl.hidesForSinglePage = true
        
        //let layout = UICollectionViewFlowLayout()
        //layout.scrollDirection = .horizontal
        //self.collectionView.collectionViewLayout = layout
        let cellNib = UINib(nibName: "MainItemCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "itemMain")
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView?.isPagingEnabled = true
    }
   
    func cellConfigure(arrDataSet: Array<[String:Any]>) {
        
        arrBannerDataSet = arrDataSet
        collectionView.reloadData()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = arrBannerDataSet.count;
        return arrBannerDataSet.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: MainItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemMain", for: indexPath) as? MainItemCollectionViewCell
        {
            
            let dict = arrBannerDataSet[indexPath.row]
            cell.imgMainProductItem.image = UIImage(named: "AppLogo")
            /*
            let imgPath =  dict["banner_image"] as! String
            cell.imgMainProductItem.downloadImageWith(URL: imgPath, Placeholder: UIImage(named: "AppLogo")!)
          */
            cell.imgMainProductItem.contentMode = .scaleAspectFill
           
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
         return CGSize(width:UIScreen.main.bounds.size.width , height: 290)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            self.visibleIndexPath = visibleIndexPath
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        /*
        if let visibleIndexPath = self.visibleIndexPath {
            
            // This conditional makes sure you only animate cells from the bottom and not the top, your choice to remove.
            if indexPath.row > visibleIndexPath.row {
                
                cell.contentView.alpha = 0.3
                
                cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
                
                // Simple Animation
                UIView.animate(withDuration: 0.5) {
                    cell.contentView.alpha = 1
                    cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
                }
            }
        }*/
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
               cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
               },completion: { finished in
                UIView.animate(withDuration: 0.1, animations: {
                       cell.layer.transform = CATransform3DMakeScale(1,1,1)
                   })
           })
    }
}
