//
//  overlay.swift
//  videoPlayer
//
//  Created by fernando babonoyaba on 8/7/22.
//

import UIKit

class Overlay: UIView {

    var isPlaying = true
    weak var player: playerContoller?

    lazy var playPauseButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImage(systemName: "pause")
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(playPauseAction), for: .touchDown)
        return button
    }()
    
    var progress: UIProgressView = {
        let bar = UIProgressView(progressViewStyle: .bar)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.trackTintColor = .red
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addSubview(playPauseButton)
        addSubview(progress)
        playPauseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        progress.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
    }
    
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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
