//
//  BadgeViewController.swift
//  NotificationCountBadge
//
//  Created by Burak Ekmen on 6.12.2023.
//

import UIKit
import UserNotifications

class BadgeViewController: UIViewController {

    // MARK: Outlets
    
    // MARK: Injects
    private let viewModel : IBadgeViewModel
    
    init(viewModel: IBadgeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bildirim izinleri iste
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if let error = error {
                        print("Bildirim izni alınamadı: \(error)")
                    } else {
                        // İzin alındığında, bildirim gönder
                        self.scheduleNotification()
                    }
                }
        
    }

    // MARK: Props
}


extension BadgeViewController {
    func scheduleNotification() {
            // Bildirim içeriği
            let content = UNMutableNotificationContent()
            content.title = "Yeni Bildirim"
            content.body = "Merhaba! Yeni bir bildirim var."
            content.sound = .default

            // Bildirim tetikleyici
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            // Bildirim isteği
            let request = UNNotificationRequest(identifier: "notificationIdentifier", content: content, trigger: trigger)

            // Bildirimi planla
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Bildirim planlanamadı: \(error)")
                }
            }
            
            // Bildirim rozeti güncelle
            updateBadgeCount()
        }
        
        func updateBadgeCount() {
            // Badge sayısını güncelle
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber += 1
            }
        }
}
