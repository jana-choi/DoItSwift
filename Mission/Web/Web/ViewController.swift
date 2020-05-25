//
//  ViewController.swift
//  Web
//
//  Created by 박재선 on 2020/05/25.
//  Copyright © 2020 Jana. All rights reserved.
//

import UIKit
import WebKit   // Build Phases > Link Binary With Libraries > + WebKit.framework

class ViewController: UIViewController {
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    func loadHtmlFile() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //loadWebPage("http://naver.com")
        loadHtmlFile()
    }


}

