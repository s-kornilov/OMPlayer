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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.toAutoLayout()
        view.addSubview(playerView)
        view.backgroundColor = .orange
        setConstraint()
        
        playerView.playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playerView.pauseButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playerView.nextTrackButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playerView.prevTrackButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
    }
    
    //MARK: Set constraint
    func setConstraint() {
        [playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         playerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         playerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         playerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ].forEach({$0.isActive = true})
    }
    
    
    @objc func playButtonTapped() {
        print("some button tapped")
    }
}
