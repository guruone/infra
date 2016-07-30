import Foundation
import Firebase

class CFirebaseStorageNews
{
    weak var delegate:CFirebaseStorageNewsDelegate?
    weak var storage:FIRStorageReference?
    private var newsImage:UIImage?
    private var newsText:String?
    private var newsImageReference:String?
    private var newsTextReference:String?
    private let kReferenceRoot:String = "news"
    private let kPListImage:String = "image"
    private let kPListText:String = "text"
    private let kFiveMegaBytes:Int64 = 5242880
    
    init(storage:FIRStorageReference?, delegate:CFirebaseStorageNewsDelegate?)
    {
        self.storage = storage
        self.delegate = delegate
        loadMap()
    }
    
    //MARK: private
    
    private func error(errorDescription:String)
    {
        delegate?.firebaseStorageNewsError(errorDescription)
    }
    
    private func errorUnknown()
    {
        let errorDescription:String = NSLocalizedString("general_errorDownload", comment:"")
        error(errorDescription)
    }
    
    private func loadMap()
    {
        let reference:FIRStorageReference? = storage?.child(kReferenceRoot)
        
        if reference == nil
        {
            errorUnknown()
        }
        else
        {
            reference!.dataWithMaxSize(kFiveMegaBytes)
            { [weak self] (data, error) in
                
                if error == nil && data != nil
                {
                    let dictionary:[String:String]?
                    
                    do
                    {
                        try dictionary = NSPropertyListSerialization.propertyListWithData(data!, options: NSPropertyListReadOptions.Immutable, format:nil) as? [String:String]
                    }
                    catch
                    {
                        dictionary = nil
                    }
                    
                    if dictionary == nil
                    {
                        self?.errorUnknown()
                    }
                    else
                    {
                        if self != nil
                        {
                            self!.newsImageReference = dictionary![self!.kPListImage]
                            self!.newsTextReference = dictionary![self!.kPListText]
                            
                            if self!.newsImageReference == nil || self!.newsTextReference == nil
                            {
                                self!.errorUnknown()
                            }
                            else
                            {
                                self!.loadText()
                            }
                        }
                    }
                }
                else
                {
                    let errorDescription:String? = error!.localizedDescription
                    
                    if errorDescription == nil
                    {
                        self?.errorUnknown()
                    }
                    else
                    {
                        self?.error(errorDescription!)
                    }
                }
            }
        }
    }
    
    private func loadText()
    {
        let reference:FIRStorageReference? = storage?.child(newsTextReference!)
        
        if reference == nil
        {
            errorUnknown()
        }
        else
        {
            reference!.dataWithMaxSize(kFiveMegaBytes)
            { [weak self] (data, error) in
                
                if error == nil && data != nil
                {
                    self?.newsText = String(data:data!, encoding:NSUTF8StringEncoding)
                    
                    if self?.newsText == nil
                    {
                        self?.errorUnknown()
                    }
                    else
                    {
                        self?.loadImage()
                    }
                }
                else
                {
                    let errorDescription:String? = error!.localizedDescription
                    
                    if errorDescription == nil
                    {
                        self?.errorUnknown()
                    }
                    else
                    {
                        self?.error(errorDescription!)
                    }
                }
            }
        }
    }
    
    private func loadImage()
    {
        let reference:FIRStorageReference? = storage?.child(newsImageReference!)
        
        if reference == nil
        {
            errorUnknown()
        }
        else
        {
            reference!.dataWithMaxSize(kFiveMegaBytes)
            { [weak self] (data, error) in
                
                if error == nil && data != nil
                {
                    self?.newsImage = UIImage(data:data!)
                    
                    if self?.newsImage == nil
                    {
                        self?.errorUnknown()
                    }
                    else
                    {
                        self?.loadFinished()
                    }
                }
                else
                {
                    let errorDescription:String? = error!.localizedDescription
                    
                    if errorDescription == nil
                    {
                        self?.errorUnknown()
                    }
                    else
                    {
                        self?.error(errorDescription!)
                    }
                }
            }
        }
    }
    
    private func loadFinished()
    {
        delegate?.firebaseStorageNewsLoaded(newsImage!, text:newsText!)
    }
}