//
//  RecipientsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-21.
//

import SwiftUI

struct RecipientsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                cynWhite
                VStack {
                    Rectangle()
                        .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 110)
                        .edgesIgnoringSafeArea(.all)
                    
                    Text("Recipients go here....")
                        .padding(.top, 250)
                    
                    Spacer()
                    
                }
                .padding(.top, -100) // <--- removes white space above form from Navigation view
                
                Spacer()
            }
            .accentColor(cynGreen)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Recipients")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(cynWhite)
                        .textCase(.uppercase)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("add")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("Add")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                }
            }
        }
    }
}

struct RecipientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipientsView()
    }
}
