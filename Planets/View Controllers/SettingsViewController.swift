//
//  SettingsViewController.swift
//  Planets
//
//  Created by Josh Kocsis on 4/29/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingsDelegate: class {
    func didTogglePluto()
}
class SettingsViewController: UIViewController {
    
    // Mark: - IBOutlets
    @IBOutlet weak var plutoSwitch: UISwitch!
    weak var delegate: SettingsDelegate?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViews()
    }
    
    @IBAction func toggledPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        delegate?.didTogglePluto()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        plutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}
