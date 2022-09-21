//
//  StatusLabel.swift
//  Menu Registration
//
//  Created by Saidaxmad on 20/09/22.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Chek your mail"
        textColor = .darkGray
        adjustsFontSizeToFitWidth = true
        font = UIFont(name: "Avenir-Black", size: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
