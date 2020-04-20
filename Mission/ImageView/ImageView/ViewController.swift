//
//  ViewController.swift
//  ImageView
//
//  Created by 박재선 on 2020/04/20.
//  Copyright © 2020 Jana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    var numImage: Int = 0
    var MAX_IMAGE: Int = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numImage = 1;
        reloadCurImage()
    }

    func reloadCurImage() {
        let imageName = String(numImage) + ".png"
               imgView.image = UIImage(named: imageName)
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1;
        if(numImage < 1) {
            numImage = MAX_IMAGE
        }
        
       reloadCurImage()
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if(numImage > MAX_IMAGE) {
            numImage = 1
        }
        
        reloadCurImage()
    }
}

