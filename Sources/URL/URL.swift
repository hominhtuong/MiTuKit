//
//  URL.swift
//  MiTuKit
//
//  Created by Admin on 28/2/25.
//

import UIKit

public extension URL {
    var getPath: String {
        get {
            if #available(iOS 16, *) {
                return self.path(percentEncoded: false)
            }
            return self.path
        }
    }
    
    var attributes: [FileAttributeKey : Any]? {
        do {
            return try FileManager.default.attributesOfItem(atPath: path)
        } catch let error as NSError {
            print("FileAttribute error: \(error)")
        }
        return nil
    }

    var fileSize: UInt64 {
        return attributes?[.size] as? UInt64 ?? UInt64(0)
    }

    var fileSizeString: String {
        return ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
    }

    var creationDate: Date? {
        return attributes?[.creationDate] as? Date
    }
    
    var modificationDate: Date? {
        return attributes?[.modificationDate] as? Date
    }
    
}
