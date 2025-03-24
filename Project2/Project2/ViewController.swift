//
//  ViewController.swift
//  Project2
//
//  Created by 김민정 on 3/24/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var flagButton1: UIButton!
    @IBOutlet var flagButton2: UIButton!
    @IBOutlet var flagButton3: UIButton!
    @IBOutlet var answerLabel: UILabel!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Guess the flag"
        
        for button in [flagButton1, flagButton2, flagButton3] as [UIButton] {
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 2
        }
        
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        answerLabel.text = countries[correctAnswer].uppercased()
        
        flagButton1.setImage(UIImage(named: countries[0]), for: .normal)
        flagButton2.setImage(UIImage(named: countries[1]), for: .normal)
        flagButton3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        let answer = sender.tag
        var title: String
        if answer == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong"
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Next", style: .default, handler: { _ in self.askQuestion() }))
        present(ac, animated: true)
    }
}

