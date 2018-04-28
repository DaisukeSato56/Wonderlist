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
        textField.delegate = self
        
        backView.layer.cornerRadius = 2.0
        
        tableView.separatorStyle = .none
        
    }
    
//    画面が呼び出されるときに、何度でも実行される処理をviewWillAppearに書く
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
//    セルの高さを操る
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.layer.cornerRadius = 10.0
        label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = titleArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
//    セルがタップされたときに発動するメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        値を渡しながら
        count = Int(indexPath.row)
        
//        画面遷移
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC:NextViewController = segue.destination as! NextViewController
            
            nextVC.selectedNumber = count
        }
    }
    
//    セルの編集
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //            titleArrayの選択された際の番号の配列に入っている文字を消去
            titleArray.remove(at: indexPath.row)
            
            //            配列をアプリ内へ保存
            UserDefaults.standard.set(titleArray, forKey: "array")
            
            tableView.reloadData()
        } else if editingStyle == .insert{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

