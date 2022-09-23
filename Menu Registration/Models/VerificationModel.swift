//
//  VerificationModel.swift
//  Menu Registration
//
//  Created by Saidaxmad on 23/09/22.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@yahoo.com"]
    
    public var nameMail = String()
    public var filterMailArray = [String]()
    
    private func filteringMails(text: String) {
        
        var domainMail = String()
        filterMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filterMailArray.contains(mail) {
                    filterMailArray.append(mail)
                }
            }
        }
    }
    
    public func getFilteredMail(text: String) {
        filteringMails(text: text)
    }
}
