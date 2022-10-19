//
//  PaymentsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 11/03/2022.
//

import SwiftUI

struct PaymentsView: View {
    @State var accBalance : Double = 1498.18
    @State var rowHeight = 50.0
    @State var countrySelector = ""
    @State var isChecked : Bool = false
    @State var canPaySheet = false
    @State var zwPaySheet = false
    @State var kesPaySheet = false
    @State var zarPaySheet = false
    func toggle(){ isChecked = !isChecked }
    
    var body: some View {
        ZStack {
            bgWhite()
            // MARK: Account Balance
            VStack {
                // MARK: Country Picker
                VStack {
                    HStack {
                        Text("Select the country and withdrawal method:")
                            .font(.custom("Avenir", size: 12))
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    // ROW ONE:
                    HStack {
                        // Canada
                        Button(action: {
                            canPaySheet.toggle()
                        }, label: {
                            VStack {
                                Image("canada")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("Canada")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        .sheet(isPresented: $canPaySheet) {
                            VStack {
                                // MARK: Balance
                                HStack {
                                    Text("CAD Transfers")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                    
                                    Spacer()
                                    
                                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                }
                                
                                Spacer().frame(height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Withdrawal method:")
                                            .font(.custom("Avenir", size: 13))
                                        
                                        Button(action: toggle){
                                            Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                        }
                                        Image("interac")
                                            .resizable()
                                            .frame(width: 80, height: 35)
                                    }
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                        .frame(width: 350))
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                if isChecked == true {
                                    CanExchangeView()
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("CONTINUE")
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen)
                                            .cornerRadius(15)
                                    })
                                } else {
                                    CanExchangeView().opacity(0.1)
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("CONTINUE")
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen).opacity(0
                                                                          
                                                                          
                                                                          
                                                                          
                                                                          
                                            )
                                            .cornerRadius(15)
                                            .disabled(true)
                                    })
                                }
                                
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                        
                        // USA
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("united-states")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("United States")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        
                        // UK
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("united-kingdom")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("United Kingdom")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        
                        // SA
                        Button(action: {
                            zarPaySheet.toggle()
                        }, label: {
                            VStack {
                                Image("south-africa")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("South Africa")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        .sheet(isPresented: $zarPaySheet) {
                            VStack {
                                // MARK: Balance
                                HStack {
                                    Text("ZAR Transfers")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                    
                                    Spacer()
                                    
                                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                }
                                
                                Spacer().frame(height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Withdrawal method:")
                                            .font(.custom("Avenir", size: 13))
                                        
                                        Button(action: toggle){
                                            Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                        }
                                        
                                        HStack {
                                            Image(systemName: "building.columns.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            
                                            Text("Bank Account")
                                                .font(.custom("Avenir", size: 13))
                                        }
                                    }
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                        .frame(width: 350))
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                if isChecked == true {
                                    ZarExchangeView()
                                } else {
                                    ZarExchangeView().opacity(0.1)
                                }
                                
                                Spacer()
                                
                                Button(action : {},
                                       label: {
                                    Text("CONTINUE")
                                        .frame(width: 250, height: 50)
                                        .foregroundColor(.white)
                                        .background(cynGreen)
                                        .cornerRadius(15)
                                })
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                    }
                    
                    // ROW TWO:
                    HStack {
                        // Nigeria
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("nigeria")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("Nigeria")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        
                        // Kenya
                        Button(action: {
                            kesPaySheet.toggle()
                        }, label: {
                            VStack {
                                Image("kenya")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("Kenya")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        .sheet(isPresented: $kesPaySheet) {
                            VStack {
                                // MARK: Balance
                                HStack {
                                    Text("KES Transfers")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                    
                                    Spacer()
                                    
                                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                }
                                
                                Spacer().frame(height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Withdrawal method:")
                                            .font(.custom("Avenir", size: 13))
                                        
                                        Button(action: toggle){
                                            Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                        }
                                        
                                        Image("mpesa")
                                            .resizable()
                                            .frame(width: 80, height: 40)
                                    }
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                        .frame(width: 350))
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                if isChecked == true {
                                    KesExchangeView()
                                } else {
                                    KesExchangeView().opacity(0.1)
                                }
                                
                                Spacer()
                                
                                Button(action : {},
                                       label: {
                                    Text("CONTINUE")
                                        .frame(width: 250, height: 50)
                                        .foregroundColor(.white)
                                        .background(cynGreen)
                                        .cornerRadius(15)
                                })
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                        
                        // Zimbabwe
                        Button(action: {
                            zwPaySheet.toggle()
                        }, label: {
                            VStack {
                                Image("zimbabwe")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("Zimbabwe")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                        .sheet(isPresented: $zwPaySheet) {
                            VStack {
                                // MARK: Balance
                                HStack {
                                    Text("ZW Transfers")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                    
                                    Spacer()
                                    
                                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                                        .font(.system(size: 15))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                }
                                
                                Spacer().frame(height: 30)
                                
                                VStack {
                                    HStack {
                                        Text("Withdrawal method:")
                                            .font(.custom("Avenir", size: 13))
                                        
                                        Button(action: toggle){
                                            Image(systemName: isChecked ? "circle.circle.fill": "circle")
                                        }
                                        //                                        Text("Ecocash")
                                        //                                            .font(.custom("Avenir", size: 15))
                                        //                                            .bold()
                                        
                                        Image("ecocash")
                                            .resizable()
                                            .frame(width: 100, height: 35)
                                    }
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                        .frame(width: 350))
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                if isChecked == true {
                                    ZwExchangeView()
                                } else {
                                    ZwExchangeView().opacity(0.1)
                                }
                                
                                Spacer()
                                
                                Button(action : {},
                                       label: {
                                    Text("CONTINUE")
                                        .frame(width: 250, height: 50)
                                        .foregroundColor(.white)
                                        .background(cynGreen)
                                        .cornerRadius(15)
                                })
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                        
                        // Zambia
                        Button(action: {
                            //
                        }, label: {
                            VStack {
                                Image("zambia")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                Text("Zambia")
                                    .font(.custom("Avenir", size: 10))
                            }
                        })
                    }
                    
                }
                .padding(.top, 30)
                
                
                
                Spacer()
            }
            .accentColor(.black)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("Avail. $\(accBalance, specifier: "%.2f")")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

// MARK: Recipients Lists - shows last 10 transfers
struct Recipients: Identifiable {
    let id = UUID()
    let lName : String
    let initials : String
}

struct RecipientsRow: View {
    var recipients: Recipients
    
    var body: some View {
        HStack {
            VStack {
                Text(recipients.initials)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(cynGreen)
                    .clipShape(Circle())
                
                Text(recipients.lName)
                    .font(.custom("Avenir", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .scaledToFill()
                    .minimumScaleFactor(0.5)
                
            }
            .padding(2)
            .listRowBackground(cynWhite) // list background colour
            .edgesIgnoringSafeArea(.all)
        }
    }
}
