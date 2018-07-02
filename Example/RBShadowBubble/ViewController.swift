//
//  ViewController.swift
//  RBShadowBubble
//
//  Created by rezabina86 on 07/02/2018.
//  Copyright (c) 2018 rezabina86. All rights reserved.
//

import UIKit
import RBShadowBubble

class ViewController: UIViewController {
    
    @IBOutlet weak var bubbleView: BubbleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bubbleView.cornerRadius = 5
        bubbleView.padding = 25
        bubbleView.bubbleBackground = UIColor.white
        bubbleView.borderColor = UIColor.black
        bubbleView.shadowColor = UIColor.black
        bubbleView.shadowOpacity = 1.0
        bubbleView.shadowOffset = CGSize(width: 1, height: 1)
    }

}

