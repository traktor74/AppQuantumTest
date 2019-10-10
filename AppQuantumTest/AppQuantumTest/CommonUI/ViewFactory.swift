//
//  ViewFactory.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

class ViewFactory {
    static func createLabel(_ text: String, width: CGFloat) -> UILabel {
        let resultLabel = UILabel()
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = text
        resultLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return resultLabel
    }
    
    static func createAlert(_ title: String,
                            message: String = "",
                            spinner: Bool = false) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if spinner {
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 20, y: 20, width: 30, height: 30))
            loadingIndicator.style = UIActivityIndicatorView.Style.gray
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
        }
        return alert
    }
    
    static func createErrorAlert(_ title: String? = nil, message: String) -> UIAlertController {
        let alertTitle = title ?? "Something bad happened"
        let errorAlert = ViewFactory.createAlert(alertTitle, message: message)
        let alertAction = UIAlertAction(title: "Ok =(", style: .cancel, handler: nil)
        errorAlert.addAction(alertAction)
        return errorAlert
    }
}

