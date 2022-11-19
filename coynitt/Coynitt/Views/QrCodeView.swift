//
//  QrCodeView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-11-18.
//

import SwiftUI
import Combine
import CoreImage.CIFilterBuiltins

struct QrCodeView: View {
    @State private var userTag : String = "samthing90"
    
    // MARK: for QR Code generation
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        
        ZStack {
            VStack {
                
                VStack {
                    // MARK: QR Code image
                    Image(uiImage: generateQRCode(from: " Name: \(userTag)"))
                        .resizable()
                        .interpolation(.none)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                    
                    Text("Scan cyTag to quick send funds")
                        .font(.custom("Avenir", size: 15).bold())
                        .foregroundColor(.black)
                }
                .padding(.top, 10)
                
                
                // Opens Camera to scan QR code
                HStack {
                    Spacer()
                    
                    Button(action: {},
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
                        }
                    })
                }
                .padding(.horizontal, 20)
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


