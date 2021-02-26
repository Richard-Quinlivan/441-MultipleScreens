//
//  SecondViewController.swift
//  Multiple Views
//
//  Created by Richard Quinlivan on 2/22/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var ball : UIButton!
    
//    let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
    var FirstViewController : ViewController?
    
    var xPosition:CGFloat = 0
    var timer = Timer()
    var horizontalMovement:CGFloat = 13.0
    var verticalMovement:CGFloat = 13.0
    
    var leftEdge:CGFloat = 0.0
    var rightEdge:CGFloat = UIScreen.main.bounds.size.width
    var topEdge:CGFloat = 0.0
    var bottomEdge:CGFloat = UIScreen.main.bounds.size.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ball.center.y = 0.0
        ball.center.x = xPosition
        startBallMoving()
//        FirstViewController?.swipeUp.direction = UISwipeGestureRecognizer.Direction.down
//        print(FirstViewController!.swipeUp)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is ViewController){
            let firstVC = segue.destination as? ViewController
            firstVC?.xPosition = ball.center.x
            firstVC?.horizontalMovement = 13.0
            firstVC?.verticalMovement = -13.0
        }
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
            verticalMovement = 0
            horizontalMovement = 0
            ball.isHidden = true
        }
        if(ball.center.y >= bottomEdge){
            verticalMovement = -verticalMovement
        }
    }
}
