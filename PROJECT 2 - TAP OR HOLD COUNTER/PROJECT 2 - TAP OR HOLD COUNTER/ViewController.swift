//
//  ViewController.swift
//  PROJECT 2 - TAP OR HOLD COUNTER
//
//  Created by Cuong on 7/4/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var displayNumberLabel: UILabel!
    
    var timer: Timer?
    var speedAmmo = 20
    var number = 0
    
    @objc func buttonDown(_ sender: UIButton) {
        singleFire()
        timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(rapidFire), userInfo: nil, repeats: true)
    }
    
    @objc func buttonUp(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    func singleFire() {
        print("bang!")
        number += 1
        displayNumberLabel.text = String(number)
    }
    
    @objc func rapidFire() {
        if speedAmmo > 0 {
            //speedAmmo -= 1
            print("bang!")
            number += 1
            displayNumberLabel.text = String(number)
        } else {
            print("out of speed ammo, dude!")
            timer?.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // These could be added in the Storyboard instead if you mark
        // buttonDown and buttonUp with @IBAction
        button.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
    }

    @IBAction func resetButton(_ sender: Any) {
        number = 0
        displayNumberLabel.text = String(number)
    }
    
}

