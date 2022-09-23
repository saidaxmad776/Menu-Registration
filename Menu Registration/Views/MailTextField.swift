//
//  MailTextField.swift
//  Menu Registration
//
//  Created by Saidaxmad on 20/09/22.
//

import Foundation
import UIKit

protocol ActionMailTextFieldProtocol: AnyObject {
    func typingText(text: String)
    func cleanOutTextField()
}

class MailTextField: UITextField {
    
    weak var textFieldDelegate: ActionMailTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
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
        
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let updateText = text.replacingCharacters(in: rangeText, with: string)
            textFieldDelegate?.typingText(text: updateText)
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.cleanOutTextField()
        return true
    }
}
