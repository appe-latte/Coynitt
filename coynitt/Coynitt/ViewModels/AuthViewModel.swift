//
//  AuthViewModel.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-13.
//


import SwiftUI
import Combine
import FirebaseAuth
import Foundation
import FirebaseFirestore
import FirebaseCore
import Kingfisher
import FirebaseStorage

class AuthViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User? // tracks if user is logged in
    @Published var isAuthenticating : Bool = false
    @Published var error : Error?
    @Published var user : User?
    
    @Published var isError : Bool = false
    @Published var errorMsg : String = ""
    @Published var showSaveUserInfoView : Bool = false
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    // MARK: "user login" function
    
    func userLogin(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
            
            // MARK: shows "ContentView" when login successfully
            self.userSession = result?.user
        }
    }
    
    // MARK: "user registration" function
    
    func userRegistration(email: String, userPwd: String, userFName: String, userLName: String, profileImage: UIImage, cellNum: String, dob: String, regCountry: String) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        storageRef.putData(imageData, metadata: nil) { (_, error) in
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
            
            // MARK: uploading to Firebase
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: userPwd) { result, error in
                    if error != nil {
                        self.isError.toggle()
                        self.errorMsg = error?.localizedDescription ?? ""
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "first_name": userFName,
                                "last_name": userLName,
                                "profImgUrl": profileImageUrl,
                                "uid": user.uid,
                                "cell_num": cellNum,
                                "dob": dob,
                                "reg_country": regCountry
                    ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = result?.user
                        self.fetchUser()
                    }
                }
            }
        }
    }
    
    // MARK: "sign out" function
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    // MARK: "fetch user" function
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).addSnapshotListener(includeMetadataChanges: false) { documentSnapshot, error in
            if let snapshopData = documentSnapshot?.data() {
                let user = User(dictionary: snapshopData)
                self.user = user
                self.showSaveUserInfoView = false
            } else {
                self.showSaveUserInfoView = true
            }
        }
    }
    
    // MARK: "verify OTP" function
    
    func verifyOtpAndSignIn(verificationID: String?, phoneOtp: String, email: String, userFName: String, userLName: String, profileImage: UIImage, cellNum: String, dob: String, regCountry: String) {
        
        if let mVerificationID = verificationID {
            
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: mVerificationID, verificationCode: phoneOtp)
            
            guard let imageData = profileImage.jpegData(compressionQuality: 0.75) else { return }
            let filename = NSUUID().uuidString
            let storageRef = Storage.storage().reference(withPath: "/proile_images/\(filename)")
            
            storageRef.putData(imageData, metadata: nil) { (_, error) in
                if error != nil {
                    self.isError.toggle()
                    self.errorMsg = error?.localizedDescription ?? ""
                    return
                }
                
                // MARK: upload to Firebase
                
                storageRef.downloadURL { url, _ in
                    guard let profileImageUrl = url?.absoluteString else { return }
                    
                    Auth.auth().signIn(with: credential) { (authResult, error) in
                        if let error = error {
                            let authError = error as NSError
                            print(authError.description)
                            return
                        }
                        
                        // MARK: Successful sign-in / authentication
                        
                        let currentUserInstance = Auth.auth().currentUser
                        
                        if let currentUser = currentUserInstance {
                            let data = ["email": email,
                                        "first_name": userFName,
                                        "last_name": userLName,
                                        "profImgUrl": profileImageUrl,
                                        "uid": currentUser.uid,
                                        "cell_num": cellNum,
                                        "dob": dob,
                                        "reg_country": regCountry
                            ]
                            
                            Firestore.firestore().collection("users").document(currentUser.uid).setData(data) { _ in
                                self.userSession = currentUser
                                self.fetchUser()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: "OTP" function
    
    func verifyOtpAndSignIn(verificationID: String?, phoneOtp: String) {
        
        if let mVerificationID = verificationID {
            
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: mVerificationID,
                verificationCode: phoneOtp
            )
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    let authError = error as NSError
                    print(authError.description)
                    self.isError.toggle()
                    self.errorMsg = error.localizedDescription
                    return
                }
                
                // MARK: user successfully signed in
                let currentUserInstance = Auth.auth().currentUser
                
                if let currentUser = currentUserInstance {
                    print("Logged in: \(currentUser.uid)")
                    self.userSession = currentUser
                    self.fetchUser()
                }
            }
        }
    }
    
    // MARK: "save user info" function
    
    func saveUserInfo(email: String, userFName: String, userLName: String, profileImage: UIImage, cellNum: String, dob: String, regCountry: String) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        storageRef.putData(imageData, metadata: nil) { (_, error) in
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
            
            // MARK: "upload to Firebase"
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                if let userSession = self.userSession {
                    let data = ["email": email,
                                "first_name": userFName,
                                "last_name": userLName,
                                "profImgUrl": profileImageUrl,
                                "uid": userSession.uid,
                                "cell_num": "\(userSession.phoneNumber ?? "")",
                                "dob": dob,
                                "reg_country": regCountry
                    ]
                    
                    Firestore.firestore().collection("users").document(userSession.uid).setData(data) { _ in
                        self.fetchUser()
                    }
                }
            }
        }
    }
}
