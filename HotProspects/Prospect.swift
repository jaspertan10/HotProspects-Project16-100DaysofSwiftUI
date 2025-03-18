//
//  Prospect.swift
//  HotProspects
//
//  Created by Jasper Tan on 3/3/25.
//

import Foundation
import SwiftData



@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var createdDate: Date
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.createdDate = Date()
    }
}
