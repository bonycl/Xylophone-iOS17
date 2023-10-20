//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
            
        //print (sender.currentTitle!)
        //sender.alpha = 0.5
        
        playSound(soundName: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(0.2)), execute: {
            sender.alpha = 0.5
            
            
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(1)), execute: {
            
            sender.alpha = 1
            print(sender.alpha)
        })
    }
    
    func playSound(soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    //func chngOpacity (viewName: UIImageView){
        
   // }
    
    
    
    
}


