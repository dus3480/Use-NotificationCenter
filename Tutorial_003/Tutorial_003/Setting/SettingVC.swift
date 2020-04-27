//
//  SettingVC.swift
//  Tutorial_003
//
//  Created by 위대연 on 2020/04/27.
//  Copyright © 2020 위대연. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    
    enum SwitchTag:Int {
        case a = 10
        case b
    }
    
    @IBOutlet weak var switchA:UISwitch!
    @IBOutlet weak var switchB:UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.switchInit()
    }
    
    func switchInit() {
        self.switchA.addTarget(self, action: #selector(valueChangedSwitch(_:)), for: .valueChanged)
        self.switchA.tag = SwitchTag.a.rawValue
        self.switchA.setOn(false, animated: false)
        
        self.switchB.addTarget(self, action: #selector(valueChangedSwitch(_:)), for: .valueChanged)
        self.switchB.tag = SwitchTag.b.rawValue
        self.switchB.setOn(false, animated: false)
    }
    
    @objc func valueChangedSwitch(_ sender:UISwitch) {
        let userinfo:[String:Any] = ["tag":sender.tag,"value":sender.isOn]
        NotificationCenter.default.post(name: .cnValueChanged, object: nil, userInfo: userinfo)
    }
}
