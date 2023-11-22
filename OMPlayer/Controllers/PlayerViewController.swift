//
//  PlayerViewController.swift
//  OMPlayer
//
//  Created by Sergei Kornilov on 30/10/2023.
//

import Foundation
import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    let playerView = PlayerView()
    var currentIndex: Int = 0
    var songs: [Song] = []
    var player: AVAudioPlayer?
    
    init?(songs: [Song], initialIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        guard songs.indices.contains(initialIndex) else {
            return nil
        }
        self.songs = songs
        self.currentIndex = initialIndex
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.toAutoLayout()
        view.addSubview(playerView)
        view.backgroundColor = .orange
        setConstraint()
        checkPlayerStatus()
        configure(for: songs[currentIndex])
        controlButtonsActions()
    }
    
    //MARK: Set constraint
    func setConstraint() {
        [playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         playerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         playerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         playerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ].forEach({$0.isActive = true})
    }
    
   
    //MARK: Configure player for song
    func configure(for song: Song) {
        playerView.trackTitle.text = song.trackName
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
            
            guard let urlString = urlString else {
                print("urlString is nil")
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = player else{
                return
            }
            player.play()
        }
        catch {
            print("error occurred")
        }
    }
    
    // Check player status and show/hide play/pause button
    func checkPlayerStatus() {
        if player?.isPlaying == true {
            playerView.playButton.isHidden = false
            playerView.pauseButton.isHidden = true
        }
        else {
            playerView.playButton.isHidden = true
            playerView.pauseButton.isHidden = false
        }
    }
    
    
    //MARK: Configure control buttons
    func controlButtonsActions() {
        playerView.playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playerView.pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        playerView.nextTrackButton.addTarget(self, action: #selector(nextTrackButtonTapped), for: .touchUpInside)
        playerView.prevTrackButton.addTarget(self, action: #selector(prevTrackButtonTapped), for: .touchUpInside)
    }
    
    @objc func playButtonTapped() {
        //print("tap PLAY button")
        checkPlayerStatus()
        player?.play()
    }
    @objc func pauseButtonTapped() {
        //print("tap PAUSE button")
        checkPlayerStatus()
        player?.pause()
    }
    
    @objc func nextTrackButtonTapped() {
        //print("tap NEXT button")
        if currentIndex < songs.count - 1 {
            currentIndex += 1
            let nextSong = songs[currentIndex]
            configure(for: nextSong)
            player?.play()
        }else {
            print("Error! Out of range")
        }
    }
    
    @objc func prevTrackButtonTapped() {
        //print("tap PREV button")
        if currentIndex > 0 {
            currentIndex -= 1
            let prevSong = songs[currentIndex]
            configure(for: prevSong)
            player?.play()
        }else {
            print("Error! Out of range")
        }
    }
}
