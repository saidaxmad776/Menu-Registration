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
    
    private func deriveNameMail(text: String) {
        guard let atSimbolIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: atSimbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        
        nameMail = String(range)
    }
    
    public func getFilteredMail(text: String) {
        filteringMails(text: text)
    }
    
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
