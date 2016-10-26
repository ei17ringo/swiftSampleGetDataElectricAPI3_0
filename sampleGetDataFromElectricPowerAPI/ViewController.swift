//
//  ViewController.swift
//  sampleGetDataFromElectricPowerAPI
//
//  Created by Eriko Ichinohe on 2016/02/03.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDatePicker.datePickerMode = UIDatePickerMode.date
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBtn(_ sender: UIButton) {

        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        let dateStr = df.string(from: myDatePicker.date)
        
        let url = URL(string: "http://tepco-usage-api.appspot.com/\(dateStr)/0.json")
        let request = URLRequest(url:url!)
        let jsondata = (try! NSURLConnection.sendSynchronousRequest(request, returning: nil))
        let jsonDictionary = (try! JSONSerialization.jsonObject(with: jsondata, options: [])) as! NSDictionary
        for(key, data) in jsonDictionary{
            print("\(key)=\(data)")
        }
        
    }

}

