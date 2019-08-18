//
//  Jumprock.swift
//  Jumprock
//
//  Created by Ryan Cohen on 12/27/2018.
//  Copyright (c) 2018 Ryan Cohen. All rights reserved.
//

open class Jumprock {
    
    // MARK: - Attributes
    
    public enum JumprockError: Error {
        case error(String)
        case badData
    }
    
    /// Jumprock API base URL
    private static let kJumprockBaseURLString: String = "https://jumprock.co/mail/%@"
    
    /// Form submission request completion block
    public typealias JumprockCompletionBlock = (_ error: JumprockError?) -> Void
    
    // MARK: - Functions
    
    public static func send(_ form: JumprockForm, fromAlias alias: String, block: @escaping JumprockCompletionBlock) {
        guard let url = URL(string: String(format: kJumprockBaseURLString, alias)), let httpBody = form.httpBody() else {
            block(.badData)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (_, _, error) -> Void in
            if let error = error {
                block(.error(error.localizedDescription))
            } else {
                block(nil)
            }
        }).resume()
    }
}
