//
//  ViewController.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/1.
//  Copyright © 2021 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HttpHelper.sharedInstance.httpAction()
    }
}

