import UIKit

class MOnboardingItemHistoryModelItemImage:MOnboardingItemHistoryModelItem
{
    private let kCellWidth:CGFloat = 225
    
    init()
    {
        let reusableIdentifier:String = VOnboardingItemHistoryImage.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier, cellWidth:kCellWidth)
    }
}