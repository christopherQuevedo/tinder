//
//  ViewController.swift
//  tinder
//
//  Created by Chris Q. on 10/29/18.
//  Copyright © 2018 Chris Q. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    var cardInitialCenter: CGPoint!
    var whereStartedY: CGFloat!
    var goneRight: CGPoint!
    var goneLeft: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundImage()
        cardInitialCenter = cardImage.center
        goneRight = CGPoint(x: 600, y: cardImage.center.y)
        goneLeft = CGPoint(x: -600, y: cardImage.center.y)
        cardImage.image = UIImage(named: "ryan")
    }

    func roundImage(){
        cardImage.layer.cornerRadius = 50
        cardImage.clipsToBounds = true
    }
    
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if(sender.state == .began){
            whereStartedY = sender.location(in: cardImage).y
        }
        else if(sender.state == .changed){
            // bottom half
            if(whereStartedY > 200){
                // moving left
                if(translation.x < 0){
                    let translationAmount = max(-180,translation.x)
                    let rotationAmount = min(45.0,-Double(translation.x)) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
                // moving right
                else{
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = max(-45.0,-Double(translation.x)) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
            }
            // top half
            else{
                if(translation.x < 0){
                    let translationAmount = max(-180,translation.x)
                    let rotationAmount = max(-45.0,Double(translation.x)) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
                    // moving right
                else{
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = min(45.0,Double(translation.x)) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
            }
        }
        else if(sender.state == .ended){
            if(translation.x > 100){
                print("right")
                UIView.animate(withDuration: 1, animations: {
                    self.cardImage.center = self.goneRight
                }, completion: nil)
            }
            else if(translation.x < -100){
                print("left")
                UIView.animate(withDuration: 1, animations: {
                    self.cardImage.center = self.goneLeft
                }, completion: nil)
            }
            else{
                cardImage.transform = CGAffineTransform.identity
            }
        }
    }
    
    @IBAction func onPicTap(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let im = cardImage.image
        let dest = segue.destination as! ProfileViewController
        dest.proPic = im
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

