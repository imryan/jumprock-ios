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
    
    /// Custom form logo image (premium only)
    public let logoImageURLString: String?
    
    /// Hide Jumprock branding (premium only)
    public let hideBranding: Bool?
    
    // MARK: - Initialization
    
    public init(subject: String? = nil, message: String? = nil,
                phone: String? = nil,
                name: String? = nil,
                replyToAddress: String? = nil,
                redirectURLString: String? = nil,
                cc: [String]? = nil, bcc: [String]? = nil,
                logoImageURLString: String? = nil,
                hideBranding: Bool = false) {
        
        self.subject = subject
        self.message = message
        self.phone = phone
        self.name = name
        self.replyToAddress = replyToAddress
        self.redirectURLString = redirectURLString
        self.logoImageURLString = logoImageURLString
        self.hideBranding = hideBranding
        self.cc = cc
        self.bcc = bcc
    }
    
    // MARK: - Helpers
    
    public func asParameters() -> String {
        let components: [String : Any?] = [
            "subject" : subject,
            "message" : message,
            "phone" : phone,
            "name" : name,
            "cc" : cc,
            "bcc" : bcc,
            "trapit" : "",
            "replyToAddress" : replyToAddress,
            "redirectURLString" : redirectURLString,
            "logo" : logoImageURLString,
            "branding" : hideBranding
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
