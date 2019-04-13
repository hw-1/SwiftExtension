//
//  String+Regex.swift
//  SwiftExtension
//
//  Created by hw on 2019/4/12.
//

import UIKit

public extension String {
    
    public var isPhoneNumber: Bool {
        let s = self
        let phoneRegex = "[1]{1}([0-9]{10})?"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: s)
    }
     
}
