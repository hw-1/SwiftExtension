//
//  TimerIntervalWrapper.swift
//  Macao
//
//  Created by t on 2019/10/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TimerIntervalWrapper: NSObject {
      var map = [String:Any]()
      static var shared = TimerIntervalWrapper()
      
    func invokeWith(name:String) -> Bool{
        if let date = map[name] as? Date  {
             let interval = date.timeIntervalSinceNow * (-1.0)
             if interval < 1 {
                 return false
             }
        }
         
        map[name] = Date()
        return true
    }
}
