//
//  ViewController.swift
//  RandomQuestionApp
//
//  Created by Drum, Jesse on 2/7/22.
//
import EasyConfetti
import UIKit
import SDWebImage

class ViewController: UIViewController {

//    let question = ["Person in the picture below?", "Most follower on IG", "First Harry Potter movie?", "Sovle the Equation", "Planet that shown below?", "Best Coder Of All Time?"]
    
    @IBOutlet weak var myLable: UILabel!
    
    @IBOutlet weak var WQuestionLable: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var d: UIButton!
    
    let questionpic = ["thaif", "igp", "leonardo", "math", "harry", "titan2", "coding"]
    var loadQuestion = 0
    var wrongQuestion = [String]()

    

    var questions: [Question] = [
    Question(question: "What is country show below?",
             options: ["Thailand","Taiwan","Hongkong","Costa Rica"],
             correct: 0),
    Question(question: "Who has the most follower on IG?",
             options: ["Selena Gomez","Justin Bieber","Ronaldo","Kylie Jenner"],
             correct: 2),
    Question(question: "Who is the person in the picter below?", options: ["Christopher Walter","Nikola Tesla","Monalisa","Leonardo Da Vinci"], correct: 3),
    Question(question: "Slove the problem", options: ["6","9","0","1"], correct: 1),
    Question(question: "When was the first Harry Potter movies?", options: ["2000","2001","2002","2003"], correct: 2),
    Question(question: "What planet is this?", options: ["Jupiter","Neptune","Pluto","Titan"], correct: 3),
    Question(question: "Who is the best coder?", options: ["Chad Hurley","Bill Gates","Mark Zuckerberg","Christopher Walter"], correct: 3)
]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    var i = 0
    @IBOutlet weak var QLable: UILabel!
    @IBOutlet weak var QView: UIImageView!
    

 
    
    
    @IBAction func answer1(_ sender: Any) {
        changePic()
        checkAnswer(idx: 0)
        print("game over count\(gameOverCount) question cont\(questions.count)")
    }
    
    @IBAction func answer2(_ sender: Any) {
        changePic()
        checkAnswer(idx: 1)
    }
    
    @IBAction func answer3(_ sender: Any) {
        changePic()
        checkAnswer(idx: 2)
    }
    
    @IBAction func answer4(_ sender: Any) {
        changePic()
        checkAnswer(idx: 3)
    }
    
    
    var questionPos = 0
    var newQuestion: Question?
    var gameOverCount = 0
    
    func loadNewQuestion()
    {
        if questionPos + 1 < questions.count
        {
            questionPos += 1
            newQuestion = questions[questionPos]
            setQuestion()
            
        }
       
    }

    func setQuestion()
    {
        myLable.text = newQuestion?.question
    a.setTitle(newQuestion?.options[0], for: .normal)
    b.setTitle(newQuestion?.options[1], for: .normal)
    c.setTitle(newQuestion?.options[2], for: .normal)
    d.setTitle(newQuestion?.options[3], for: .normal)
        scoreText.text = "\(questionPos + 1) / \(questions.count)"
    }

    
   
    var rightAns = 0
    func checkAnswer(idx: Int)
    {
        if(idx == questions[questionPos].correct)
        {
            rightAns += 1
        }
        loadNewQuestion()
//        let total = questions.count
        print("right answer\(rightAns)")
        
        
        
        let countAns:Double = Double(rightAns)/Double(questions.count) * 100
        if gameOverCount == questions.count
        {
            self.a.removeFromSuperview()
            self.b.removeFromSuperview()
            self.c.removeFromSuperview()
            self.d.removeFromSuperview()
            self.QView.removeFromSuperview()
               print("score \(countAns)")
            
            
//            if(idx != questions[questionPos].correct)
//            {
//                wrongQuestion.append("Incorrect question: \(questionPos) \nRight Answer \(    questions[questions[questionPos].correct].options)")
//                
//            
//                
//                WQuestionLable.text = "\(wrongQuestion)"
//            }
            
            
        }
        
        if gameOverCount >= questions.count && (countAns > 80)
        {
            myLable.text = "    Congrat!!! You got \(rightAns)/\(questions.count)"
            gameAlert()
            gameOver()
            view.backgroundColor = UIColor.systemGreen
        }
        else if gameOverCount >= questions.count && (countAns > 60)
        {
            myLable.text = "\n\n\nNot bad but you can do better You got \(rightAns)/\(questions.count)"
            view.backgroundColor = UIColor.systemPink

        }
        else if gameOverCount >= questions.count && (countAns < 50)
        {
            myLable.text = "You got \(rightAns)/\(questions.count)........"
            view.backgroundColor = UIColor.systemRed

        }
        
        
   
        print("\(wrongQuestion)")
    }
    
    func changePic()
    {
       gameOverCount += 1
        if i+1 < questionpic.count
        {
            i += 1
            QView.image = UIImage(named: questionpic[i])

        }
        else{
            i = 0
        }

    }
    
    func gameAlert()
    {
        let alert = UIAlertController(title: "Correct", message: "You Got It Right!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))

        self.present(alert, animated: true)
  
    }

    func gameOver()
    {
        let confettiView = ConfettiView()
        view.addSubview(confettiView)
        confettiView.didMoveToSuperview()
        confettiView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)
        confettiView.start()
        
    }
    
   
    
    
}

