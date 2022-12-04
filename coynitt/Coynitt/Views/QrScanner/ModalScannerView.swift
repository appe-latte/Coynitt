//
//  ModalScannerView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-04.
//

import UIKit
import SwiftUI
import CarBode
import AVFoundation
import CryptoSwift
import AlertToast

struct ModalScannerView: View {
    @State var barcodeValue = ""
    @State var torchIsOn = false
    @State var showingAlert = false
    @State var cameraPosition = AVCaptureDevice.Position.back
    
    // MARK: Alert
    @State private var showToastAlert : Bool = false
    @State private var errTitle = ""
    @State private var errMessage = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                HStack {
                    Text("Scan QR code")
                        .foregroundColor(cynRed)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // MARK: Scanner View
                    VStack(spacing: 2) {
                        CBScanner(
                            supportBarcode: .constant([.qr, .code128]),
                            torchLightIsOn: $torchIsOn,
                            cameraPosition: $cameraPosition
                        ){
                            print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                            do {
                                let encryptedValue = $0.value
                                barcodeValue = encryptedValue.aesDecrypt(key: "MxGChe28!oLWavj*fmiQdq@kbYNB@jGP6-*qJtH*z2P9ptsG-kJdTfhbyDTpRC!6F*6dvYh6QLAt") ?? ""
                                print(barcodeValue)
                                showingAlert = true
                            }
                            //                        } catch {
                            //                            print("Error: \(error.localizedDescription)")
                            //                        }
                        }
                    }.toast(isPresenting: $showingAlert){
                        AlertToast(type: .regular, title: "User Account Information", subTitle: "\(barcodeValue)")
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Spacer()
                    
                }
            }
            .background(cynWhite)
            .accentColor(cynGreen2)
        }
    }
}
