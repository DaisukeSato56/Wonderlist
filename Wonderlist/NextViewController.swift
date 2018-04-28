//
//  NextViewController.swift
//  Wonderlist
//
//  Created by 佐藤大介 on 2018/04/28.
//  Copyright © 2018年 sato daisuke. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var selectedNumber:Int = 0

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func shareLINE(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
