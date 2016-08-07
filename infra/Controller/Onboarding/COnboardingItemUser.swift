import UIKit

class COnboardingItemUser:COnboardingItem, UITextFieldDelegate
{
    private var name:String?
    
    override func loadView()
    {
        view = VOnboardingItemUser(controller:self)
    }
    
    //MARK: actions
    
    func actionStart(sender button:UIButton)
    {
        button.alpha = 0.3
        view.userInteractionEnabled = false
        
        if name == nil
        {
            name = NSLocalizedString("COnboardingItemUser_defaultName", comment:"")
        }
        else if name!.isEmpty
        {
            name = NSLocalizedString("COnboardingItemUser_defaultName", comment:"")
        }
        
        MConfiguration.sharedInstance.user!.updateName(name!)
        MConfiguration.sharedInstance.user!.onboardingDone()
    }
    
    //MARK: field del
    
    func textFieldDidEndEditing(textField:UITextField)
    {
        name = textField.text
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}