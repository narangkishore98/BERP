//
//  Owner.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-17.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
class Owner : User
{
    private var myEnterprises:[Enterprise]
     init(fullName: String, email: String, password: String, address: String) {
        myEnterprises = Array<Enterprise>()
        super.init(fullName: fullName, email: email, password: password, address: address, userType: .Owner)
    }
    func addEnterprise(enterprise:Enterprise)
    {
        myEnterprises.append(enterprise)
    }
    func getAllEnterprises() -> [Enterprise]
    {
        return myEnterprises
    }
}
