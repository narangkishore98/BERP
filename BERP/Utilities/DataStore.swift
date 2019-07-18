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
    static var owners:[Owner] = [Owner]()
    static func getOwnerByEmail(_ email:String) -> Owner?
    {
        for owner in owners
        {
            if owner.email == email
            {
                return owner
            }
        }
        return nil
    }
    
}
