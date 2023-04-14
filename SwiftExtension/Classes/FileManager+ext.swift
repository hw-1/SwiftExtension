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
    
    public static func applicationDirectory() -> URL {
        let paths = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask)
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
            let dst = dstURL.deletingLastPathComponent()
            if !FileManager.default.fileExists(atPath: dst.path) {
                try FileManager.default.createDirectory(at: dst, withIntermediateDirectories: true, attributes: [:])
            }
            try FileManager.default.copyItem(at: srcURL, to: dstURL)
        } catch (let error) {
            print("Cannot copy item at \(srcURL) to \(dstURL): \(error)")
            return false
        }
        return true
    }
    
    public static func createDirectoryWith(fileURL:URL){
        do {
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.createDirectory(at: fileURL, withIntermediateDirectories: true, attributes: [:])
            }
        } catch {
            print("Could not remove \(fileURL): \(error)")
        }
    }
    
    public  static func isDirectory(fileURL:URL) -> Bool{
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if fileManager.fileExists(atPath: fileURL.path, isDirectory:&isDir) {
            return isDir.boolValue
        }
        return false
    }
    
    public static func renameWith(fileURL:URL,newFileURL:URL){
        do {
            try FileManager.default.moveItem(at: fileURL, to: newFileURL)
        } catch {
            print(error)
        }
    }
    
    public static func removeWith(fileURL:URL){
         
        //file
        if #available(iOS 9.0, *) {
            if !FileManager.isDirectory(fileURL: fileURL) {
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
                try FileManager.default.removeItem(atPath: fileURL.appendingPathComponent(filePath).path)
            }
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("Could not remove \(fileURL): \(error)")
        }
    }
    
    public static func listAllFile(path: URL, extensionWanted: String? = nil) -> (names : [String], paths : [URL]) {
 
        do {
            try FileManager.default.createDirectory(atPath: path.relativePath, withIntermediateDirectories: true)
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])

            // if you want to filter the directory contents you can do like this:
            let FilesPath = directoryContents.filter{ extensionWanted == nil ? true : $0.pathExtension == extensionWanted }
            let FileNames = FilesPath.map{ $0.deletingPathExtension().lastPathComponent }

            return (names : FileNames, paths : FilesPath);

        } catch {
            print(error.localizedDescription)
        }

        return (names : [], paths : [])
    }

}
