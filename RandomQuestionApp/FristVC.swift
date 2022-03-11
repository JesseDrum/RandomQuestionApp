//
//  FristVC.swift
//  RandomQuestionApp
//
//  Created by Drum, Jesse on 2/16/22.
//
import EasyConfetti
import UIKit
import SDWebImage

class FristVC: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageButtonPressed(_ sender: Any) {
        myImageView.image = UIImage(systemName: "scribble")
    
//        myImageView.sd_setImage(with: URL(), completed: nill)
        myImageView.sd_setImage(with: URL(string: "https://ichef.bbci.co.uk/news/976/cpsprodpb/8e8e/live/d99443c0-0a40-11ec-bef9-bdacb8ced4ac.jpg"), completed: nil)
        
//        imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    @IBAction func confettiButtonTaped(_ sender: Any) {
        // Create the view
        let confettiView = ConfettiView()
        view.addSubview(confettiView)
        view.sendSubviewToBack(confettiView)
//        confettiView.center = view.center
        confettiView.didMoveToSuperview()
        
        // Configure
        confettiView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)
        
//        confettiView.config.particle = .confetti(allowedShapes: [.circle])
        
        // Start
        confettiView.start()
        
        
        
        // Stop
     //   confettiView.stop()
    
   
    
    }
    
    
   
}
