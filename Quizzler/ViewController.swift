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
    var score : Int = 0 //follows the score
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //when loaded, the app call the nextQuestion
        nextQuestion()
        
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
        
        scoreLabel.text = "Score: \(score)"
        
    }
    

    func nextQuestion() {

        if questionNumber <= allQuestions.list.count - 1 {
            updateUI()
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {

            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (action) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            score += 1
        } else {
            print("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
    }
    

    
}
