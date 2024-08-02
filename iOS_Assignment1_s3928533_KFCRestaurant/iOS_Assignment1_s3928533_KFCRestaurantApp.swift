//
//  iOS_Assignment1_s3928533_KFCRestaurantApp.swift
//  iOS_Assignment1_s3928533_KFCRestaurant
//
//  Created by MacBook Pro Của A Tú on 27/07/2024.
//

import SwiftUI

@main
struct iOS_Assignment1_s3928533_KFCRestaurantApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            Splash().preferredColorScheme(isDarkMode ? .light : .dark)
        }
    }
}
