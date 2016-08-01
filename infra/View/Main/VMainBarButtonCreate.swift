import UIKit

class VMainBarButtonCreate:VMainBarButton
{
    private let kIcon:String = "create"
    
    init()
    {
        super.init(image:kIcon)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}