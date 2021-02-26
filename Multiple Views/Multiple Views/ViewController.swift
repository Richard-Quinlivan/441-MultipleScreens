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
    var horizontalMovement:CGFloat = 13.0
    var verticalMovement:CGFloat = 13.0
    
    var leftEdge:CGFloat = 0.0
    var rightEdge:CGFloat = UIScreen.main.bounds.size.width
    var topEdge:CGFloat = 0.0
    var bottomEdge:CGFloat = UIScreen.main.bounds.size.height
    
    var xPosition:CGFloat = 0.0
    var yPosition:CGFloat = 0.0
    var ballHidden:Bool = false

    var secondVC: SecondViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is SecondViewController){
            secondVC = segue.destination as? SecondViewController
            secondVC?.xPosition = ball.center.x
            secondVC?.yPosition = ball.center.y
            secondVC?.horizontalMovement = horizontalMovement
            secondVC?.verticalMovement = verticalMovement
            secondVC?.FirstViewController = self
        }
    }

    @IBAction func startBallMoving(){
        Timer.scheduledTimer(timeInterval : 0.05, target: self, selector: #selector(ViewController.moveBall), userInfo: nil, repeats: true)
    }
    //Blue is visible
    @objc func moveBall(){
        ball.center.x += horizontalMovement
        ball.center.y += verticalMovement
        if(ball.center.x >= rightEdge || ball.center.x <= leftEdge ){
            horizontalMovement = -horizontalMovement
        }
        if(ball.center.y <= topEdge){
            if(ball.isHidden){
                ball.isHidden = false
                ball.center.y = bottomEdge - 5
            }
            else{
                verticalMovement = 13.0
            }
        }
        if(ball.center.y >= bottomEdge){
            
            if(ball.isHidden){
                verticalMovement = -13.0
            }
            else{
                ball.isHidden = true
                ball.center.y = topEdge + 5
                secondVC?.ball.isHidden = false
            }
        }
    }
    
    func startAgain(){
        ball.center.x = xPosition
        ball.center.y = yPosition
        ball.isHidden = ballHidden
    }
}

