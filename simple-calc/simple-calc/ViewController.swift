//
//  ViewController.swift
//  simple-calc-2
//
//  Created by MAIN on 10.21.16.
//  Copyright © 2016 University of Washington. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var results: UILabel!
    
    var inputNum: Int = 0
    var inputOp: String = "="
    var calculation: Int = 0
    var sum: Int = 0
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numPress(_ sender: UIButton) {
        inputNum = inputNum * 10 + Int(sender.titleLabel!.text!)!
        results.text = String(inputNum)
    }

    @IBAction func opPress(_ sender: UIButton) {
        count += 1
        sum += inputNum
        let newOp = sender.titleLabel!.text!
        switch inputOp {
        case "+", "avg":
            calculation += inputNum
        case "-":
            calculation -= inputNum
        case "x":
            calculation *= inputNum
        case "/":
            calculation /= inputNum
        case "%":
            calculation = calculation % inputNum
        case "=", "count":
            calculation = inputNum
        default:
            break
        }
        
        if newOp == "="{
            if inputOp == "count" {
                calculation = count
            } else if inputOp == "avg" {
                calculation = sum / count
            }
        }
        
        if newOp == "fact" {
            calculation = 1
            var temp = inputNum
            while temp >= 2{
                calculation = calculation * temp
                temp -= 1
            }
        }
        
        inputNum = 0
        results.text = String(calculation)
        
        if newOp == "=" || newOp == "fact" {
            calculation = 0
            count = 0
            sum = 0
        }
        
        inputOp = newOp
    }
}

