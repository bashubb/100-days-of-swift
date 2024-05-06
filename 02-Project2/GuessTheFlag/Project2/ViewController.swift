//
//  ViewController.swift
//  Project2
//
//  Created by HubertMac on 18/03/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    // challenge 2
    var maxQuestion = 10
    var currentQuestion = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        currentQuestion += 1
        
        if currentQuestion > maxQuestion {
            finalAlert()
            return
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        //challenge 1
        updateTitle()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String//challenge 3
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Good Answer, your score is \(score)"
        } else {
            title = "Wrong"
            score -= 1
            //challenge 3
            message = """
                Wrong! That's the flag of \(countries[sender.tag].uppercased())!
            """
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        
    }
    
    //challenge 1
    func updateTitle() {
        title = "\(countries[correctAnswer].uppercased()) - Score: [\(score)] Question: \(currentQuestion)/\(maxQuestion)"
    }
    
    //challenge 2
    func finalAlert() {
        let finalAlert = UIAlertController(title: "End of game", message:"Your score is \(score)" , preferredStyle: .alert)
        finalAlert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion(action:)))
        
        currentQuestion = 0
        maxQuestion = 10
        score = 0
        
        present(finalAlert, animated: true)
    }
}

