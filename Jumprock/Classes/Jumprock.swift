//
//  Jumprock.swift
//  Jumprock
//
//  Created by Ryan Cohen on 12/27/2018.
//  Copyright (c) 2018 Ryan Cohen. All rights reserved.
//

open class Jumprock {
    
    // MARK: - Attributes
    
    private static let BASE_URL: String = "https://jumprock.co/mail/%@"
    
    public typealias JumprockCompletionBlock = (_ error: Error?) -> Void
    
    // MARK: - Functions
    
    public static func send(_ form: JumprockForm, fromAlias alias: String, block: @escaping JumprockCompletionBlock) {
        var request = URLRequest(url: URL(string: String(format: BASE_URL, alias))!)
        request.httpMethod = "POST"
        request.httpBody = form.asParameters().data(using: .ascii)
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (_, _, error) -> Void in
            if let error = error {
                block(error)
            } else {
                block(nil)
            }
        }).resume()
    }
}
