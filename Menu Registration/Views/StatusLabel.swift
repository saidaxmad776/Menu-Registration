//
//  StatusLabel.swift
//  Menu Registration
//
//  Created by Saidaxmad on 20/09/22.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSettings()
            } else {
                setNotValidSettings()
            }
        }
    }
    
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
        font = UIFont(name: "Avenir-Black", size: 17)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSettings() {
        text = "Mail is not valid. Example: name@domain.ru"
        textColor = .red
    }
    
    private func setValidSettings() {
        text = "Mail is not valid"
        textColor = .systemGreen
    }
    
    public func setDefoultSettings() {
        configure()
    }
}
