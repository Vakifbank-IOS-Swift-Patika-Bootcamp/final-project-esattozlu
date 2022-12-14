//
//  LocalNotificationManager.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 14.12.2022.
//

import Foundation
import UserNotifications

final class LocalNotificationManager {
    
    static let shared = LocalNotificationManager()
    
    private init() {}
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: authOptions) { granted, error in
            guard error == nil else { return }
        }
    }
    
    func sendNotification(title: String, body: String) {
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "Welcome!"
            notificationContent.body = "We are so happy to see you here!"
            notificationContent.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            let request =  UNNotificationRequest(identifier: "WelcomeNotification", content: notificationContent, trigger: trigger)
            
            userNotificationCenter.add(request) { error in
                guard error == nil else { return }
            }
    }
}
