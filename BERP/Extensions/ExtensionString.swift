//
//  ExtensionString.swift
//  BERP
//
//  Created by User on 2019-07-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
extension String
{
    public func isValidEmail(Str:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: Str)
    }
}
