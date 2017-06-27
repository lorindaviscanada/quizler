//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var TrueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        var pickedAnswer : Bool = false
        
        if  sender.tag == 1 {
            pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        
        checkAnswer(pickedAnswer: pickedAnswer)
        
        questionNumber = questionNumber  + 1
        
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) / \(allQuestions.list.count)"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber+1)
    }
    

    func nextQuestion() {
        
        if (questionNumber < allQuestions.list.count) {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "End of Quiz", message: "You have finished with the questions, do you want to start over?", preferredStyle: .alert)
            let restartAcion = UIAlertAction(title: "Resart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAcion)
            
            present(alert, animated: true, completion: nil)
            }
    }
    
    
    
    func checkAnswer(pickedAnswer : Bool) {
        
        if allQuestions.list[questionNumber].answer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong")
        }
        
        
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}
