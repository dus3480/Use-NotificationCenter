//
//  LedBVC.swift
//  Tutorial_003
//
//  Created by 위대연 on 2020/04/27.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit

class LedBVC: UIViewController {
    
    @IBOutlet weak var ledBoxView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(valueChangedNotificationAction), name: .cnValueChanged, object: nil)
        self.ledBoxSetting()
    }
    
    func ledBoxSetting() {
        self.ledBoxView.layer.cornerRadius = self.ledBoxView.frame.height/2
        self.ledBoxView.layer.masksToBounds = true
        self.ledBoxView.backgroundColor = UIColor.lightGray
        self.ledBoxView.layer.borderWidth = 1
        self.ledBoxView.layer.borderColor = UIColor.red.cgColor
    }
    
    func ledOn(led:UIView) {
        DispatchQueue.main.async {
            led.backgroundColor = .red
        }
    }
    
    func ledOff(led:UIView) {
        DispatchQueue.main.async {
            led.backgroundColor = .lightGray
        }
    }
    
    @objc func valueChangedNotificationAction(_ notification:Notification) {
        if let userInfo = notification.userInfo {
            let tag = userInfo["tag"] as? Int
            let value = userInfo["value"] as? Bool
            guard tag != nil, value != nil else {
                print("LedBVC - valueChagedNotificationAction err, tag or value is nil")
                return
            }
            if tag! == SettingVC.SwitchTag.b.rawValue {
                if value! {
                    self.ledOn(led: self.ledBoxView)
                } else {
                    self.ledOff(led: self.ledBoxView)
                }
            }
        }
    }

}
