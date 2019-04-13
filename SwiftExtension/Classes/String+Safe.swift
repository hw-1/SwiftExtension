
import UIKit

public  extension NSObject {
   public  class func safeString(_ string: Any?) -> String {
        let s = string ?? ""
        return s as! String
    }
}


