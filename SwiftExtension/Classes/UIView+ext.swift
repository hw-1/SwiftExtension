//
//  UIView+ext.swift
//  APP_Example
//
//  Created by t on 2019/10/2.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
//import Toast_Swift
import AudioToolbox

extension  UIView {
   public static var seperateLineHeight:CGFloat{
        get{
            return   1 / (UIScreen.main.scale)
        }
    }
 
    
    public static func impactFeedback() {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        } else {
            // Fallback on earlier versions
        }
    }
    
   public  static func  playSystemSound(){
        DispatchQueue.global().async {
            AudioServicesPlaySystemSound(1104)
        }
    }
    
   public  func borderWith(color:UIColor){
        self.layer.borderWidth = UIView.seperateLineHeight
        self.layer.borderColor = color.cgColor
    }
    
   public  func roundCorner() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}
