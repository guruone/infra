import Foundation

class MOnboardingItemHistoryModelItemDescr:MOnboardingItemHistoryModelItem
{
    init()
    {
        let reusableIdentifier:String = VOnboardingItemHistoryDescr.reusableIdentifier()
        super.init(reusableIdentifier:reusableIdentifier)
    }
}