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
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var TrueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
        
        
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
        
        nextQuestion()
        
    
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
        if (questionNumber == allQuestions.list.count-1) {
            questionLabel.text = "No More questions"
            FalseButton.isEnabled = false
            TrueButton.isEnabled = false
        }
        else {
            questionNumber = questionNumber  + 1
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
    }
    
    
    func checkAnswer(pickedAnswer : Bool) {
        //let firstQuestion = allQuestions.list[0]
    
    }
    
    
    func startOver() {
        FalseButton.isEnabled = true
        TrueButton.isEnabled = true
        questionNumber = 0
        nextQuestion() 

    }
    

    
}
