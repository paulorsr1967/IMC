//
//  ViewController.swift
//  IMC
//
//  Created by Paulo on 28/12/19.
//  Copyright © 2019 Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var viresult: UIView!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
//            imc = weight / (height * height)
            imc = weight / pow(height, 2)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                    result = "Magreza"
                    image = "abaixo"
            case 16..<18.5:
                    result = "Abaixo do Peso"
                    image = "abaixo"
            case 18.5..<25:
                    result = "Peso Ideal"
                    image = "ideal"
            case 25..<30:
                    result = "Sobrepeso"
                    image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbResult.text = "\(Int(imc)) : \(result)"
        ivResult.image = UIImage(named: image)
        viresult.isHidden = false
        view.endEditing(true)
    }
}

