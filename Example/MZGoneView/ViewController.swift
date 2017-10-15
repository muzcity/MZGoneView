//
//  ViewController.swift
//  MZGoneView
//
//  Created by roy@buzzni.com on 10/15/2017.
//  Copyright (c) 2017 roy@buzzni.com. All rights reserved.
//

import UIKit
import MZGoneView

class ViewController: UIViewController {
    
    @IBOutlet weak var gone1 : MZGoneView!
    @IBOutlet weak var gone2 : MZGoneView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goneTrueButtonPressed(_ sender: UIButton) {
        gone1.gone(direction: GONE_DIRECTION.goneHeight, animated: true)
        gone2.gone(direction: GONE_DIRECTION.goneWidth, animated: true)
    }
    
    @IBAction func goneFalseButtonPressed(_ sender: UIButton) {
        gone1.gone(direction: GONE_DIRECTION.visible, animated: true)
        gone2.gone(direction: GONE_DIRECTION.visible, animated: true)
    }
    
}

