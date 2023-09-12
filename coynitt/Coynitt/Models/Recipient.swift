//
//  Recipient.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2023-09-12.
//

import SwiftUI

struct Recipient : Identifiable {
    var id = UUID()
    var recipientFirstName : String
    var recipientLastName : String
    var recipientDob : String
    var recipientEmail : String
    var recipientCellNum : String
    var recipientCity : String
    var recipientCountry : String
    
}

