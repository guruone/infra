import UIKit

class MOnboardingItemHistoryModelItemDescr:MOnboardingItemHistoryModelItem
{
    private let kCellWidth:CGFloat = 95
    
    init()
    {
        let reusableIdentifier:String = VOnboardingItemHistoryDescr.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellWidth:kCellWidth)
    }
}