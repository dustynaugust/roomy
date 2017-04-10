//
//  Roomy.swift
//  roomy
//
//  Created by Dustyn August on 4/8/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit
import Parse

class Roomy: PFUser {
    

    var house: House?
    
    convenience init(username: String, password: String, email: String) {
        self.init()
        
        self.username = username
        self.password = password
        self.email = email
    }

}


extension Roomy {
    static func createUser(username: String, password: String, email: String, successful: @escaping (Bool) -> (), failure: @escaping (Error) -> () ) {
        
        let roomy = Roomy(username: username, password: password, email: email)
        
        roomy.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Successfully signed up a user: User.swift")
                successful(success)
            } else {
                print("Error signing up user: \(error?.localizedDescription) in User.swift")
                failure(error!)
            }
        }
    }
}




