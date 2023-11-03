//
//  LibraryTableViewCell.swift
//  OMPlayer
//
//  Created by Sergei Kornilov on 02/11/2023.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    let cardView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.layer.cornerRadius = 14
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let albumCoverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let trackNameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "trackNameLabel"
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        return label
    }()
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "artistNameLabel"
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "albumNameLabel"
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        cardView.addSubviews(albumCoverImage, trackNameLabel, artistNameLabel, albumNameLabel)
        self.addSubview(cardView)
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Set constraint
    func setConstraint() {
        [cardView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20),
         cardView.heightAnchor.constraint(equalToConstant: 70),
         cardView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
         cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
         
         albumCoverImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
         albumCoverImage.widthAnchor.constraint(equalToConstant: 50),
         albumCoverImage.heightAnchor.constraint(equalToConstant: 50),
         albumCoverImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
         
         trackNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
         trackNameLabel.leadingAnchor.constraint(equalTo: albumCoverImage.trailingAnchor, constant: 10),
         
         artistNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
         artistNameLabel.leadingAnchor.constraint(equalTo: trackNameLabel.trailingAnchor, constant: 10),

         albumNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 10),
         albumNameLabel.leadingAnchor.constraint(equalTo: albumCoverImage.leadingAnchor, constant: 60),
        ].forEach({$0.isActive = true})
    }
}
