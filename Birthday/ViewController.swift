//
//  ViewController.swift
//  Birthday
//
//  Created by 古堅ニノスカ on 2020/09/21.
//

import UIKit

// 入力画面
class ViewController: UIViewController, UITextFieldDelegate {

    var tttt = 5
    var lugigi = 9
    // 名前テキストフィールド
    @IBOutlet weak var nameTextField: UITextField!
    // 電話番号テキストフィールド
    @IBOutlet weak var phoneTextField: UITextField!
    // メールアドレス テキストフィールド
    @IBOutlet weak var emailTextField: UITextField!
    // パスワード テキストフィールド
    @IBOutlet weak var passwordTextField: UITextField!
    // 日付ピッカー
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickResultBtn(_ sender: UIButton) {
        let resultViewController = storyboard?.instantiateViewController(identifier: "result_view_controller") as! ResultViewController
        resultViewController.name = nameTextField.text!
        resultViewController.phone = phoneTextField.text!
        resultViewController.email = emailTextField.text!
        resultViewController.password = passwordTextField.text!
        resultViewController.year = Calendar(identifier: .gregorian).component(.year, from: datePicker.date)
        resultViewController.month = Calendar(identifier: .gregorian).component(.month, from: datePicker.date)
        resultViewController.dayOfMonth = Calendar(identifier: .gregorian).component(.day, from: datePicker.date)
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    // returnボタンが押されたとき
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
    }
    
    // 画面がタップされたとき
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // キーボードを閉じる
        view.endEditing(true)
    }
}
