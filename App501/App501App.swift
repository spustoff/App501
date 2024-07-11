//
//  App501App.swift
//  App501
//
//  Created by IGOR on 26/06/2024.
//

import SwiftUI
import ApphudSDK
import YandexMobileMetrica

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: DataManager().appHudID)
        
        YMMYandexMetrica.activate(with: YMMYandexMetricaConfiguration.init(apiKey: DataManager().metricaID)!)
        
        return true
    }
}

@main
struct App501App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                
                ContentView()
            }
        }
    }
}
