//
//  extensionString.swift
//  BERP
//
//  Created by Das Tarlochan Preet Singh on 2019-07-18.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
extension String
{
    // For Email Valid
    public func isValidEmail() -> Bool
    {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailTest.evaluate(with: self)
    }
    
}
