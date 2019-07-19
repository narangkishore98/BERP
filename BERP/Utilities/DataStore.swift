//
//  DataStore.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class DataStore
{
    static var owners:[String:Owner] = [String:Owner]()
    static func readOwnersFromPlist()
    {
        let url = Bundle.main.url(forResource: "Owners", withExtension: "plist")
        if let ownersDict = NSDictionary(contentsOf: url!)
        {
            if let listOwners = ownersDict["owners"] as? [[String:String]]
            {
                for owner in listOwners
                {
                    if let email = owner["email"]
                    {
                        if let password = owner["password"]
                        {
                            if let fullName = owner["fullName"]
                            {
                                if let address = owner["address"]
                                {
                                    if  email.isValidEmail()
                                    {
                                        owners.updateValue(Owner(fullName: fullName, email: email, password: password, address: address), forKey: email)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}
