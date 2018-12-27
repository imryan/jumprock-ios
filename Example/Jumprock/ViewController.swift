//
//  ViewController.swift
//  Jumprock
//
//  Created by imryan on 12/27/2018.
//  Copyright (c) 2018 imryan. All rights reserved.
//

import UIKit
import Jumprock

class ViewController: UIViewController {
    
    // MARK: - Functions
    
    private func sendJumprockForm() {
        // Create a form
        let form = JumprockForm(subject: "Hello, world!",
                                message: "Some message.",
                                phone: "2125551234",
                                name: "Ryan Cohen",
                                replyToAddress: "someone@me.com",
                                redirectURLString: nil,
                                cc: ["someone@me.com", "someone_else@me.com"],
                                bcc: nil)
        
        // Send the form
        Jumprock.send(form, fromAlias: "notryancohen") { (error) in
            if let error = error {
                debugPrint("Did not send email:", error)
            }
            else {
                debugPrint("Sent email!")
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendJumprockForm()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
