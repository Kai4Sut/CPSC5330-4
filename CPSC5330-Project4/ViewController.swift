//
//  ViewController.swift
//  CPSC5330-Project4
//
//  Created by user260677 on 6/13/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var TimeBackground: UIImageView!
    @IBOutlet weak var PMBrackground: UIImageView!
    
    
    @IBOutlet weak var TimerDisplay: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var TimerUtil: UIDatePicker!
    @IBOutlet weak var CurrentTime: UILabel!
    
    let date = Date()
    let currentFormatter = DateFormatter()
    let backgroundFormatter = DateFormatter()
    let timeFormatter = DateComponentsFormatter()
 
    
    var duration: TimeInterval = 0
    var timecounter = Timer()
    var datetimer = Timer()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Current Time and Display on Load
        currentFormatter.dateFormat = ("EE, dd MMMM yyyy  HH:mm:ss")
        
        CurrentTime.text = currentFormatter.string(from: date)
        datetimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(dateCounter), userInfo: nil, repeats: true)
        
        // Choose Background on Load
        ChooseBackground()
        
        // Show Timer Label
        TimerDisplay.text = "Time Remaining: \(timestring(time:duration))"
    }

    
    
    func ChooseBackground() {
        // Determine if date contains AM or PM then choose background depending on time
        backgroundFormatter.dateFormat = ("HH a")
        let hourString = backgroundFormatter.string(from: Date())
        
        if hourString.contains("AM") {
            TimeBackground.isHidden = false
            PMBrackground.isHidden = true
            CurrentTime.textColor = UIColor.black
            Button.backgroundColor = UIColor.red
        
        } else{
            TimeBackground.isHidden = true
            PMBrackground.isHidden = false
            Button.backgroundColor = UIColor.blue
        }
        // End ChooseBackground
    }
    
    @IBAction func ButtonPress(_ sender: UIButton) {
        // Assign Timer Countdown i
        duration = TimerUtil.countDownDuration
        timecounter.invalidate()
        
        if duration != 0 {
            // Start timer if countdown not at zero
            timecounter = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            
        } else {
            // If timer countdown = 0, stop music
            
            
        }
        
       //End ButtonPress
    }
    
    @objc func startCounter() {
        if duration > 0 {
            //reduce timer duration by 1 second
            TimerDisplay.text = "Time Remaining : \(timestring(time:duration))"
            duration -= 1
            
        } else {
            // invalidate timer and start music
            timecounter.invalidate()
            
        }
        //End startCounter
    }
    
    @objc func dateCounter() {

            currentFormatter.dateFormat = ("EE, dd MMMM yyyy  HH:mm:ss")
            CurrentTime.text = currentFormatter.string(from: Date())
            }
    
    
    func timestring(time:TimeInterval) -> String{
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
}

