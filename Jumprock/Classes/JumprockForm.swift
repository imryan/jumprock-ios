//
//  JumprockForm.swift
//  Jumprock
//
//  Created by Ryan Cohen on 12/27/18.
//

import Foundation

public struct JumprockForm {
    
    /// Form subject
    public let subject: String?
    /// Form message content
    public let message: String?
    
    /// Form send-to email address
    // let email: String?
    
    /// Form phone number
    public let phone: String?
    /// Form person's name
    public let name: String?
    /// Form reply-to email address
    public let replyToAddress: String?
    /// Form redirect to webpage URL string
    public let redirectURLString: String?
    /// Form CC recipients
    public let cc: [String]?
    /// Form BCC recipients
    public let bcc: [String]?
    /// Form anti-spam flag
    public let trapIt: Bool?
    
    // MARK: - Initialization
    
    public init(subject: String? = nil, message: String? = nil,
                phone: String? = nil, name: String? = nil,
                replyToAddress: String? = nil,
                redirectURLString: String? = nil,
                cc: [String]? = nil, bcc: [String]? = nil, trapIt: Bool = true) {
        
        self.subject = subject
        self.message = message
        self.phone = phone
        self.name = name
        self.replyToAddress = replyToAddress
        self.redirectURLString = redirectURLString
        self.cc = cc
        self.bcc = bcc
        self.trapIt = trapIt
    }
    
    // MARK: - Helpers
    
    public func asParameters() -> String {
        let components: [String : Any?] = [
            "subject" : subject,
            "message" : message,
            "phone" : phone,
            "name" : name,
            "replyToAddress" : replyToAddress,
            "redirectURLString" : redirectURLString,
            "cc" : cc,
            "bcc" : bcc,
            "trapIt" : trapIt
        ]
        
        var parameterString: String = ""
        for (field, value) in components {
            if let value = value {
                if let arrayValue = value as? [String] {
                    for recipient in arrayValue {
                        parameterString.append("&\(field)=\(recipient)")
                    }
                }
                else {
                    parameterString.append("&\(field)=\(value)")
                }
            }
        }
        
        parameterString.removeFirst(1)
        return parameterString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
