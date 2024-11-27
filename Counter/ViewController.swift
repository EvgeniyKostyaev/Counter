//
//  ViewController.swift
//  Counter
//
//  Created by Evgeniy Kostyaev on 25.11.2024.
//

import UIKit

private enum Constants {
    static let countLabelPrefix = "Значение счётчика"
    static let initialHistoryText = "История изменений:\n"
    static let incrementEvent = "значение изменено на +1"
    static let decrementEvent = "значение изменено на -1"
    static let belowZeroEvent = "попытка уменьшить значение счётчика ниже 0"
    static let resetEvent = "значение сброшено"
}

private enum CounterEvent {
    case increment
    case decrement
    case reset
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCountLabel()
        
        historyTextView.text = Constants.initialHistoryText
    }
    
    private func handleCounterEvent(event: CounterEvent) {
        switch event {
        case .increment:
            count += 1
            updateHistoryTextView(event: Constants.incrementEvent)
        case .decrement:
            if (count > 0) {
                count -= 1
                updateHistoryTextView(event: Constants.decrementEvent)
            } else {
                updateHistoryTextView(event: Constants.belowZeroEvent)
            }
        case .reset:
            count = 0
            updateHistoryTextView(event: Constants.resetEvent)
        }
        
        updateCountLabel()
    }
    
    private func updateCountLabel() {
        countLabel.text = "\(Constants.countLabelPrefix): \(count)"
    }
    
    private func updateHistoryTextView(event: String) {
        historyTextView.text.append("[\(Date().dateTimeString)]: \(event)\n")
    }

    @IBAction private func didClickPlusButton(_ sender: Any) {
        handleCounterEvent(event: .increment)
    }
    
    @IBAction private func didClickMinusButton(_ sender: Any) {
        handleCounterEvent(event: .decrement)
    }
    
    @IBAction private func didClickResetButton(_ sender: Any) {
        handleCounterEvent(event: .reset)
    }
}

