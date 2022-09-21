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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setDelegate()
        setConstraints()
    }


    private func setupView() {
        
        view.backgroundColor = #colorLiteral(red: 0.7050018907, green: 0.8277770877, blue: 0.8396216035, alpha: 1)
        view.addSubview(statusLabel)
        
    }

    private func setDelegate() {
        
    }
}

extension VerificationViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell.idMailCell.rawValue, for: indexPath) as? MailCollectionCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
}

extension VerificationViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ])
    }
}
