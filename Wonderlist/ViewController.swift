//
//  ViewController.swift
//  Wonderlist
//
//  Created by 佐藤大介 on 2018/04/27.
//  Copyright © 2018年 sato daisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
//    TODOのテキストが入る配列
    var titleArray = [String]()
    var label:UILabel = UILabel()
    
//    選択されたセルの番号を入れる変数
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        backView.layer.cornerRadius = 2.0
        
        tableView.separatorStyle = .none
        
    }
    
//    画面が呼び出されるときに、何度でも実行される処理をviewWillAppearに書く
    override func viewWillAppear(_ animated: Bool) {
//        アプリ内に保存されているデータを取ってくる
        
//        Todo
        if UserDefaults.standard.object(forKey: "array") != nil {
            
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
//        画像を取り出す
        if UserDefaults.standard.object(forKey: "array") != nil {
            
            let numberString = UserDefaults.standard.string(forKey: "image")
            
            backImageView.image = UIImage(named: numberString! + ".jpg")
            
        }
        
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        配列の中に文字を入れる
        titleArray.append(textField.text!)
        
//        配列をアプリ内に保存する
        UserDefaults.standard.set(titleArray, forKey: "array")
        
        if UserDefaults.standard.object(forKey: "array") != nil {
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
            textField.text = ""
            tableView.reloadData()
        }
        
//        キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

