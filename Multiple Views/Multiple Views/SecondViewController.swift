//
//  SecondViewController.swift
//  Multiple Views
//
//  Created by Richard Quinlivan on 2/22/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var ball : UIButton!
    
    var FirstViewController : ViewController?
    
    var xPosition:CGFloat = 0.0
    var yPosition:CGFloat = 0.0
    var timer = Timer()
    var horizontalMovement:CGFloat = 13.0
    var verticalMovement:CGFloat = 13.0
    
    var leftEdge:CGFloat = 0.0
    var rightEdge:CGFloat = UIScreen.main.bounds.size.width
    var topEdge:CGFloat = 0.0
    var bottomEdge:CGFloat = UIScreen.main.bounds.size.height
    var ballHidden:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ball.center.y = yPosition
        ball.center.x = xPosition
        ball.isHidden = ballHidden

        startBallMoving()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        FirstViewController?.xPosition = ball.center.x
        FirstViewController?.yPosition = ball.center.y
        FirstViewController?.horizontalMovement = horizontalMovement
        FirstViewController?.verticalMovement = verticalMovement
        FirstViewController?.startAgain()
    }
    

    @IBAction func startBallMoving(){
        ball.isHidden = false
        Timer.scheduledTimer(timeInterval : 0.05, target: self, selector: #selector(SecondViewController.moveBall), userInfo: nil, repeats: true)
    }
    
    @objc func moveBall(){
        ball.center.x += horizontalMovement
        ball.center.y += verticalMovement
        if(ball.center.x >= rightEdge || ball.center.x <= leftEdge ){
            horizontalMovement = -horizontalMovement
        }
        if(ball.center.y <= topEdge){
            if(ball.isHidden){
                verticalMovement = 13.0
            }
            else{
                ball.isHidden = true
                ball.center.y = bottomEdge - 5
                FirstViewController?.ball.isHidden = false
            }
        }
        if(ball.center.y >= bottomEdge){
            if(ball.isHidden){
                ball.isHidden = false
                ball.center.y = topEdge + 5
            }
            else{
                verticalMovement = -13.0
            }
        }
    }
}
