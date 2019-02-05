//
//  Quote.swift
//  InAPeace
//
//  Created by Ilgar Ilyasov on 2/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let text: String
    let author: String
    
    var shareMessage: String {
        return "\"\(text)\" - \(author)"
    }
}
