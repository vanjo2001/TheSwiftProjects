//
//  ViewController.swift
//  Lesson6UISlider
//
//  Created by Vanjo on 10/11/2018.
//  Copyright © 2018 Vanjo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var errors = Int()
    var player = AVAudioPlayer()
    let slider = UISlider()
    //outlet
     @IBOutlet weak var sliderVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        slider.center = self.view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        view.addSubview(slider)
        
        
        do {
            player = try pathAudio(name: "pixelMusic", type: "mp3")
            self.slider.maximumValue = Float(player.duration)
            }
        catch {
            errors += 1
            print("Error \(error)")
        }
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
    }
    
    
    @IBAction func changeSlider(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        if errors == 1 {
            print("Not Found")
        } else {
            player.play()
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        if errors == 1 {
            print("Not Found")
        } else {
            player.stop()
        }
    }
    
    
    enum errorPath: Error {
        case notFound
    }
    
    @objc func sliderChanged(sender: UISlider) {
        if sender == self.slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    
    func pathAudio(name: String, type: String) throws -> AVAudioPlayer
    {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: type) else {
            throw errorPath.notFound
        }
        return try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
    }

}

