//
//  QrScanViewModel.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-04.
//

import Foundation
import SwiftUI

class QrScanViewModel : ObservableObject {
    let scanInterval : Double = 1.0 // setting for how often camera checks for a new QR code
    
    @Published var lastQrCode : String = ""
    
    func onFoundQrCode(_ code: String) {
        self.lastQrCode = code
    }
}
