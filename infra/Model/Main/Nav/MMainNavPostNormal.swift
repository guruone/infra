import Foundation

class MMainNavPosNormal:MMainNavPos
{
    override func adjust(bar:VMainBar)
    {
        bar.layoutCollectionLeft.constant = 0
        bar.layoutCollectionRight.constant = 0
    }
}