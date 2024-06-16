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
    @IBOutlet weak var Timer: UIDatePicker!
    @IBOutlet weak var CurrentTime: UILabel!
    
    let date = Date()
    let currentFormatter = DateFormatter()
    let backgroundFormatter = DateFormatter()
    
    var duration: TimeInterval = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Current Time and Display on Load
        currentFormatter.dateFormat = ("EE, dd MMMM yyyy  HH:mm:ss")
        
        CurrentTime.text = currentFormatter.string(from: date)
        
        // Choose Background on Load
        ChooseBackground()
        
        // Show Timer Label
        TimerDisplay.text = "Enter Timer Text Here"
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
    
    @IBAction func ButtonPress(_ sender: Any) {
        // Assign Timer Countdown i
        duration = Timer.countDownDuration
        
        if duration != 0 {
            // Start timer if countdown not at zero
            
            
        } else {
            // If timer countdown = 0, stop music
            
            
        }
        
       //End ButtonPress
    }
    
    
}

