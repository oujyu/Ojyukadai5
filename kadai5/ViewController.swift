//
//  ViewController.swift
//  kadai5
//
//  Created by 松村直樹 on 2022/08/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var leftNumber: UITextField!
    @IBOutlet weak private var rightNumber: UITextField!
    @IBOutlet weak private var answerLabel: UILabel!

    @IBAction private func divideButton(_ sender: Any) {
        // 割られる数が空白の場合
        if leftNumber.text == "" {
            errorAlert(alertMessage: "割られる数を入力して下さい")
            return
        }
        // 割る数が空白の場合
        if rightNumber.text == "" {
            errorAlert(alertMessage: "割る数を入力して下さい")
            return
        }
        // NSStringでキャスト、Stringをdouble型に変換できるようにする
        let firstValue = ((leftNumber.text ?? "") as NSString).doubleValue
        let secondValue = ((rightNumber.text ?? "") as NSString).doubleValue
        // 割る数が0の場合
        if rightNumber.text == "0" {
            errorAlert(alertMessage: "割る数には0を入力しないで下さい")
            return
        }
        let answerValue = firstValue/secondValue
        answerLabel.text = "\(answerValue)"
    }

    private func errorAlert(alertMessage: String) {
        // Alert内容作成
        let alert = UIAlertController(title: "課題5", message: alertMessage, preferredStyle: .alert)
        // okボタンアクション作成
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in self.dismiss(animated: true, completion: nil)
        }
        // okボタン機能追加
        alert.addAction(okButton)
        // Alert表示
        present(alert, animated: true)
    }
}
