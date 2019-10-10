//
//  Router.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

class Router {
    private var rootController: UINavigationController?
    
    func setWindowRootController(_ navController: UINavigationController) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navController
        rootController = navController
    }
    
    func pushToNavigationController(_ viewController: UIViewController) {
        rootController?.pushViewController(viewController, animated: true)
    }
    
    func present(_ alert: UIAlertController) {
        if let viewController = self.rootController?.viewControllers.first {
            DispatchQueue.main.async {
                viewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
