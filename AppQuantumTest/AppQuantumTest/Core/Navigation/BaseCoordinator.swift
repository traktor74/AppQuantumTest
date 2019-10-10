//
//  BaseCoordinator.swift
//  AppQuantumTest
//
//  Created by Pavel on 10/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCoordinator {
    var router: Router { get set }
    
    func start()
    func show(alert: UIAlertController)
}

extension BaseCoordinator {    
    func show(alert: UIAlertController) {
        router.present(alert)
    }
}
