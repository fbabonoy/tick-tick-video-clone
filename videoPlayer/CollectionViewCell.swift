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
    var isPlaying = true
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let overlay: UIView = {
        let overlay = UIView()
        overlay.backgroundColor = .blue
        overlay.layer.opacity = 0.50
        return overlay
    }()
    
    lazy var playPauseButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImage(systemName: "pause")
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(playPauseAction), for: .touchDown)
        return button
    }()
    
    @objc func playPauseAction(){
        if isPlaying {
            player?.pause()
            playPauseButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            player?.play()
            playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        isPlaying = !isPlaying
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        
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
        overlay.frame = contentView.bounds
        addSubview(playPauseButton)
        playPauseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.ladedTimeRange" {
            
        }
    }
}
