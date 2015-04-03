//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Giovanni Biriba on 09/03/2015.
//  Copyright (c) 2015 Laquysoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        recordButton.enabled = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        stopButton.hidden = false
        recordingLabel.hidden = false
        recordButton.enabled = false
        println("in  recordAudio")
        //TODO: record audio
    }

    @IBAction func stopRecording(sender: UIButton) {
        recordingLabel.hidden = true

    }
}

