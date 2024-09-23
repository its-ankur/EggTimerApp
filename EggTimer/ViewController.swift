//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var totalTime=0;
    var secoundsPassed=0
    
    var timer=Timer()
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness=sender.currentTitle!
        totalTime=eggTimes[hardness]!
        progressBar.progress=0.0
        secoundsPassed=0
        titleLabel.text=hardness
     
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secoundsPassed < totalTime{
            let percentageProgress=Float(secoundsPassed)/Float(totalTime)
            secoundsPassed+=1
            progressBar.progress=percentageProgress
        }
        else{
            timer.invalidate()
            titleLabel.text="DONE"
        }
    }
}
