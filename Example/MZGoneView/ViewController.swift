//
//  ViewController.swift
//  MZGoneView
//
//  Created by muzcity on 10/15/2017.
//  Copyright (c) 2017 muzcity. All rights reserved.
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
        gone1.gone(direction: MZVisibleState.goneHeight, animated: true)
        gone2.gone(direction: MZVisibleState.goneWidth, animated: true)
    }
    
    @IBAction func goneFalseButtonPressed(_ sender: UIButton) {
        gone1.gone(direction: MZVisibleState.visible, animated: true)
        gone2.gone(direction: MZVisibleState.visible, animated: true)
    }
    
}

