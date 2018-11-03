//
//  ProfileViewController.swift
//  tinder
//
//  Created by Chris Q. on 10/29/18.
//  Copyright © 2018 Chris Q. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var proPicView: UIImageView!
    var proPic: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proPicView.image = proPic
    }
    
    @IBAction func onDone(_ sender: Any) {
        performSegue(withIdentifier: "cardSegue", sender: nil)
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
