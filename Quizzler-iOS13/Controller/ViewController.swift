//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var scoresLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressiveView: UIProgressView!
    
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        falseButtonOutlet.layer.cornerRadius = 20
        trueButtonOutlet.layer.cornerRadius = 20
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
            
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        label.text = quizBrain.getQuestionText()
        scoresLabel.text = "Scores: \(quizBrain.score)"
        progressiveView.progress = quizBrain.getProgress()
        
        trueButtonOutlet.backgroundColor = .clear
        falseButtonOutlet.backgroundColor = .clear
    }
}

