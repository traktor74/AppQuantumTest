//
//  PhotoDetailsViewController.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailsViewController: UIViewController {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var photoInfoView: UIStackView!
    var imageData: ImageInfoData?
    private lazy var detailsBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 6.0
        view.alpha = 0.7
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let imageData = imageData else { return }
        
        photoView.image = imageData.image
        photoInfoView.pinBackground(detailsBackgroundView)
        let labelWidth = photoInfoView.frame.width - 20
        let idLabel = ViewFactory.makeLabel("id: \(imageData.id)", width: labelWidth)
        let authorLabel = ViewFactory.makeLabel("author: \(imageData.author)", width: labelWidth)
        let widthLabel = ViewFactory.makeLabel("width: \(imageData.width)", width: labelWidth)
        let heightLabel = ViewFactory.makeLabel("height: \(imageData.height)", width: labelWidth)
        
        photoInfoView.addArrangedSubview(idLabel)
        photoInfoView.addArrangedSubview(authorLabel)
        photoInfoView.addArrangedSubview(widthLabel)
        photoInfoView.addArrangedSubview(heightLabel)
        
    }
}

