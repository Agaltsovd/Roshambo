//
//  ViewController.swift
//  Roshambo
//
//  Created by Daniyar Agaltsov on 6/18/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor=UIColor.white
    }
    func randomPlay()->String{
        let random = 1+arc4random()%3
        switch random {
        case 1:
            return "paper"
        case 2:
            return "scissors"
        case 3:
            return "rock"
        default:
            return ""
        }
        
    }
    func compare( user: String,  opponent:String)->Array<String>{
        if(user=="paper"){
            if(opponent=="paper"){
                return ["Tie", "itsATie"]
            }
            else if(opponent=="scissors"){
                return ["Scissors cut paper.You lose...","ScissorsCutPaper"]
            }
            else if(opponent=="rock"){
                return ["Paper covers rock. You win!","PaperCoversRock"]
            }
            
        }
        else if(user=="scissors"){
                   if(opponent=="paper"){
                       return ["Scissors cut paper.You win!","ScissorsCutPaper"]
                   }
                   else if(opponent=="scissors"){
                    return ["Tie","itsATie"]
                   }
                   else if(opponent=="rock"){
                       return ["Rock crushes scissors. You lose...","RockCrushesScissors"]
                   }
                   
               }
        else if(user=="rock"){
            if(opponent=="paper"){
                return ["Paper covers rock. You lose...","PaperCoversRock"]
            }
            else if(opponent=="scissors"){
                return ["Rock crushes scissors. You win!","RockCrushesScissors"]
            }
            else if(opponent=="rock"){
                return ["Tie","itsATie"]
            }
            
        }
        return ["",""]
    }
    @IBAction func rockButton(){
        let str = "rock"
        let oppPlay = randomPlay()
        let final: String?
        let result = compare(user: str, opponent: oppPlay)
        final = result.first
        let imageString = result[1]
        
        var nextController:SecondViewController
        nextController = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        if let final=final{
            nextController.text = final
        }
        
        nextController.imageString = imageString
        
        present(nextController, animated: true, completion: nil)
        
    }
    @IBAction func paperButton(){
        performSegue(withIdentifier: "paper", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="scissors"{
             let userMove = "scissors"
                    let opponentMove = randomPlay()
                    let result = compare(user: userMove, opponent: opponentMove)
            
                    let textString = result[0]
                    let imageString = result[1]
                    
            let destination = segue.destination as! SecondViewController
            destination.text = textString
            destination.imageString = imageString
        }
        else if segue.identifier=="paper"{
            let userMove = "paper"
                    let opponentMove = randomPlay()
                    let result = compare(user: userMove, opponent: opponentMove)
            
                    let textString = result[0]
                    let imageString = result[1]
                    
            let destination = segue.destination as! SecondViewController
            destination.text = textString
            destination.imageString = imageString
        }
        
    }
    

}

