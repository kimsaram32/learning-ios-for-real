//
//  ViewController.swift
//  Project2
//
//  Created by 김민정 on 3/24/25.
//

import UIKit

class ViewController: UIViewController {
    lazy var flagButtons = [UIButton(), UIButton(), UIButton()]
    lazy var flagButton1 = UIButton()
    lazy var flagButton2 = UIButton()
    lazy var flagButton3 = UIButton()
    lazy var answerLabel = UILabel()
    
    let TITLE = "Guess the flag"
    let TOTAL_QUESTIONS = 10

    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer = 0
    
    var score = 0
    var askedQuestionsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false

        for (index, button) in flagButtons.enumerated() {
            view.addSubview(button)

            button.translatesAutoresizingMaskIntoConstraints = false

            button.tag = index
            button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)

            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 2
        }
        
        NSLayoutConstraint.activate([
            flagButtons[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagButtons[1].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            flagButtons[0].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagButtons[0].bottomAnchor.constraint(equalTo: flagButtons[1].topAnchor, constant: -30),
            flagButtons[2].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagButtons[2].topAnchor.constraint(equalTo: flagButtons[1].bottomAnchor, constant: 30),
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 94),
        ])
        
        askQuestion()
    }
    
    func askQuestion() {
        askedQuestionsCount += 1
        title = "\(TITLE) \(askedQuestionsCount)/\(TOTAL_QUESTIONS) (score: \(score))"
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        answerLabel.text = countries[correctAnswer].uppercased()

        for (index, button) in flagButtons.enumerated() {
            button.setImage(UIImage(named: countries[index]), for: .normal)
        }
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

