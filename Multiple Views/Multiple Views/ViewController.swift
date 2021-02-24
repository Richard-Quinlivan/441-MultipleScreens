//
//  ViewController.swift
//  Multiple Views
//
//  Created by Richard Quinlivan on 2/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ball : UIButton!
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBallMoving(){
        Timer.scheduledTimer(timeInterval : 0.05, target: self, selector: #selector(ViewController.moveBall), userInfo: nil, repeats: true)
    }
    
    @objc func moveBall(){
        ball.center.x += 13.0
        ball.center.y += 13.0
    }

}

