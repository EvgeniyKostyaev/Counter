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
    
    private var events: String = String()
    
    private let countKey = "CountKey"
    private let eventsKey = "EventsKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = getCountFromStorage()
        updateCountLabel()
        
        events = getHistoryFromStorage() ?? Constants.initialHistoryText
        updateHistoryTextView()
    }
    
    private func handleCounterEvent(event: CounterEvent) {
        switch event {
        case .increment:
            count += 1
            events.append("[\(Date().dateTimeString)]: \(Constants.incrementEvent)\n")
        case .decrement:
            if (count > 0) {
                count -= 1
                events.append("[\(Date().dateTimeString)]: \(Constants.decrementEvent)\n")
            } else {
                events.append("[\(Date().dateTimeString)]: \(Constants.belowZeroEvent)\n")
            }
        case .reset:
            count = 0
            events.append("[\(Date().dateTimeString)]: \(Constants.resetEvent)\n")
        }
        
        saveCountInStorage(count)
        updateCountLabel()
        
        saveHistoryInStorage(events)
        updateHistoryTextView()
    }
    
    private func updateCountLabel() {
        countLabel.text = "\(Constants.countLabelPrefix): \(count)"
    }
    
    private func updateHistoryTextView() {
        historyTextView.text = events
    }
    
    private func saveCountInStorage(_ count: Int) {
        UserDefaults.standard.set(count, forKey: countKey)
    }
    
    private func getCountFromStorage() -> Int {
        return UserDefaults.standard.integer(forKey: countKey)
    }
    
    private func saveHistoryInStorage(_ events: String) {
        UserDefaults.standard.set(events, forKey: eventsKey)
    }
    
    private func getHistoryFromStorage() -> String? {
        return UserDefaults.standard.string(forKey: eventsKey)
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

