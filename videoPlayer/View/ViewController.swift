//
//  ViewController.swift
//  videoPlayer
//
//  Created by fernando babonoyaba on 7/31/22.
//

import UIKit

protocol playerContoller: AnyObject {
    func play()
    func pause()
}

class ViewController: UIViewController, UICollectionViewDataSource {
    
    lazy var carousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
//        layout.footerReferenceSize = .zero
//        layout.headerReferenceSize = .zero
        let videoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        videoCollection.isPagingEnabled = true
        videoCollection.translatesAutoresizingMaskIntoConstraints = false
        videoCollection.dataSource = self
        videoCollection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.videoCell)
        videoCollection.backgroundColor = .white
        return videoCollection
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        view.addSubview(carousel)
        
        carousel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        carousel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        carousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carousel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.videoCell, for: indexPath) as! CollectionViewCell
        
        return cell
    }

}

