//
//  ViewFactory.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

enum ViewFactory { // empty enum, to deny creating an instance
}

extension ViewFactory {
    static func makeLabel(_ text: String, width: CGFloat) -> UILabel {
        let resultLabel = UILabel()
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = text
        resultLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return resultLabel
    }
    
    static func makeAlert(title: String,
                            message: String = "") -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    static func makeSpinnerAlert(_ title: String,
                                   message: String = "") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 20, y: 20, width: 30, height: 30))
        loadingIndicator.style = .gray
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        return alert
    }
    
    static func makeErrorAlert(_ title: String = "Something bad happened",
                                 message: String) -> UIAlertController {
        let errorAlert = ViewFactory.makeAlert(title: title, message: message)
        let alertAction = UIAlertAction(title: "Ok =(", style: .cancel, handler: nil)
        errorAlert.addAction(alertAction)
        return errorAlert
    }
}

