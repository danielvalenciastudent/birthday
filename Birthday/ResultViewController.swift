//
//  ResultViewController.swift
//  Birthday
//
//  Created by 古堅ニノスカ on 2020/09/21.
//

import UIKit
import MessageUI

// 結果画面
class ResultViewController : UIViewController, MFMailComposeViewControllerDelegate {
    
    // 名前ラベル
    @IBOutlet weak var nameLabel: UILabel!
    // 電話番号ラベル
    @IBOutlet weak var phoneLabel: UILabel!
    // メールアドレス ラベル
    @IBOutlet weak var emailLabel: UILabel!
    // パスワード ラベル
    @IBOutlet weak var passwordLabel: UILabel!
    // 歳ラベル
    @IBOutlet weak var ageLabel: UILabel!
    // 名前
    var name = ""
    // 電話番号
    var phone = ""
    // メールアドレス
    var email = ""
    // パスワード
    var password = ""
    // 年
    var year = 0
    // 月
    var month = 0
    // 日にち
    var dayOfMonth = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        phoneLabel.text = phone
        emailLabel.text = email
        passwordLabel.text = password
        ageLabel.text = "\(ConverterUtil.getAge(year: year, month: month, dayOfMonth: dayOfMonth))\(NSLocalizedString("age", comment: "コメント"))"
    }
    
    @IBAction func onClickSendBtn(_ sender: UIButton) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("メールアプリが見つかりません")
            return
        }

        let sendMail = MFMailComposeViewController()
        sendMail.mailComposeDelegate = self
        sendMail.setToRecipients(["daniel.valencia.student@gmail.com"]) //宛先
        sendMail.setSubject("レッスン2のテストメール") //件名
        if let name = nameLabel.text, let phone = phoneLabel.text, let email = emailLabel.text, let password = passwordLabel.text, let age = ageLabel.text {
            let mailText = "名前: \(name)\n電話番号: \(phone)\nアドレス: \(email)\nパスワード: \(password)\n歳: \(age)"
            sendMail.setMessageBody(mailText, isHTML: false) //本文
            present(sendMail, animated: true, completion: nil)
        }
    }
    
    // メールアプリでアクションが完了したら
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
