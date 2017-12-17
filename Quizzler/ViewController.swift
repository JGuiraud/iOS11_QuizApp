//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank() //
    var pickedAnswer : Bool = false //By default, the picked answer is 0, false.
    var questionNumber : Int = 0 //follows the state of the app, i.e. the question we're on.
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true

        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()

    }
    
    func updateUI() {
        
    }
    

    func nextQuestion() {
        if questionNumber <= allQuestions.list.count - 1 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            print("End of quizz")
            questionNumber = 0
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("You got it")
        } else {
            print("Wrong!")
        }
    }
    
    
    func startOver() {
    }
    

    
}
