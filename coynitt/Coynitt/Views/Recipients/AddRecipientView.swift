//
//  AddRecipientView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-28.
//

import SwiftUI
import Combine
import FirebaseAuth
import CountryPicker
import AlertToast

struct AddRecipientView: View {
    @State var recipFirstName : String = ""
    @State var recipLastName : String = ""
    @State var recipMobNumber : String = ""
    @State var recipEmail : String = ""
    
    @State var isMarked:Bool = false
    
    // MARK: Country Picker
    @State private var country: Country?
    @State private var showCountryPicker = false
    
    // MARK: Checkbox
    
    var body: some View {
        
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack {
            cynWhite
            VStack(alignment: .leading, spacing: 10) {
                Rectangle()
                    .fill(Color(red: 177 / 255, green: 156 / 255, blue: 217 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Add Recipient Information")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                Text("Recipient Details")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                
                Spacer()
                    .frame(height: 10)
                
                VStack {
                    // MARK: First Name
                    HStack {
                        Text("First Name:")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .darkGray))
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    
                    TxCustomTextField(text: $recipFirstName, placeholder: Text("e.g., Brian"))
                        .font(.subheadline)
                        .frame(width: screenWidth - 75, height: 45)
                        .clipShape(RoundedCorner(radius: 15))
                        .background(cynGreen2.opacity(0.075))
                        .padding(5)
                    
                    // MARK: Last Name
                    HStack {
                        Text("Last Name:")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .darkGray))
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    
                    TxCustomTextField(text: $recipLastName, placeholder: Text("e.g., Pieterson"))
                        .font(.subheadline)
                        .frame(width: screenWidth - 75, height: 45)
                        .clipShape(RoundedCorner(radius: 15))
                        .background(cynGreen2.opacity(0.075))
                        .padding(5)
                    
                    // MARK: Mobile Number
                    HStack {
                        Text("Mobile Number:")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .darkGray))
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    
                    HStack(spacing: 16){
                        Button {
                            self.showCountryPicker = true
                        } label: {
                            Text(country != nil ? "\(country!.isoCode.getFlag())+\(country!.phoneCode)" : "\("ZA".getFlag())+27").font(.custom("Avenir", size: 18))
                        }.sheet(isPresented: $showCountryPicker) {
                            CountryPickerView(country: $country)
                        }
                        .frame(width: 65, height: 30)
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        
                        TextField("e.g., 78 489 0881", text: $recipMobNumber)
                            .font(.subheadline)
                            .keyboardType(.numberPad)
                        
                    }
                    .font(.subheadline)
                    .frame(width: screenWidth - 75, height: 45)
                    .clipShape(RoundedCorner(radius: 15))
                    .background(cynGreen2.opacity(0.075))
                    .padding(5)
                    
                    HStack {
                        Button(action: {
                            self.isMarked.toggle()
                        }, label: {
                            Image(systemName: self.isMarked ? "checkmark.square" : "square")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        })
                        
                        Text("Send SMS updates regarding the transfer to the recipient.")
                            .font(.footnote)
                    }
                }
                .frame(width: screenWidth - 20)
                
                Spacer()
                    .frame(height: 10)
                
                // MARK: Email Address
                
                Text("Recipient Email")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                
                Spacer()
                    .frame(height: 10)
                
                VStack {
                    HStack {
                        Text("Email Address:")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .darkGray))
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    
                    TxCustomTextField(text: $recipEmail, placeholder: Text("hello@example.com"))
                        .font(.subheadline)
                        .frame(width: screenWidth - 75, height: 45)
                        .multilineTextAlignment(.leading)
                        .clipShape(RoundedCorner(radius: 15))
                        .background(cynGreen2.opacity(0.075))
                        .padding(5)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Spacer()
                        
                        // MARK: "Cancel" button
                        Button(action: {
                            
                        }, label: {
                            Text("Cancel")
                                .font(.subheadline)
                                .foregroundColor(Color(UIColor.lightGray))
                                .textCase(.uppercase)
                        })
                        
                        // MARK: "Save" button
                        Button(action: {
                            
                        }, label: {
                            Text("Save")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                        })
                        .frame(width: 80, height: 35)
                        .background(cynGreen2)
                        .clipShape(Capsule())
                        
                    }
                    .frame(width: screenWidth - 40)
                    .padding(.trailing, 15)
                    
                    Spacer()
                }
                .frame(width: screenWidth - 20)
            }
            .padding(.top, 25)
            
            Spacer()
            
        }.accentColor(cynGreen)
            .navigationBarTitleDisplayMode(.inline)
    }
}
