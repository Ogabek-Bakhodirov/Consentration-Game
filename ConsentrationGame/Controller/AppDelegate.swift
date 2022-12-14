//
//  AppDelegate.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 23/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ConcentrationController()
        
        return true
    }
}

