//
//  ImageSaver.swift
//  Project13
//
//  Created by Matt Ridenhour on 3/10/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        // save complete
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
