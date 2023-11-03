//
//  LibraryViewController.swift
//  OMPlayer
//
//  Created by Sergei Kornilov on 02/11/2023.
//

import Foundation
import UIKit

class LibraryViewController: UIViewController {
    
    let tableView = UITableView()
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Table"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //view.backgroundColor = .magenta
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LibraryTableViewCell.self, forCellReuseIdentifier: "cell")
            //tableView.separatorStyle = .none
        tableView.toAutoLayout()
        
        view.addSubview(tableView)
        tableView.backgroundColor = .red
        
        setConstraint()
    }
    
    func configureSongs() {
        songs.append(Song(albumCover: "Image URL 1",
                          artistName: "Artist name 1",
                          trackName: "Track name 1",
                          albumName: "Album name 1"))
        songs.append(Song(albumCover: "Image URL 2",
                          artistName: "Artist name 2",
                          trackName: "Track name 2",
                          albumName: "Album name 2"))
        songs.append(Song(albumCover: "Image URL 3",
                          artistName: "Artist name 3",
                          trackName: "Track name 3",
                          albumName: "Album name 3"))
    }
    
    
    //MARK: Set constraint
    func setConstraint() {
        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ].forEach({$0.isActive = true})
    }
    
}

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count // Замените на ваш массив данных
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LibraryTableViewCell
        let song = songs[indexPath.row]
        
        cell.artistNameLabel.text = song.artistName
        cell.trackNameLabel.text = song.trackName
        cell.albumNameLabel.text = song.albumName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        //present player
        //let position = indexPath.row
        //songs
        return
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

struct Song {
    let albumCover: String
    let artistName: String
    let trackName: String
    let albumName: String
}

class TableViewCell: UITableViewCell {
    
}
