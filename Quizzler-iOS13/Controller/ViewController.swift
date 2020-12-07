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
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        button1.layer.cornerRadius = 20
        button2.layer.cornerRadius = 20
        button3.layer.cornerRadius = 20
    }
    

    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        let userAnswer = quizBrain.getButtonNames()[sender.tag]
        
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
        
        button1.setTitle(quizBrain.getButtonNames()[0], for: .normal)
        button2.setTitle(quizBrain.getButtonNames()[1], for: .normal)
        button3.setTitle(quizBrain.getButtonNames()[2], for: .normal)
        
        button1.backgroundColor = .clear
        button2.backgroundColor = .clear
        button3.backgroundColor = .clear
    }
}

