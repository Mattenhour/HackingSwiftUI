//
//  FileManager+UIImage.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/10/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation

import SwiftUI

enum FileError: Error {
    case empty
}

extension FileManager {
    private var documentsDirectory: URL? {
        urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func saveImage(_ image: UIImage, to filePath: String, completion: ((Error?) -> Void)? = nil) {
        guard let documentsDirectory = documentsDirectory else { return }
        
        let fileUrl = documentsDirectory.appendingPathComponent(filePath)
        
        guard let imageData =  image.jpegData(compressionQuality: 0.8) else {
            completion?(FileError.empty)
            return
        }
        
        do {
            try imageData.write(to: fileUrl, options: [.atomicWrite, .completeFileProtection])
            completion?(nil)
        } catch {
            completion?(FileError.empty)
        }
    }
    
}
