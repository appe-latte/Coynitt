//
//  CoyneApp.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI
import Combine
//import Firebase
import UserNotifications
import LocalAuthentication

@main
struct CoyneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @StateObject var appLockModel = AppLockViewModel()
    
//    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
            
//            ContentView().environmentObject(AuthViewModel())
//                .environmentObject(appLockModel)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .preferredColorScheme(.light)
        }
    }
}
