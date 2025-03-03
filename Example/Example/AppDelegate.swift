//
//  AppDelegate.swift
//  Example
//
//  Created by Hồ Minh Tường on 10/01/2024.
//

import MiTuKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Constants class:
        struct FNames {
            static let regular = "SFProText-Regular"
            static let regularItalic = "SFProText-RegularItalic"
            static let ultralight = "SFProText-Ultralight"
            static let thin = "SFProText-Thin"
            static let light = "SFProText-Light"
            static let medium = "SFProText-Medium"
            static let semiBold = "SFProText-Semibold"
            static let bold = "SFProText-Bold"
            static let boldItalic = "SFProText-BoldItalic"
            static let black = "SFProText-Black"
        }

        // Update font
        FontConfiguration.shared.update(
            regular: FNames.regular,
            regularItalic: FNames.regularItalic,
            ultralight: FNames.ultralight,
            thin: FNames.thin,
            light: FNames.light,
            medium: FNames.medium,
            semiBold: FNames.semiBold,
            bold: FNames.bold,
            boldItalic: FNames.boldItalic,
            black: FNames.black
        )
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

