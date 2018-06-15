//
//  ViewController.swift
//  paperScissorsRock
//
//  Created by Saša Brezovac on 06.12.2017..
//  Copyright © 2017. Saša Brezovac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var imgViewPaper: UIImageView!
    @IBOutlet weak var imgViewPaper1: UIImageView!
    @IBOutlet weak var imgViewRock: UIImageView!
    @IBOutlet weak var imgViewRock1: UIImageView!
    @IBOutlet weak var imgViewScissors: UIImageView!
    @IBOutlet weak var imgViewScissors1: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    
    var player: AVAudioPlayer!
    var player0: AVAudioPlayer!
    var player1: AVAudioPlayer!
    var player2: AVAudioPlayer!
    var player3: AVAudioPlayer!
    var player4: AVAudioPlayer!
    
    
    var currentlySelectedImage : Int = -1
    
    var firstHand : Int!
    var secondHand : Int!
    
    
    
    var counter : Int = 0{
        didSet{
            if(counter == 2){
                btnPlay.isHidden = true
                self.lblText.text = "Game over"
                self.checkWinConditions()
            }
        }
    }
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgViewPaper.isHidden = true
        imgViewRock.isHidden = true
        imgViewScissors.isHidden = true
        imgViewPaper1.isHidden = true
        imgViewRock1.isHidden = true
        imgViewScissors1.isHidden = true
        
        sound()
        
        lblResult.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    @IBAction func btnPlayPressed(_ sender: UIButton) {
        
        if btnPlay == sender {
            self.lblText.text = "Next player"
        }
        
        
        var isEqual : Bool = true
        var random : UInt32 = 0
        
        repeat {
            random = arc4random_uniform(6)
            if(random != self.currentlySelectedImage){
                isEqual = false
            }
        }while isEqual
        
        
        switch random {
        case 0:
            imgViewPaper.isHidden = false
            currentlySelectedImage = 0
            firstHand = 0
            player2.play()
        case 1:
            imgViewRock.isHidden = false
            currentlySelectedImage = 1
            firstHand = 1
            player1.play()
        case 2:
            imgViewScissors.isHidden = false
            currentlySelectedImage = 2
            firstHand = 2
            player.play()
        case 3:
            imgViewPaper1.isHidden = false
            currentlySelectedImage = 3
            secondHand = 3
            player2.play()
        case 4:
            imgViewRock1.isHidden = false
            currentlySelectedImage = 4
            secondHand = 4
            player1.play()
        case 5:
            imgViewScissors1.isHidden = false
            currentlySelectedImage = 5
            secondHand = 5
            player.play()
        default:
            break
        }
        
        counter = counter + 1
    }
    
    
    func checkWinConditions(){
        
        if firstHand == 0 && secondHand == 3 {
            lblResult.text = "Deuce! Paper is equal to Paper."
        }else if firstHand == 3 && secondHand == 0 {
            lblResult.text = "Paper is equal to Paper."
            
        }else if firstHand == 1 && secondHand == 4 {
            lblResult.text = "Rock is equal to Rock."
        }else if firstHand == 4 && secondHand == 1 {
            lblResult.text = "Deuce! Rock is equal to Rock."
            
        }else if firstHand == 2 && secondHand == 5 {
            lblResult.text = "Scissors are equal to Scissors."
        }else if firstHand == 5 && secondHand == 2 {
            lblResult.text = "Scissors are equal to Scissors."
        }
            
        else if firstHand == 0 && secondHand == 1 {
            lblResult.text = "Paper covered rock!"
        }else if firstHand == 3 && secondHand == 4 {
            lblResult.text = "Paper covered rock!"
        }else if firstHand == 1 && secondHand == 0 {
            lblResult.text = "Paper covered rock!"
        } else if firstHand == 4 && secondHand == 3 {
            lblResult.text = "Paper covered rock!"
        }
        else if firstHand == 0 && secondHand == 4 {
            lblResult.text = "Paper covered rock!"
        }else if firstHand == 3 && secondHand == 1 {
            lblResult.text = "Paper covered rock!"
        } else if firstHand == 4 && secondHand == 0 {
            lblResult.text = "Paper covered rock!"
        }else if firstHand == 1 && secondHand == 3 {
            lblResult.text = "Paper covered rock!"
        }
            
            
            
            
            
        else if firstHand == 1 && secondHand == 2 {
            lblResult.text = "Rock killed scissors!"
        }else if firstHand == 4 && secondHand == 5 {
            lblResult.text = "Rock killed scissors!"
        }else if firstHand == 2 && secondHand == 1 {
            lblResult.text = "Rock killed scissors!"
        }else if firstHand == 5 && secondHand == 4 {
            lblResult.text = "Rock killed scissors!"
        }
        else if firstHand == 1 && secondHand == 5 {
            lblResult.text = "Rock killed scissors!"
        }else if firstHand == 4 && secondHand == 2 {
            lblResult.text = "Rock killed scissors!"
        }else if firstHand == 5 && secondHand == 1 {
            lblResult.text = "Rock killed scissors."
        }else if firstHand == 2 && secondHand == 4 {
            lblResult.text = "Rock killed scissors!"
        }
            
        else if firstHand == 0 && secondHand == 2 {
            lblResult.text = "Scissors cut paper!"
        }else if firstHand == 3 && secondHand == 5 {
            lblResult.text = "Scissors cut paper!"
        }else if firstHand == 2 && secondHand == 0 {
            lblResult.text = "Scissors cut paper!"
        }else if firstHand == 5 && secondHand == 3 {
            lblResult.text = "Scissors cut paper!"
        }
        else if firstHand == 0 && secondHand == 5 {
            lblResult.text = "Scissors cut paper!"
        }else if firstHand == 3 && secondHand == 2 {
            lblResult.text = "Scissors cut paper!"
        }else if firstHand == 5 && secondHand == 0 {
            lblResult.text = "Scissors cut paper."
        }else if firstHand == 2 && secondHand == 3 {
            lblResult.text = "Scissors cut paper!"
        }
        player4.play()
    }
    
    func sound() {
        let path = Bundle.main.path(forResource: "chain", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        let path0 = Bundle.main.path(forResource: "game", ofType: "wav")!
        let url0 = URL(fileURLWithPath: path0)
        
        let path1 = Bundle.main.path(forResource: "Grenade", ofType: "wav")!
        let url1 = URL(fileURLWithPath: path1)
        
        let path2 = Bundle.main.path(forResource: "Arrow", ofType: "wav")!
        let url2 = URL(fileURLWithPath: path2)
        
        let path3 = Bundle.main.path(forResource: "woohoo", ofType: "wav")!
        let url3 = URL(fileURLWithPath: path3)
        
        let path4 = Bundle.main.path(forResource: "laugh", ofType: "wav")!
        let url4 = URL(fileURLWithPath: path4)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player0 = try AVAudioPlayer(contentsOf: url0)
            player1 = try AVAudioPlayer(contentsOf: url1)
            player2 = try AVAudioPlayer(contentsOf: url2)
            player3 = try AVAudioPlayer(contentsOf: url3)
            player4 = try AVAudioPlayer(contentsOf: url4)
            player.prepareToPlay()
            player0.play()
            player1.prepareToPlay()
            player2.prepareToPlay()
            player3.prepareToPlay()
            player4.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
    }
    
    
    @IBAction func btnRestartPressed(_ sender: UIButton) {
        imgViewPaper.isHidden = true
        imgViewRock.isHidden = true
        imgViewScissors.isHidden = true
        imgViewPaper1.isHidden = true
        imgViewRock1.isHidden = true
        imgViewScissors1.isHidden = true
        lblText.text = "Let's play again!"
        
        lblResult.text = ""
        
        btnPlay.isHidden = false
        btnPlay.isEnabled = true
        
        counter = 0
        
        player.stop()
        player1.stop()
        player2.stop()
        player4.stop()
        player3.play()
    }
}

