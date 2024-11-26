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
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounterValueLabel()
    }
    
    private func updateCounterValueLabel() {
        counterValueLabel.text = "Значение счётчика: \(count)"
    }

    @IBAction func onClickPlusButton(_ sender: Any) {
        count += 1
        
        updateCounterValueLabel()
    }
    
    @IBAction func onClickMinusButton(_ sender: Any) {
        if (count > 0) {
            count -= 1
            
            updateCounterValueLabel()
        }
    }
}

