//
//  SecondViewController.swift
//  Roshambo
//
//  Created by Daniyar Agaltsov on 6/18/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {


    
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
      
    var text: String?
    var imageString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let text = self.text{
            result.text = text
        }
        if let imageString = self.imageString{
            ImageView.image = UIImage(named: imageString)
        }
        
    }
    @IBOutlet var result:UILabel!
    @IBAction func playAgain(){
        dismiss(animated: true, completion: nil)
    }

  


}
