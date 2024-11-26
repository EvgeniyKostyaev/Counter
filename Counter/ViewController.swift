//
//  ViewController.swift
//  Counter
//
//  Created by Evgeniy Kostyaev on 25.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValueLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var knockButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounterValueLabel()
        
        historyTextView.text = "История изменений:\n"
    }
    
    private func updateCounterValueLabel() {
        counterValueLabel.text = "Значение счётчика: \(count)"
    }
    
    private func updateHistoryTextView(event: String) {
        historyTextView.text.append("[\(Date().dateTimeString)]: \(event)\n")
    }

    @IBAction func onClickPlusButton(_ sender: Any) {
        count += 1
        
        updateCounterValueLabel()
        
        updateHistoryTextView(event: "значение изменено на +1")
    }
    
    @IBAction func onClickMinusButton(_ sender: Any) {
        if (count > 0) {
            count -= 1
            
            updateCounterValueLabel()
            
            updateHistoryTextView(event: "значение изменено на -1")
        } else {
            updateHistoryTextView(event: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func onClickKnockButton(_ sender: Any) {
        count = 0
        
        updateCounterValueLabel()
        
        updateHistoryTextView(event: "значение сброшено")
    }
}

