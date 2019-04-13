//
//  FileManager.swift
//  SwiftExtension
//
//  Created by hw on 2019/4/12.
//

import Foundation

public extension FileManager {

   public class func documentsDirectoryURL() -> URL
    {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
   public class  func libraryDirectoryURL() -> URL
    {
        return FileManager.default.urls(for: FileManager.SearchPathDirectory.libraryDirectory, in: .userDomainMask).first!
    }
 
    
}
