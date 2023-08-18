//
//  ViewController.swift
//  Counter
//
//  Created by Alexander Ovchinnikov on 18.08.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        updateHistoryTextView(header: "История изменений:")
    }
    
    private var counter = 0
    private var historyStory = ""
    
    @IBAction func counterPlus(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        updateHistoryTextView(change: "на +1")
    }
    
    @IBAction func counterMinus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateCounterLabel()
            updateHistoryTextView(change: "на -1")
        } else {
            updateHistoryTextView(attempt: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func counterClear(_ sender: Any) {
        counter = 0
        updateCounterLabel()
        updateHistoryTextView(reset: "значение сброшено")
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func updateHistoryTextView(header: String? = nil, change: String? = nil, reset: String? = nil, attempt: String? = nil) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        
        if let header = header {
            historyTextView.text = "\(header)\n\(historyStory)"
        }
        
        if let change = change {
            let changeString = "[\(dateString)]: значение изменено \(change)"
            historyStory += "\(changeString)\n"
        }
        
        if let reset = reset {
            let resetString = "[\(dateString)]: \(reset)"
            historyStory += "\(resetString)\n"
        }
        
        if let attempt = attempt {
            let attemptString = "[\(dateString)]: \(attempt)"
            historyStory += "\(attemptString)\n"
        }
        
        historyTextView.text = "История изменений:\n\(historyStory)"
    }
}
