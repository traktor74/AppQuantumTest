//
//  PhotoGalleryCoordinator.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

class PhotoGalleryCoordinator: BaseCoordinator {
    var router = Router()
    
    func start() {
        let board = UIStoryboard(name: "Main", bundle: .main)
        if let vc = board.instantiateInitialViewController() as? PhotoGalleryViewController {
            let viewModel = PhotoGalleryViewModel(imageProvider: NetworkImageProvider()) // no time for swinject
            vc.viewModel = viewModel
            vc.coordinator = self
            let navigationVC = UINavigationController(rootViewController: vc)
            router.setWindowRootController(navigationVC)
        }
    }
    
    func startDetailedPhotoFlow(imageData: ImageInfoData) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "PhotoDetailsVC") as? PhotoDetailsViewController
        if let presentVC = vc {
            presentVC.imageData = imageData
            router.pushToNavigationController(presentVC)
        }
    }
}
