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
        let widthRatio  = targetSize.width  / self.size.width
        let heightRatio = targetSize.height / self.size.height
        let newSize: CGSize
        
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: imageSize.width * heightRatio, height: imageSize.height * heightRatio)
        } else {
            newSize = CGSize(width: imageSize.width * widthRatio,  height: imageSize.height * widthRatio)
        }
        
        let rect = CGRect.init(origin: .init(x: 0, y: 0), size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
