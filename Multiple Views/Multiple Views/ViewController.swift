//
//  ViewController.swift
//  Multiple Views
//
//  Created by Richard Quinlivan on 2/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ball : UIButton!
//    @IBOutlet weak var myView : UIView!
//    let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(SwipeUp(sender:)))
    //var swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(SwipeDown))

    var timer = Timer()
    var horizontalMovement:CGFloat = 13.0
    var verticalMovement:CGFloat = 13.0
    
    var leftEdge:CGFloat = 0.0
    var rightEdge:CGFloat = UIScreen.main.bounds.size.width
    var topEdge:CGFloat = 0.0
    var bottomEdge:CGFloat = UIScreen.main.bounds.size.height
    
    var xPosition:CGFloat = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(SwipeUp))
//        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
//        myView.addGestureRecognizer(swipeUp)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ksjgnakjg")
        if (segue.destination is SecondViewController){
            let secondVC = segue.destination as? SecondViewController
            secondVC?.xPosition = ball.center.x
            secondVC?.horizontalMovement = 13.0
            secondVC?.verticalMovement = 13.0
            secondVC?.FirstViewController = self
        }
    }

    @IBAction func startBallMoving(){
        Timer.scheduledTimer(timeInterval : 0.05, target: self, selector: #selector(ViewController.moveBall), userInfo: nil, repeats: true)
    }
    
    @objc func moveBall(){
        ball.center.x += horizontalMovement
        ball.center.y += verticalMovement
        if(ball.center.x >= rightEdge || ball.center.x <= leftEdge ){
            horizontalMovement = -horizontalMovement
        }
        if(ball.center.y <= topEdge){
            verticalMovement = -verticalMovement
        }
        if(ball.center.y >= bottomEdge){
            verticalMovement = 0
            horizontalMovement = 0
            ball.isHidden = true
        }
        
        
//        if (navigationController?.viewControllers) != nil {
//            if(navigationController?.viewControllers.count == 1){
//                startAgain()
//            }
//        }
    }
//    @objc func SwipeUp(gesture: UIGestureRecognizer){
//        print("Here")
//        print(gesture)
//        self.performSegue(withIdentifier: "GoToSecondViewSegue", sender: nil)
//    }
//    @objc func SwipeUp(sender: UITapGestureRecognizer){
//        print("Here")
////        print(gesture)
//        self.performSegue(withIdentifier: "GoToSecondViewSegue", sender: nil)
//    }
//    @objc func SwipeDown(){
//        startAgain()
//    }
//
//    func startAgain(){
//        //swipeUp.direction = UISwipeGestureRecognizer.Direction.up
//        ball.center.x = xPosition
//        ball.center.y = bottomEdge
//        horizontalMovement = 13.0
//        verticalMovement = 13.0
//        ball.isHidden = false
//    }
}

