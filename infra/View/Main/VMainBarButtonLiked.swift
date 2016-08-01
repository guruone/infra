import UIKit

class VMainBarButtonLiked:VMainBarButton
{
    private let kIcon:String = "liked"
    
    init()
    {
        super.init(image:kIcon)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}