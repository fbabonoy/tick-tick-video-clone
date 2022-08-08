//
//  CollectionViewCell.swift
//  videoPlayer
//
//  Created by fernando babonoyaba on 7/31/22.
//

import UIKit
import AVFoundation

class CollectionViewCell: UICollectionViewCell {
    
    static let videoCell = "VideoCell"
    var player: AVPlayer?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        let overlay = Overlay(frame: contentView.bounds)
        overlay.player = self
        guard let video = Bundle.main.path(forResource: "banana", ofType: "mp4")
        else { return }
        let url = URL(fileURLWithPath: video)
        player = AVPlayer(url: url)
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.videoGravity = .resizeAspectFill
        playerView.frame = contentView.bounds
        contentView.layer.addSublayer(playerView)
        
        player?.addObserver(self, forKeyPath: "currentItem.ladedTimeRange", options: .new, context: nil)
        player?.play()
        addSubview(overlay)
        
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.ladedTimeRange" {
            
        }
    }
}

extension CollectionViewCell: playerContoller {
    func play() {
        player?.play()

    }
    
    func pause() {
        player?.pause()
    }
    
    
}
