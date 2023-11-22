//
//  PlayerView.swift
//  OMPlayer
//
//  Created by Sergei Kornilov on 30/10/2023.
//

import UIKit
import Foundation

class PlayerView: UIView {
    
    //MARK: Set UI elements
    private lazy var albumCover: UIImageView = {
        let albumCover = UIImageView(image: UIImage(named: "Linkin_Park_-_Numb_CD_cover"))
        albumCover.toAutoLayout()
        albumCover.clipsToBounds = true
        albumCover.layer.borderWidth = 3
        albumCover.layer.borderColor = UIColor.white.cgColor
        albumCover.backgroundColor = .red
        return albumCover
    }()
    
    let trackTitle: UILabel = {
        let trackTitle = UILabel()
        trackTitle.toAutoLayout()
        trackTitle.font = .systemFont(ofSize: 19, weight: .regular)
        return trackTitle
    }()
    
    var playButton: UIButton = {
        let playButton = UIButton()
        playButton.toAutoLayout()
        playButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        playButton.tintColor = .black
        return playButton
    }()
    
    var pauseButton: UIButton = {
        let pauseButton = UIButton()
        pauseButton.toAutoLayout()
        pauseButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        pauseButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        pauseButton.tintColor = .black
        pauseButton.isHidden = true
        return pauseButton
    }()
    
    var nextTrackButton: UIButton = {
        let nextTrackButton = UIButton()
        nextTrackButton.toAutoLayout()
        nextTrackButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        nextTrackButton.setBackgroundImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        nextTrackButton.tintColor = .black
        
        return nextTrackButton
    }()
    
    var prevTrackButton: UIButton = {
        let prevTrackButton = UIButton()
        prevTrackButton.toAutoLayout()
        prevTrackButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        prevTrackButton.setBackgroundImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        prevTrackButton.tintColor = .black
        return prevTrackButton
    }()
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        addSubviews(albumCover, trackTitle, playButton, pauseButton, nextTrackButton, prevTrackButton)
        //scrollView.backgroundColor = .orange
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Set constraint
    func setConstraint() {
        [albumCover.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -80),
         albumCover.heightAnchor.constraint(equalTo: albumCover.widthAnchor, multiplier: 1),
         albumCover.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
         albumCover.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
         
         trackTitle.topAnchor.constraint(equalTo: albumCover.bottomAnchor, constant: 20),
         trackTitle.widthAnchor.constraint(equalToConstant: 200),
         trackTitle.heightAnchor.constraint(equalToConstant: 24),
         trackTitle.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
         
         playButton.topAnchor.constraint(equalTo: trackTitle.bottomAnchor, constant: 40),
         playButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
         playButton.widthAnchor.constraint(equalToConstant: 100),
         playButton.heightAnchor.constraint(equalToConstant: 100),
         
         pauseButton.topAnchor.constraint(equalTo: trackTitle.bottomAnchor, constant: 40),
         pauseButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
         pauseButton.widthAnchor.constraint(equalToConstant: 100),
         pauseButton.heightAnchor.constraint(equalToConstant: 100),
         
         nextTrackButton.topAnchor.constraint(equalTo: trackTitle.bottomAnchor, constant: 65),
         nextTrackButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 80),
         nextTrackButton.widthAnchor.constraint(equalToConstant: 50),
         nextTrackButton.heightAnchor.constraint(equalToConstant: 50),
         
         prevTrackButton.topAnchor.constraint(equalTo: trackTitle.bottomAnchor, constant: 65),
         prevTrackButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: -80),
         prevTrackButton.widthAnchor.constraint(equalToConstant: 50),
         prevTrackButton.heightAnchor.constraint(equalToConstant: 50),
         
        ].forEach({$0.isActive = true})
    }
}
