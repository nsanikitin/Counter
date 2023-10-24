//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Никитин on 21.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak private var value: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var toNillButton: UIButton!
    @IBOutlet weak private var historyTextView: UITextView!
    private var count: UInt = 0 //переменная для значения счетчика в label
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    //нажатие кнопки +
    @IBAction private func buttonPlusDidTape(_ sender: Any) {
        count += 1  //увеличиваем значение на 1
        value.text = "Значение счетчика: \(count)"  //отображаем текст в label
        historyTextView.insertText("\n \(Date().rusFormat): значение изменено на +1") //добавляем событие в историю изменений
    }
    
    //нажатие кнопки -
    @IBAction private func buttonMinusDidTape(_ sender: Any) {
        if count > 0 {
            count -= 1  //уменьшаем значение на -1
            value.text = "Значение счетчика: \(count)"  //отображаем текст в label
            historyTextView.insertText("\n \(Date().rusFormat): значение изменено на -1") //добавляем событие в историю изменений
        } else {
            historyTextView.insertText("\n \(Date().rusFormat): попытка уменьшить значение счётчика ниже 0") //добавляем событие в историю изменений
        }
    }
    
    //нажатие кнопки сброса
    @IBAction private func buttonToNillDidTape(_ sender: Any) {
        count = 0   //обнуляем значение счетчика
        value.text = "Значение счетчика: \(count)"  //отображаем текст в label
        historyTextView.insertText("\n \(Date().rusFormat): значение сброшено") //добавляем событие в историю изменений
    }
}

//расширение для отображение даты нужном формате
extension Date {
    var rusFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("EE, dd MM yy, HH:mm:ss")
        return dateFormatter.string(from:  self)
    }
    
}
