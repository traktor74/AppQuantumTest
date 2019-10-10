//
//  AppDelegate.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialCoordinator: BaseCoordinator = PhotoGalleryCoordinator()
        initialCoordinator.start()
        return true
    }
}

