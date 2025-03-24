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
    
    let TITLE = "Guess the flag"
    let TOTAL_QUESTIONS = 10

    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer = 0
    
    var score = 0
    var askedQuestionsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in [flagButton1, flagButton2, flagButton3] as [UIButton] {
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 2
        }
        
        askQuestion()
    }
    
    func askQuestion() {
        askedQuestionsCount += 1
        title = "\(TITLE) \(askedQuestionsCount)/\(TOTAL_QUESTIONS) (score: \(score))"
        
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
            let answerCountry = countries[answer]
            let answerCountryName = answerCountry.count == 2 ? answerCountry.uppercased() : answerCountry.capitalized
            title = "Wrong, that's the flag of \(answerCountryName)"
        }
        
        let ended = askedQuestionsCount == TOTAL_QUESTIONS
        print(ended)
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: ended ? "Start over" : "Next", style: .default, handler: { _ in
            if ended {
                self.score = 0
                self.askedQuestionsCount = 0
            }
            self.askQuestion()
        }))
        present(ac, animated: true)
    }
}

