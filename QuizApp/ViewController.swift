//
//  ViewController.swift
//  QuizApp
//
//  Created by Charles Wall on 12/16/21.
//  Copyright © 2021 Chaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var currentQuestionIndex = 0
    var score = 0
    var done = false
    
    var listOfQuestions = QuestionBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // Setup
        // The progressBar's progress value is a float with a range
        // of 0 to 1
        progressBar.progress = 0  // can be set in editor
       
        
        
        var question1 = QuizQuestion(question: "The sky is blue", answer: true)
        
        // Use dot notation to access properties / data members
        //print(question1)  // we'll probably want to access a property
        //print("question1.question: \(question1.question)")
        
        
        // appending a variable:
        listOfQuestions.questionBank.append(question1)
        
        // appending a direct QuizQuestion instiation:
        listOfQuestions.questionBank.append(QuizQuestion(
            question: "The Detroit Lions are in first place", answer: false))
        
        
        
        // Display the first question:
        questionText.text = listOfQuestions.questionBank[currentQuestionIndex].question

        
    }  // end viewDidLoad
    
    
    // Connecting both True and False buttons to
    // the same Action
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // Only ask the next question if currentQuestionIndex
        // is in bounds of the array
        if(currentQuestionIndex < listOfQuestions.questionBank.count) {
            
            
             // The True button's tag should be 0
             // The False button's tag should be 1
            // Be sure to set the tag property of the buttons!!!!!!!!
            // !!!!!!!!!    
             if(sender.tag == 0) {
             
                 // if the current question's answer is true, add to score
                 if(listOfQuestions.questionBank[currentQuestionIndex].answer == true) {
                 // Increase the score
                 score += 1
                 }
                
                 }
                 else if(sender.tag == 1) {
                 // if the current question's answer is false, add to score
                 if(listOfQuestions.questionBank[currentQuestionIndex].answer == false) {
                 // Increase the score
                 score += 1
                 
                 }
             
             }
             
            
            // Debug
            // print("score: \(score)")
            
            // Move to next question
            currentQuestionIndex += 1
            
            // Check for end
            if(currentQuestionIndex == listOfQuestions.questionBank.count) {
                done = true
            }
            
            // if we're done, don't show the next question
            // and display the final score
            if(done == true) {
                
                questionText.text = "Final score: \(score)"
                displayAlert()
                
            }
            else {  // Ask the next question
                
                questionText.text = listOfQuestions.questionBank[currentQuestionIndex].question
                
            }
            
            // Increment the progress bar
            progressBar.setProgress(Float(currentQuestionIndex) /
                Float(listOfQuestions.questionBank.count), animated: true)
            
            
        }  // end bounds check
        
    }  // end buttonPressed()
    
    
    func displayAlert() {
    
        // Setup
        // The only difference between these two is the preferredStyle
        // let alert = UIAlertController(title: "Restart?", message: "Do you want to play again?", preferredStyle: .alert)

        let alert = UIAlertController(title: "Quit or Restart", message: "Do you want to play again?", preferredStyle: .actionSheet)

        // Adding an Action to the alert
        // Restart action
        let restartAction = UIAlertAction(title: "Yes", style: .default) {
            (UIAlertAction) in self.restart()
            }
        
        // Quit action
        let quitAction = UIAlertAction(title: "No", style: .default) {
            (UIAlertAction) in self.quit()
        }
        
        // For any action, add it to the alert
        // We can have more than one action
        alert.addAction(restartAction)
        alert.addAction(quitAction)
        
        
        // Display
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func restart() {
        
        // Reset game variables
        currentQuestionIndex = 0
        score = 0
        done = false
        progressBar.progress = 0
        
        // print("restaring")
        
        // Display the first question:
        questionText.text = listOfQuestions.questionBank[currentQuestionIndex].question
        
    }
 
    func quit() {
        // Just let the app sit there if the user answers "No" to "Restart?"
        //exit(0)
    }
}
