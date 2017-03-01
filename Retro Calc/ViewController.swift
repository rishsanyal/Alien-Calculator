//
//  ViewController.swift
//  Retro Calc
//
//  Created by Rishab Sanyal on 12/27/16.
//  Copyright © 2016 Rishab Sanyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Subtract = "-"
        case Add = "+"
        case Multiply = "*"
        case Empty = "Empty"
    }
    @IBOutlet weak var outputLbl: UILabel!
    var runningNumber = ""
    var currentOperation = Operation.Empty
    var leftValString = ""
    var rightValString = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func numberPressed(_ sender: UIButton){
        runningNumber += "\(sender.tag)" //this appends the number pressed as a string onto the running number
        outputLbl.text = runningNumber //this displays the running number onto the output label
    }
    
    @IBAction func onDividePressed(sender: AnyObject){
        processOperation(operation: .Divide)
    }
    @IBAction func onAddPressed(sender: AnyObject){
        processOperation(operation: .Add)
    }
    @IBAction func onSubtractPressed(sender: AnyObject){
        processOperation(operation: .Subtract)
    }
    @IBAction func onMultiplyPressed(sender: AnyObject){
        processOperation(operation: .Multiply)
    }
    @IBAction func onEqualPressed(sender: AnyObject){
        processOperation(operation: currentOperation)
    }
    
    func processOperation(operation: Operation){
        if currentOperation != Operation.Empty{
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                   result = "\(Double(leftValString)! * Double(rightValString)!)"
                }
                else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                }
                else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                }
                else if currentOperation == Operation.Add{
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }
                
                leftValString = result
                outputLbl.text = result
            }
        currentOperation = operation
        }
        else {
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

