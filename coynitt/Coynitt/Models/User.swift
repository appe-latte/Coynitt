//
//  User.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import Firebase

struct User: Identifiable {
    let id : String
    let userFName : String
    let userLName : String
    let email : String
    let cellNum : String
    let profileImageUrl : String
    let regCountry : String
    let dob : String
    let accountNumber : String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.userFName = dictionary["first_name"] as? String ?? ""
        self.userLName = dictionary["surname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.cellNum = dictionary["cell_num"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.dob = dictionary["dob"] as? String ?? ""
        self.regCountry = dictionary["reg_country"] as? String ?? ""
        self.accountNumber = dictionary["accountNum"] as? String ?? ""
    }
}
