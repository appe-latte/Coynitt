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
            cynWhite
            VStack {
                // MARK: Account Balance
                
                HStack {
                    Spacer()
                    
                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                        .font(.custom("Avenir", size: 15).bold())
                        .foregroundColor(Color(uiColor: .darkGray))
                }
                .padding(10)
                
                // MARK: Country Picker
                
                VStack {
                    HStack {
                        Text("Choose recipient country:")
                            .font(.custom("Avenir", size: 15))
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    // MARK: First Row
                    HStack {
                        // MARK: Canada
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
                                    Text("Send to Canada")
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
                                        Text("continue")
                                            .font(.custom("Avenir", size: 18))
                                            .fontWeight(.semibold)
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen)
                                            .clipShape(Capsule())
                                    })
                                } else {
                                    CanExchangeView().opacity(0.1)
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("continue")
                                            .font(.custom("Avenir", size: 18))
                                            .fontWeight(.semibold)
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen.opacity(0))
                                            .clipShape(Capsule())
                                            .disabled(true)
                                    })
                                }
                                
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                        
                        // MARK: USA
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
                        
                        // MARK: South Africa
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
                                    Text("Send to South Africa")
                                        .font(.system(size: 13))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                    
                                    Spacer()
                                    
                                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                                        .font(.system(size: 13))
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
                                    Text("continue")
                                        .font(.custom("Avenir", size: 18))
                                        .fontWeight(.semibold)
                                        .frame(width: 250, height: 50)
                                        .foregroundColor(.white)
                                        .background(cynGreen)
                                        .clipShape(Capsule())
                                })
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                    }
                    
                    // MARK: Second Row
                    HStack {
                        // MARK: Nigeria
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
                        
                        // MARK: Kenya
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
                                    Text("Send to Kenya")
                                        .font(.system(size: 13))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 20)
                                    
                                    Spacer()
                                    
                                    Text("Avail. $\(accBalance, specifier: "%.2f")")
                                        .font(.system(size: 13))
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
                                        
                                        Text("m-pesa")
                                            .font(.custom("Avenir", size: 14))
                                            .fontWeight(.semibold)
                                    }
                                    .frame(width: 350, height: 50)
                                    .background(cynGreen2.opacity(0.1))
                                    .clipShape(RoundedCorner(radius: 15))
                                }
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                if isChecked == true {
                                    KesExchangeView()
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("continue")
                                            .font(.custom("Avenir", size: 18))
                                            .fontWeight(.semibold)
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen)
                                            .clipShape(Capsule())
                                    })
                                } else {
                                    KesExchangeView().opacity(0.1)
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("continue")
                                            .font(.custom("Avenir", size: 18))
                                            .fontWeight(.semibold)
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen.opacity(0))
                                            .clipShape(Capsule())
                                            .disabled(true)
                                    })
                                }
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                        
                        // MARK: Zimbabwe
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
                                    Text("Send to Zimbabwe")
                                        .font(.system(size: 13))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 13)
                                    
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
                                        
                                        Text("Ecocash")
                                            .font(.custom("Avenir", size: 14))
                                            .fontWeight(.semibold)
                                        
                                    }
                                    .frame(width: 350, height: 50)
                                    .background(cynGreen2.opacity(0.1))
                                    .clipShape(RoundedCorner(radius: 15))
                                }
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                
                                if isChecked == true {
                                    ZwExchangeView()
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("continue")
                                            .font(.custom("Avenir", size: 18))
                                            .fontWeight(.semibold)
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen)
                                            .clipShape(Capsule())
                                    })
                                } else {
                                    ZwExchangeView().opacity(0.1)
                                    
                                    Spacer()
                                    
                                    Button(action : {},
                                           label: {
                                        Text("continue")
                                            .font(.custom("Avenir", size: 18))
                                            .fontWeight(.semibold)
                                            .frame(width: 250, height: 50)
                                            .foregroundColor(.white)
                                            .background(cynGreen.opacity(0))
                                            .clipShape(Capsule())
                                            .disabled(true)
                                    })
                                }
                            }
                            .accentColor(cynGreen)
                            .padding(.top, 30)
                        }
                        
                        // MARK: Zambia
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
                
                Spacer()
            }
        }
        .accentColor(.black)
    }
}


