//
//  User.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class User:DisplayDelegate
{
    func display() -> String {
        return """
        User ID: \(userID)
        Email: \(email)
        
        """
    }
    
    private static var _userID:Int = 0
    var userID:Int
    var email:String
    var fullName:String
    private var password:String
    var address:String
    
    init(fullName: String , email:String, password:String, address:String)
    {
        self.email = email
        self.password = password
        self.address = address
        User._userID += 1
        self.userID = User._userID
        self.fullName = fullName
    }
    
    func doLogin(withEmail email :String, password:String) -> Bool
    {
        return self.email == email ? (self.password == password ?  true : false) : false
    }
    
}
