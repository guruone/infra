import Foundation

class MRootPoemsStateReview:MRootPoemsState
{
    init()
    {
        let state:DInfraPoem.DInfraPoemStatus = DInfraPoem.DInfraPoemStatus.Review
        super.init(state:state)
    }
}