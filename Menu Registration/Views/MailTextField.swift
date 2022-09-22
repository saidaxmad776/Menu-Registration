//
//  MailTextField.swift
//  Menu Registration
//
//  Created by Saidaxmad on 20/09/22.
//

import Foundation
import UIKit

class MailTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .red
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter mail"
        font = UIFont(name: "Verdana-Bold", size: 20)
        tintColor = .darkGray
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension MailTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
