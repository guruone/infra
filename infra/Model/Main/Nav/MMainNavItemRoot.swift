import Foundation

class MMainNavItemRoot:MMainNavItem
{
    private let kImage:String = "navigationRoot"
    
    init(index:Int)
    {
        super.init(image:kImage, index:index)
    }
}