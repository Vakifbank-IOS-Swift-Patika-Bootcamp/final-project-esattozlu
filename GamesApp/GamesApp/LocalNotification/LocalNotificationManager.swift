//
//  LocalNotificationManager.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 14.12.2022.
//

import Foundation
import UserNotifications

protocol LocalNotificationProtocol {
    var userNotificationCenter: UNUserNotificationCenter { get set }
    func requestNotificationAuthorization()
    func sendNotification(title: String, body: String)
}

final class LocalNotificationManager: LocalNotificationProtocol {
    static let shared = LocalNotificationManager()
    
    private init() {}
    
    var userNotificationCenter = UNUserNotificationCenter.current()
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: authOptions) { granted, error in
            guard error == nil else { return }
        }
    }
    
    func sendNotification(title: String, body: String) {
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = title
            notificationContent.body = body
            notificationContent.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            let request =  UNNotificationRequest(identifier: "WelcomeNotification", content: notificationContent, trigger: trigger)
            
            userNotificationCenter.add(request) { error in
                guard error == nil else { return }
            }
    }
}
