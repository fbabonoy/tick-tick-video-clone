//
//  CollectionViewCell.swift
//  videoPlayer
//
//  Created by fernando babonoyaba on 7/31/22.
//

import UIKit
import AVFoundation

protocol playerContoller: AnyObject {
    func play()
    func pause()
    func sliderTimeSet(_ percentage: Float)
}

class CollectionViewCell: UICollectionViewCell {
    
    static let videoCell = "VideoCell"
    var player: AVPlayer?
    var overlay = Overlay(frame: .zero)

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        overlay.frame = contentView.bounds
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
        player?.isMuted = true
        let time = CMTime(value: 1, timescale: 2)
        player?.addPeriodicTimeObserver(forInterval: time, queue: .main, using: { (progressTime) in
            self.getPercentage()
        })
        addSubview(overlay)
        
    }
    
    
    func getPercentage() {
        guard let videoPlayer = player, let duration = videoPlayer.currentItem?.duration else {
            return
        }
        
        let durationInSeconds = CMTimeGetSeconds(duration)
        let currentTime = CMTimeGetSeconds(videoPlayer.currentTime())
        overlay.setSlider(value: Float(currentTime/durationInSeconds))
    }
}

extension CollectionViewCell: playerContoller {
    func sliderTimeSet(_ percentage: Float) {
        guard let videoPlayer = player, let duration = videoPlayer.currentItem?.duration else {
            return
        }
        let durationInSeconds = CMTimeGetSeconds(duration)
        let newtime = durationInSeconds * Float64(percentage)
        print(Int64(newtime))
        let time2 = CMTime(value: Int64(newtime), timescale: 1)
        videoPlayer.seek(to: time2)
        
        let vi = CMTimeGetSeconds(videoPlayer.currentTime())
        print(vi)
    }
    
    func play() {
        player?.play()

    }
    
    func pause() {
        player?.pause()
    }
    
    
}
