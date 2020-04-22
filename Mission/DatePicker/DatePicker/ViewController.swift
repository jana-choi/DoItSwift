//
//  ViewController.swift
//  DatePicker
//
//  Created by 박재선 on 2020/04/20.
//  Copyright © 2020 Jana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime = ""
    var alertFlag = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택 시간: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
        
//        if(alarmTime == currentTime) {
//            if(view.backgroundColor == UIColor.red) {
//                view.backgroundColor = UIColor.blue
//            }
//            else {
//                view.backgroundColor = UIColor.red
//            }
//        }
//        else {
//            view.backgroundColor = UIColor.white
//        }
        
        if (alarmTime == currentTime) {
            if (alertFlag == false) {
                let timeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                timeAlert.addAction(onAction)
                present(timeAlert, animated: true, completion: nil)
            }
            alertFlag = true
        }
        else {
            alertFlag = false
        }
    }
}

