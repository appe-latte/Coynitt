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

struct NewRecipientView: View {
    @Binding var recipients: [Recipient]
    @State private var recipientFirstName = ""
    @State private var recipientLastName = ""
    @State private var recipientCellNum = ""
    @State private var recipientEmail = ""
    @State private var recipientCity = ""
    @State private var recipientCountry = ""
    @State private var recipientDob = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("First Name", text: $recipientFirstName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            TextField("Last Name", text: $recipientLastName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            TextField("DOB", text: $recipientDob)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            TextField("Email", text: $recipientEmail)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            TextField("Cell Number", text: $recipientCellNum)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            TextField("City", text: $recipientCity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            TextField("Country", text: $recipientCountry)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            
            Button(action: {
                let newRecipient = Recipient(recipientFirstName: recipientFirstName, recipientLastName: recipientLastName, recipientDob: recipientDob, recipientEmail: recipientEmail, recipientCellNum: recipientCellNum, recipientCity: recipientCity, recipientCountry: recipientCountry)
                recipients.append(newRecipient)
                
                dismiss() // Dismiss after Save.
            }, label: {
                Text("Save")
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 60)
                    .background(cynWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundColor(cynOlive)
                    .textCase(.uppercase)
                    .kerning(2)
            })
            .shadow(color: cynBlack, radius: 0.1, x: 4, y: 4)
        }
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundColor(cynBlack)
        .textCase(.uppercase)
        .padding()
        .accentColor(cynWhite)
    }
}
