//
//  QrCodeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-11-18.
//

import SwiftUI
import Combine
import UIKit
import CarBode
import AlertToast
import CoreImage.CIFilterBuiltins

struct QrCodeView: View {
    @State private var userTag : String = "samthing90"
    
    @State var halfModal_shown = false
    @State var isHide = false
    @State var showQrScanner = false
    
    // MARK: for QR Code generation
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color(red: 47 / 255, green: 107 / 255, blue: 97 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Scan QR Code")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                // MARK: Scan QR
                
                HStack {
                    Spacer()
                    
                    Button(action: {self.showQrScanner.toggle()},
                           label: {
                        VStack {
                            Image("qr-scan")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                            
                            Text("Scan QR")
                                .font(.custom("Avenir", size: 8).bold())
                                .foregroundColor(.black)
                                .padding(5)
                                .textCase(.uppercase)
                                .kerning(2)
                        }
                    }).sheet(isPresented: $showQrScanner) {
                        ModalScannerView()
                    }
                }
                .padding(.horizontal, 20)
                
                // MARK: QR Code
                
                VStack {
                    Image(uiImage: generateQRCode(from: " Name: \(userTag)"))
                        .resizable()
                        .interpolation(.none)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 0.25))
                    
                    Text("Scan to receive funds")
                        .font(.custom("Avenir", size: 12).bold())
                        .foregroundColor(.black)
                        .textCase(.uppercase)
                        .kerning(2)
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
    
    // MARK: Function for creating QR code
    func generateQRCode(from string: String) -> UIImage {
        let encryptedString = string.aesEncrypt(key: "MxGChe28!oLWavj*fmiQdq@kbYNB@jGP6-*qJtH*z2P9ptsG-kJdTfhbyDTpRC!6F*6dvYh6QLAt") ?? ""
        let data = Data(encryptedString.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}


