//
//  MainTabbarController.swift
//  Tutorial_003
//
//  Created by 위대연 on 2020/04/27.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {
    var settingVc:UIViewController?
    var ledAVc:UIViewController?
    var ledBVc:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 20)], for: .normal)
        
        self.viewcontrollersSetting()
        
        guard self.settingVc != nil, self.ledAVc != nil, self.ledBVc != nil else {
            print("tab의 서브 vc들중 하나이상이 비어있다.")
            return
        }
        
        self.setViewControllers([settingVc!,ledAVc!,ledBVc!], animated: false)
        self.selectedIndex = 2
        self.selectedIndex = 1
        self.selectedIndex = 0
    }
    
    func viewcontrollersSetting() {
        let settingStoryboard = UIStoryboard(name: "SettingStoryboard", bundle: nil)
        self.settingVc = settingStoryboard.instantiateViewController(withIdentifier: "sb_id_setting")
        let ledPageStoryboard = UIStoryboard(name: "LedPage", bundle: nil)
        self.ledAVc = ledPageStoryboard.instantiateViewController(withIdentifier: "sb_id_leda")
        self.ledBVc = ledPageStoryboard.instantiateViewController(withIdentifier: "sb_id_ledb")
    }
}
