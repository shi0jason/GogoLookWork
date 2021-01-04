//
//  WebController.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/3.
//  Copyright © 2021 Jason. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController {

    @IBOutlet weak var webview: WKWebView!

    private let url: URL

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    private func loadRequest() {
        webview.load(URLRequest(url: self.url))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
