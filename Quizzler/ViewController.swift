//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //places question bank list into allQuestions, inititalizes picken answer and counter
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = true
    var questionNumber : Int = 0
    var score : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //pops up first question as place 0 from question bank
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject)
    {
        if sender.tag == 1
        {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        updateUI()

    }
    
    
    func updateUI()
    {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        progressBar.frame.size.width = ((view.frame.size.width)/13) * CGFloat(questionNumber + 1)
        nextQuestion()
    }
    

    func nextQuestion()
    {
        if questionNumber <= 12
        {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            
            //declares alert and action
            let alert = UIAlertController(title: "\(score) out of 13", message: "Congratulations, You completed the quiz!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart?", style: .default) { (alert) in
                self.startOver() }
            
            //activates alert and action
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer()
    {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer
        {
            print("you got it!")
            ProgressHUD.showSuccess("Correct!")
            score += 1
        } else {
            print("wrong")
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver()
    {
        questionNumber = 0
        score = 0
        nextQuestion()
        
    }
    

    
}
