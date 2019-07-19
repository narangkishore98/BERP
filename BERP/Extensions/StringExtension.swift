//
//  StringExtension.swift
//  BERP
//
//  Created by Kishore Narang on 2019-07-19.
//  Copyright © 2019 Bikloo. All rights reserved.
//

import Foundation
extension String
{
    func isValidEmail() -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
