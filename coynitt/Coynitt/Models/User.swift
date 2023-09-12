//
//  User.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

struct User: Identifiable {
    let id : String
    let firstName : String
    let lastName : String
    let email : String
    let cellNum : String
    let profileImageUrl : String
    let country : String
    let dob : String
    let accountNumber : String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.firstName = dictionary["first_name"] as? String ?? ""
        self.lastName = dictionary["last_name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.cellNum = dictionary["cell_num"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.dob = dictionary["dob"] as? String ?? ""
        self.country = dictionary["country"] as? String ?? ""
        self.accountNumber = dictionary["account_num"] as? String ?? ""
    }
}
