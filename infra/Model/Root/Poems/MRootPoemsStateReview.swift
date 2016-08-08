import Foundation

class MRootPoemsStateReview:MRootPoemsState
{
    private let kTitle:String = "Review"
    
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Review
        super.init(state:state, title:kTitle)
    }
}