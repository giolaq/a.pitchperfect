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
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
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
    

    @IBAction func playDarthvaderAudio(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
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
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()

       
    }
    @IBAction func stopSound(sender: UIButton) {
        audioPlayer.stop()
    }
    @IBAction func speedSound(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 2
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Grab the path, make sure to add it to your project!
//        if var movieSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")!) {
//             audioPlayer = AVAudioPlayer(contentsOfURL: movieSound, error: nil)
//             audioPlayer.enableRate = true
//            
//        } else
//        {
//            println("Error locating audio")
//        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
