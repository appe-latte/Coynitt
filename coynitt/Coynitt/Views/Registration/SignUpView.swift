//
//  SignUpView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-13.
//

import SwiftUI
import Combine
import UIKit
import FirebaseAuth

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var cellNum = ""
    @State private var email = ""
    @State private var password = ""
    @State private var country = ""
    @State private var dob = "-"
    
    @State var isChecked : Bool = false
    func toggle(){ isChecked = !isChecked }
    @State private var keyboardHeight: CGFloat = 0
    
    // MARK: Image Picker
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @State var showImagePicker = false
    @State var selectedImage: UIImage = UIImage()
    
    // MARK: Objects
    @EnvironmentObject var viewModel : AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var keyboardHeightHelper = KeyboardHeightHelper()
    
    @State var showOTPSheetView = false
    
    init() {
        self.listenForKeyboardNotifications()
        UINavigationBar.appearance().barTintColor = UIColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
        UINavigationBar.appearance().tintColor = UIColor(Color.white)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else {return}
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("User Registration")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                }
                .padding(.top, 15)
                .padding(.horizontal, 15)
                
                ScrollView(.vertical, showsIndicators: false) {
                    Group {
                        
                        // MARK: Profile Image selection
                        VStack(alignment:.center){
                            Button(action: {showImagePicker.toggle()}, label: {
                                VStack {
                                    
                                    if let image = image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 125, height: 125)
                                            .padding(.vertical, 5)
                                    } else {
                                        VStack {
                                            Text("+ profile")
                                                .font(.system(size: 12))
                                                .foregroundColor(.black)
                                            Text("picture")
                                                .font(.system(size: 12))
                                                .foregroundColor(.black)
                                        }.frame(width: 125, height: 125)
                                            .padding(.vertical, 5)
                                            .background(cynGreen2.opacity(0.1))
                                            .clipShape(Circle())
                                    }
                                }
                            }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedUIImage)
                            })
                        }
                        
                        // MARK: Textfields
                        VStack(spacing: 15) {
                            
                            // MARK: First Name Text
                            CustomTextField(text: $firstName, placeholder: Text("Enter first name"), imageName: "users")
                                .padding(5)
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.size.width - 40, height: 50).padding(.leading,10)
                                .background(cynGreen2.opacity(0.1))
                                .clipShape(Capsule())
                                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                            
                            
                            // MARK: Last Name Text
                            CustomTextField(text: $lastName, placeholder: Text("Enter last name"), imageName: "users")
                                .padding(5)
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.size.width - 40, height: 50).padding(.leading,10)
                                .background(cynGreen2.opacity(0.1))
                                .clipShape(Capsule())
                                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                            
                            // MARK: User Email Text
                            CustomTextField(text: $email, placeholder: Text("Enter email"), imageName: "envelope")
                                .padding(5)
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.size.width - 40, height: 50).padding(.leading,10)
                                .background(cynGreen2.opacity(0.1))
                                .clipShape(Capsule())
                                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                                .keyboardType(.emailAddress)
                            
                            // MARK: Reg Country Text
                            CustomTextField(text: $country, placeholder: Text("Country of Residence"), imageName: "location")
                                .padding(5)
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.size.width - 40, height: 50).padding(.leading,10)
                                .background(cynGreen2.opacity(0.1))
                                .clipShape(Capsule())
                                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
                            
                            Text("* Please ensure that information is entered in all the available fields and that a profile image is selected.")
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: UIScreen.main.bounds.size.width - 40, minHeight: 0, maxHeight: 60, alignment: .center)
                                .font(.system(size: 8))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .lineLimit(10)
                            
                            Spacer()
                            
                            // MARK: T&C's checkbox
                            
                            HStack {
                                
                                Button(action: toggle){
                                    Image(systemName: isChecked ? "square.fill": "square")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(cynGreen)
                                }
                                
                                Text("I accept the")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Button("Terms of Service."){ }
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            }
                        }.font(.subheadline)
                    }
                }
                Spacer()
                
                VStack {
                    
                    if isChecked == true {
                        // MARK: "Sign Up" Button
                        Button(action: {
                            guard let image = selectedUIImage else {return}
                            viewModel.saveUserInfo(email: email, firstName: firstName, lastName: lastName, profileImage: image, cellNum: cellNum, dob: dob, country: country)
                            
                        }, label: {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .frame(width: 250, height: 60)
                                .background(cynGreen)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        })
                        .disabled((lastName != "" && firstName != "" && email != "") ? false : true)
                        //                    .opacity((userLName != "" && userLName != "" && email != "") ? 1 : 0.6)
                        //                .alert(isPresented: $viewModel.isError, content: {
                        //                    Alert(title: Text("Registration Error"), message: Text(viewModel.errorMsg))
                    } else {
                        
                        // MARK: "Sign Up" Button
                        Button(action: {
                            guard let image = selectedUIImage else {return}
                            viewModel.saveUserInfo(email: email, firstName: firstName, lastName: lastName, profileImage: image, cellNum: cellNum, dob: dob, country: country)
                            
                        }, label: {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .frame(width: 250, height: 60)
                                .background(cynGreen.opacity(0.1))
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        })
                        .disabled((lastName != "" && firstName != "" && email != "" && isChecked != false) ? false : true)
                        .opacity((lastName != "" && lastName != "" && email != "") ? 1 : 0.6)
                        //                .alert(isPresented: $viewModel.isError, content: {
                        //                    Alert(title: Text("Registration Error"), message: Text(viewModel.errorMsg))
                    }
                    
                    
                    //                }).sheet(isPresented: $showOTPSheetView){}
                    
                    // MARK: "login" option
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundColor(.black
                            )
                        
                        Button("Log in"){
                            
                        }
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    }
                }
            }
        }
        .keyboardAdaptive()
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Keyboard Height listener
    private func listenForKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification,
                                               object: nil,
                                               queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                  let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            self.keyboardHeight = keyboardRect.height
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                               object: nil,
                                               queue: .main) { (notification) in
            self.keyboardHeight = 0
        }
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.bottomPadding = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
                }
                .animation(.easeOut(duration: 0.16))
        }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}

extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    private static weak var _currentFirstResponder: UIResponder?
    
    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}
