import UIKit

class MOnboardingItemHistoryModelItemImage:MOnboardingItemHistoryModelItem
{
    private let kCellWidth:CGFloat = 182
    
    init()
    {
        let reusableIdentifier:String = VOnboardingItemHistoryImage.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellWidth:kCellWidth)
    }
}