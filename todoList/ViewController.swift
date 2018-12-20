//
//  ViewController.swift
//  todoList
//
//  Created by DH on 2018/12/17.
//  Copyright © 2018 DH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var currentValue: Int = 0
    var targetValue = 0 {
        didSet {
            targetLabel.text = "\(targetValue)"
        }
    }
    var rounds = 1 {
        didSet {
            roundLabel.text = "\(rounds)"
        }
    }
    var difference:Int = 0;
    var points = 0 {
        didSet {
            scoreLabel.text = "\(points)"
        }
    }
    @IBOutlet weak var targetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slide.value)
        targetValue = Int.random(in: 1...100)
        roundLabel.text = "\(rounds)"
    }
    @IBAction func showAlert () {
        difference = abs(currentValue - targetValue)
        var score = 100 - difference
        if score == 100 {
            score += 100
        }
        points += score
        
        let message = "you score \(score)"
        let title: String
        if difference == 0 {
            title = "perfect!"
        } else if difference < 5 {
            title = "You almost did it!"
        } else if difference < 10 {
            title = "pretty good"
        } else {
            title = "Not even close"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "confirm", style: UIAlertAction.Style.default, handler: nextRound)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func slideMoved (_ sender: UISlider) {
        print("value:\(lroundf(sender.value))")
        currentValue = lroundf(sender.value)
    }
    func nextRound (_ action: UIAlertAction) -> Void {
        if targetValue == currentValue {
            rounds += 1
            targetValue = Int.random(in: 1...100)
            currentValue = 50
            slide.value = Float(50)
        } else {
            currentValue = 50
            slide.value = Float(50)
        }
    }
}

