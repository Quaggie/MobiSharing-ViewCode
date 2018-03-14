//
//  MotorcycleTableViewCell.swift
//  MobiSharing ViewCode
//
//  Created by Jonathan Bijos on 14/03/18.
//  Copyright © 2018 DevsCarioca. All rights reserved.
//

import UIKit

class MotorcycleTableViewCell: UITableViewCell {
    
    static var height: CGFloat {
        return 80
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var motorcycle: Motorcycle? {
        didSet {
            if let motorcycle = motorcycle {
                imgView.image = motorcycle.image
                titleLabel.text = motorcycle.name
                subtitleLabel.text = motorcycle.type.rawValue
            }
        }
    }
    
    private let imgView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(imgView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
}
