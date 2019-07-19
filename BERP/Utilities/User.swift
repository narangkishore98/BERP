//
//  User.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
enum UserType
{
    case Owner,Employee
}
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
    var userType:UserType
    var address:String
    
    init(fullName:String, email:String, password:String, address:String, userType:UserType)
    {
        self.email = email
        self.password = password
        self.address = address
        User._userID += 1
        self.userID = User._userID
        self.fullName = fullName
        self.userType = userType
    }
    
    func doLogin(password:String) -> Bool
    {
        return (self.password == password ?  true : false) 
    }
    
}
