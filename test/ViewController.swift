//
//  ViewController.swift
//  test
//
//  Created by Кирилл Сысоев on 22.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
        
        updateSeconds()
                
        stopButton.addTarget(self, action: #selector(stopButtonPressed(_ :)), for: .touchUpInside)
        
        startButton.addTarget(self, action: #selector(startButtonPressed(_ :)), for: .touchUpInside)
    }
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var switchCounter: UISwitch!
    
    var secCount = 0
    var timer : Timer?
    
    func updateSeconds() {
        secondsLabel.text = "\(secCount)"
    }
    
    @objc func stopButtonPressed(_ sender : Any) {
        secCount = 0
        timer?.invalidate()
        startButton.isEnabled = true
        switchCounter.isEnabled = true
        stopButton.isEnabled = false
        updateSeconds()
    }
    
    @objc func startButtonPressed(_ sender : Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }

    @objc func timerFired() {
        if switchCounter.isOn {
            secCount += 1
            updateSeconds()
        } else {
            secCount -= 1
            updateSeconds()
        }
    }
    
}

