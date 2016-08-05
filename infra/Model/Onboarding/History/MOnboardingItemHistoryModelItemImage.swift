import Foundation

class MOnboardingItemHistoryModelItemImage:MOnboardingItemHistoryModelItem
{
    init()
    {
        let reusableIdentifier:String = VOnboardingItemHistoryImage.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier)
    }
}