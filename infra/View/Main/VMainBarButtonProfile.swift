import UIKit

class VMainBarButtonProfile:VMainBarButton
{
    private let kIcon:String = "profile"
    
    init()
    {
        super.init(image:kIcon)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}