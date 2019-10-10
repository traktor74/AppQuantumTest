//
//  UIImage+Resize.swift
//  AppQuantumTest
//
//  Created by Pavel on 10/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizedImage(with targetSize: CGSize) -> UIImage? {
        
        let imageSize = self.size
        let newWidth  = targetSize.width  / self.size.width
        let newHeight = targetSize.height / self.size.height
        var newSize: CGSize
        
        if(newWidth > newHeight) {
            newSize = CGSize(width: imageSize.width * newHeight, height: imageSize.height * newHeight)
        } else {
            newSize = CGSize(width: imageSize.width * newWidth,  height: imageSize.height * newWidth)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        self.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
