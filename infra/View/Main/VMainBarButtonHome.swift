import UIKit

class VMainBarButtonHome:VMainBarButton
{
    private let kIcon:String = "home"
    
    init()
    {
        super.init(image:kIcon)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}