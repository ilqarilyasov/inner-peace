//
//  Date+Future.swift
//  InAPeace
//
//  Created by Ilgar Ilyasov on 2/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension Date {
    func byAdding(days: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days
        
        return Calendar.current.date(byAdding: dateComponents, to: self) ?? self
    }
}
