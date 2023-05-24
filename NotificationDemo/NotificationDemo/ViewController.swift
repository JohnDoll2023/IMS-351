//
//  ViewController.swift
//  NotificationDemo
//
//  Created by John Doll on 11/3/22.
//

import UIKit
import UserNotifications

let userNotificationCenter = UNUserNotificationCenter.current()

func requestNotificationAuthorization() {
    
    let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
    
    userNotificationCenter.requestAuthorization(options: authOptions) {
        (success, error) in
        if let error = error {
            print("Error: ", error)
        }
    }
}

func sendNotification(notificationTitle:String, notificationBody:String, notificationBade:Int) {
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = notificationTitle
    notificationContent.body = notificationBody
    notificationContent.badge = NSNumber(value: notificationBade)
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    
    let newNotification = UNNotificationRequest(identifier: "myNotification", content: notificationContent, trigger: trigger)
    
    userNotificationCenter.add(newNotification) { (error) in
        if let error = error {
            print("Notification error: ", error)
        }
    }
}

class ViewController: UIViewController {

    @IBAction func turkeyReminderButton(_ sender: UIButton) {
        sendNotification(notificationTitle: "Baste the turkey", notificationBody: "Remember to baste the turkey", notificationBade: 2)
    }
    @IBAction func muffinReminderButton(_ sender: UIButton) {
        sendNotification(notificationTitle: "Muffins", notificationBody: "Remember to take muffins out", notificationBade: 1)
    }
    @IBAction func dinnerReminderButton(_ sender: UIButton) {
        sendNotification(notificationTitle: "Time to eat", notificationBody: "The food is done", notificationBade: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestNotificationAuthorization()
        
    }


}

