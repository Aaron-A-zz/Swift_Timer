//
//  ViewController.swift
//  Timer
//
//  Created by Mav3r1ck on 6/15/14.
//  Copyright (c) 2014 Mav3r1ck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timeInmillisceconds:Float = 00.000
    var stopButtonTitleVariable: NSString = "Stop"
    var isPaused: Bool = false
    

    let titleLabelRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 50, 50, 220, 44)
    let timerLabelRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 50, 120, 220, 44)
    
    let startButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 120, 200, 100, 44)
    let stopButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 + 20, 200, 100, 44)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size: 20)
        return label
    }()
    
    @lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size: 44)
        return label
    }()
    
    @lazy var startButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    @lazy var stopButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        titleLabel.frame = titleLabelRect
        timerLabel.frame = timerLabelRect
        
        titleLabel.text = "Stop-Watch"
        //Change the Color!
        titleLabel.textColor = UIColor .blueColor()
        timerLabel.text = "00.00"
        // Try to change the color!
        timerLabel.textColor = UIColor .redColor()
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(timerLabel)
        
        startButton.frame = startButtonRect
        startButton.setTitle("start", forState: UIControlState.Normal)
        startButton.addTarget(self, action: "startTimer", forControlEvents: UIControlEvents.TouchUpInside)
        startButton.backgroundColor = UIColor.blackColor()
        self.view.addSubview(startButton)
        
        stopButton.frame = stopButtonRect
        stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
        stopButton.addTarget(self, action: "stopTimer", forControlEvents: UIControlEvents.TouchUpInside)
        stopButton.backgroundColor = UIColor.blackColor()
        self.view.addSubview(stopButton)
        
    }
    
    func startTimer() {
        isPaused = false
        stopButtonTitleVariable = "Stop"
        stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
        NSTimer.scheduledTimerWithTimeInterval(00.001, target: self, selector: "updateTimerLabel", userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        isPaused = true
        
        switch (stopButtonTitleVariable) {
            case "Stop":
                if(timeInmillisceconds > 0.000) {
                    stopButtonTitleVariable = "Reset"
                    stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
            }
            break
            case "Reset":
            timerLabel.text = "00.000"
            timeInmillisceconds = 00.000
            stopButtonTitleVariable = "Stop"
            stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
        default:
            break
            
        }
    }
    
    func updateTimerLabel() {
        if (!isPaused) {
            timeInmillisceconds += 0.001
            timerLabel.text = NSString(format:"%.3f", timeInmillisceconds)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

