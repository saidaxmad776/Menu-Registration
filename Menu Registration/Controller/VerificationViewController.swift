//
//  ViewController.swift
//  Menu Registration
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class VerificationViewController: UIViewController {
    

    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var stackView = UIStackView(arrangeSubviews: [mailTextField,
                                                               verificationButton,
                                                               collectionView],
                                             axis: .vertical, spacing: 20)
    
    private let verificationModel = VerificationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setDelegate()
        setConstraints()
    }


    private func setupView() {
        
        view.backgroundColor = #colorLiteral(red: 0.7554480433, green: 0.7874316573, blue: 0.84071666, alpha: 1)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        
        verificationButton.addTarget(self, action: #selector(verificationButtonTap), for: .touchUpInside)
        
    }

    private func setDelegate() {
        
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextField.textFieldDelegate = self
    }
    
    @objc private func verificationButtonTap() {
        
    }
}

extension VerificationViewController: ActionMailTextFieldProtocol {
    
    func typingText(text: String) {
        statusLabel.isValid = text.isValid()
        verificationButton.isValid = text.isValid()
        verificationModel.getFilteredMail(text: text)
        collectionView.reloadData()
    }
    
    func cleanOutTextField() {
        statusLabel.setDefoultSettings()
        verificationButton.setDefoultSettings()
        verificationModel.filterMailArray = []
        collectionView.reloadData()
    }
    
}

extension VerificationViewController: UICollectionViewDataSource, SelectProposedMailProtocol {
    
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = mailTextField.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filterMailArray[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainMail
        mailTextField.text = mailFullName
        statusLabel.isValid = mailFullName.isValid()
        verificationButton.isValid = mailFullName.isValid()
        verificationModel.filterMailArray = []
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filterMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell.idMailCell.rawValue, for: indexPath) as? MailCollectionCell else { return UICollectionViewCell() }
        
        let mailLabelText = verificationModel.filterMailArray[indexPath.row]
        cell.cellConfigure(mailText: mailLabelText)
        
        return cell
    }
    
}

extension VerificationViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}
