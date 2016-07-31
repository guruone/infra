import UIKit

class VMainBar:UIView
{
    weak var controller:CMainParent!
    weak var buttonSummary:VMainBarButton!
    weak var buttonHistory:VMainBarButton!
    weak var buttonConfig:VMainBarButton!
    private weak var layoutSummaryLeft:NSLayoutConstraint!
    private weak var layoutHistoryLeft:NSLayoutConstraint!
    private weak var layoutConfigLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 70
    private let kButtonHeight:CGFloat = 64
    private let kAnimationDurantion:NSTimeInterval = 0.3
    
    private lazy var totalWidth:CGFloat =
    {
        let width:CGFloat = self.bounds.maxX

        return width
    }()
    
    convenience init(controller:CMainParent)
    {
        self.init()
        backgroundColor = UIColor.main()
        clipsToBounds = true
        self.controller = controller
    }
    
    //MARK: actions
    
    //MARK: private
    
    private func animateButtons()
    {
        UIView.animateWithDuration(kAnimationDurantion)
        {
            self.layoutIfNeeded()
        }
    }
    
    //MARK: public
    
    func selectConfig(animate:Bool)
    {
        if animate
        {
            animateButtons()
        }
    }
}