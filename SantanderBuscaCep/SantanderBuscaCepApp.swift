//
//  SantanderBuscaCepApp.swift
//  SantanderBuscaCep
//
//  Created by Josué Amorim on 05/10/23.
//

import SwiftUI
import IQKeyboardManagerSwift

@main
struct SantanderBuscaCepApp: App {
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Outras configurações do aplicativo

        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        return true
    }

}
