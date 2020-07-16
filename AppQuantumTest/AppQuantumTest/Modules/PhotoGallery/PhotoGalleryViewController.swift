//
//  PhotoGalleryViewController.swift
//  AppQuantumTest
//
//  Created by Pavel on 09/10/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: UIViewController {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var alert = ViewFactory.createAlert("Download started")
    var viewModel: PhotoGalleryViewModel?
    var coordinator: PhotoGalleryCoordinator?
    var imagesInfo: [ImageInfoData] = []
    
    var state: DownloadState = .started {
        didSet {
            handleStateChange()
        }
    }
    
    private var imagesCountLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onStateChange = { [weak self] state in
            self?.state = state
        }
        viewModel?.handleViewDidLoad()
        self.photosCollectionView.delegate = self
        self.photosCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if case .started =  state {
            alert = ViewFactory.createSpinnerAlert("Image Download")
            coordinator?.show(alert: alert)
        }
    }
    
    func handleStateChange() {
        switch state {
        case .started:
            print("download started")
        case .infoLoaded(let itemsCount):
            self.imagesCountLabel = "of \(itemsCount)"
        case .progress(let progress):
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.alert.message = "\(progress) downloaded \(self.imagesCountLabel)"
            }
        case .imageProcessing:
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.alert.message = "Images Processing"
            }
        case .finished(let images):
            self.imagesInfo = images
            DispatchQueue.main.async {
                self.alert.dismiss(animated: true, completion: nil)
                self.photosCollectionView.reloadData()
            }
        case .failed(let error):
            let errorAlert = ViewFactory.createErrorAlert(message: error.localizedDescription)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.alert.dismiss(animated: false, completion: {
                    self.present(errorAlert, animated: true, completion: nil)
                })
            }
        }
    }
    
    deinit {
        viewModel = nil
    }
}

extension PhotoGalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoGalleryCollectionCell
        cell.backgroundColor = .white // TODO: placeholder
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard imagesInfo.count > 0,
              let cell = cell as? PhotoGalleryCollectionCell else { return }
        cell.photoView.image = imagesInfo[indexPath.row].thumbnail
    }
    
}

extension PhotoGalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedImageInfo = imagesInfo[indexPath.row]
        coordinator?.startDetailedPhotoFlow(imageData: selectedImageInfo)
    }
}
