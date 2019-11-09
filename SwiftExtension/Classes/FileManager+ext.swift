//
//  URL+ext.swift
//  SwiftExtension
//
//  Created by t on 2019/11/8.
//

import UIKit

 

extension FileManager {

    public static func documentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    public static func libraryDirectory() -> URL {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    public static func copyWith(srcURL: URL, to dstURL: URL) -> Bool {
        do {
            if FileManager.default.fileExists(atPath: dstURL.path) {
                try FileManager.default.removeItem(at: dstURL)
            }
            if !FileManager.default.fileExists(atPath: dstURL.path) {
                FileManager.default.createFile(atPath:dstURL.path , contents: nil, attributes: [:])
            }
            try FileManager.default.copyItem(at: srcURL, to: dstURL)
        } catch (let error) {
            print("Cannot copy item at \(srcURL) to \(dstURL): \(error)")
            return false
        }
        return true
    }
    
    public static func removeWith(fileURL:URL){
        //file
        if #available(iOS 9.0, *) {
            if !fileURL.hasDirectoryPath {
                if FileManager.default.fileExists(atPath:fileURL.path ){
                    do {
                        try FileManager.default.removeItem(at:fileURL )
                    }catch{
                        print("Could not remove \(fileURL): \(error)")
                    }
                }
                return
            }
        } else {
            // Fallback on earlier versions
        }
        
        // directory
        do {
            let filePaths = try FileManager.default.contentsOfDirectory(atPath: fileURL.path)
            for filePath in filePaths {
                try FileManager.default.removeItem(atPath: filePath)
            }
        } catch {
            print("Could not remove \(fileURL): \(error)")
        }
    }

}
