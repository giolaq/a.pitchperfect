//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Giovanni Biriba on 03/04/2015.
//  Copyright (c) 2015 Laquysoft. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioFile:AVAudioFile!
    
    var audioEngine: AVAudioEngine!
    
    @IBAction func playChipmunk(sender: UIButton) {
        stopAllAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = 1000
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    
    
    @IBAction func playEcho(sender: UIButton) {
        
        stopAllAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changeEchoEffect = AVAudioUnitDelay()
        changeEchoEffect.delayTime = 1
        audioEngine.attachNode(changeEchoEffect)
        
        audioEngine.connect(audioPlayerNode, to: changeEchoEffect, format: nil)
        audioEngine.connect(changeEchoEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        stopAllAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = -1000
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    @IBAction func slowSound(sender: UIButton) {
        stopAllAudio()
        
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
        
    }
    
    func stopAllAudio() {
        audioPlayer.stop()
        audioEngine.reset()
        audioEngine.stop()
    }
    
    @IBAction func stopSound(sender: UIButton) {
        stopAllAudio()
    }
    @IBAction func speedSound(sender: UIButton) {
        stopAllAudio()
        
        audioPlayer.rate = 2
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    override func viewDidLoad() {
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
