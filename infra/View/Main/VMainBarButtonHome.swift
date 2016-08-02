import UIKit

class VMainBarButtonHome:VMainBarButton
{
    private let kIcon:String = "navigationHome"
    
    init()
    {
        super.init(image:kIcon)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}