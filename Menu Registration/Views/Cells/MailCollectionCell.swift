//
//  MailCollectionCell.swift
//  Menu Registration
//
//  Created by Saidaxmad on 21/09/22.
//

import Foundation
import UIKit


class MailCollectionCell: UICollectionViewCell {
    
    private let domainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
        addSubview(domainLabel)
    }
    
    private func setConstarints() {
        
        NSLayoutConstraint.activate([
        
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
