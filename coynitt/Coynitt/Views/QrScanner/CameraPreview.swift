//
//  CameraPreview.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-12-04.
//

import Foundation
import UIKit
import AVFoundation

class CameraPreview: UIView {
    private var label : UILabel?
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    var session = AVCaptureSession()
    weak var delegate: QrCodeCameraDelegate?
    
    init(session: AVCaptureSession) {
        super.init(frame: .zero)
        self.session = session
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func createSimulatorView(delegate: QrCodeCameraDelegate) {
        self.delegate = delegate
        self.backgroundColor = UIColor.black
        label = UILabel(frame: self.bounds)
        label?.numberOfLines = 4
        label?.text = "Camera Simulation"
        label?.textColor = UIColor.white
        label?.textAlignment = .center
        
        if let label = label  {
            addSubview(label)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onClick))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func onClick() {
        delegate?.onSimulateScanning()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
#if targetEnvironment(simulator)
        label?.frame = self.bounds
#else
        previewLayer?.frame = self.bounds
#endif
    }
}
