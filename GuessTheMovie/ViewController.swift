//
//  ViewController.swift
//  CompleteTheMovieTitle
//
//  Created by Osama Gamal on 25/05/2021.
//

import UIKit
import Kingfisher
class ViewController: UIViewController{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet var answersButtons: [UIButton]!
    lazy var netWorkManager = Networkmanager()
    var moviesArray = [Movie]()
    var rightAnswer = ""
    var apiService :ApiServices!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleLabel.text = "The Wolf Of ...."
        movieImageView.image = UIImage(named: "the-wolf-of-wallstreet.jpg")
        activityIndicator.startAnimating()
        apiService = netWorkManager
        fetchData()
        
    }
  

    
    func fetchData() {
        
        
        apiService.get(request:Urls().url) {[weak self] Result in
            switch(Result){
            
            case .success(let data):
                do{
                    self?.moviesArray = try JSONDecoder().decode([Movie].self, from: data)
                    print(self?.moviesArray)
                    
                    DispatchQueue.main.async {
                        self?.updateUi()
                    }
                    
                }
                catch(let error){
                    
                    print(error)
                }
                
                
            case .failure(let error):
                
                print(error)
            }
        }
        
    }
    
    
    func updateUi(){
        
        activityIndicator.stopAnimating()
        let randomMovie = moviesArray.randomElement()
//        let sepratedWordsArray = randomMovie?.name.components(separatedBy: " ").randomElement()
        
        
        if let movieTitle  =  randomMovie?.name.components(separatedBy: " ").dropLast().joined(separator: " "){
            movieTitleLabel.text = "\(movieTitle) ......"
        }
        
        if let movieImage = randomMovie?.image{
            
            movieImageView.image = UIImage(named: movieImage)
            
        }
        
        
        
        
        var answers = randomMovie!.wrongAnswers
        rightAnswer = splitMovieName(name: randomMovie!.name)
        answers.append(rightAnswer)
        let firstRandomIndex = Int.random(in: 0..<answers.count)
        let seconRandomIndex = Int.random(in: 0..<answers.count)
        answers = rearrange(array: answers, fromIndex: firstRandomIndex, toIndex: seconRandomIndex)
        
        var index = 0
        for button in answersButtons{
            if (index >= answers.count){
                break
            }
            button.setTitle("\(answers[index])", for: .normal)
            button.addTarget(self, action: #selector(buttonPreesed), for: .touchUpInside)
            
            index += 1
            
        }
        
    }
    
    
    
    @objc  func buttonPreesed(sender:UIButton){
        
        
        if let buttonTitle = sender.title(for: .normal) {
            
            if (buttonTitle.lowercased() == rightAnswer.lowercased()){
                
                CustomAlert.showSimpleAlert(title: "congratulations", message: "Right Answer", viewRef: self)
                
                
                
            }
            else{
                
                CustomAlert.showSimpleAlert(title: "Try Agin", message: "Wrong Answer", viewRef: self)
                
            }
            
            
        }
        
        
    }
    
   
}

extension ViewController{
    
    
}
