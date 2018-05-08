//
//  CalculatorViewController.swift
//  Conversion Calculator
//
//  Created by Cameron Wandfluh on 4/12/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var calculate = Conversion()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is 0xCDFFFF
        //outputDisplay.backgroundColor = UIColor(red:0.74, green:1.00, blue:1.00, alpha:1.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Would like these to be cleaner but kinda ran out of time
    @IBAction func converstionTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: .default, handler: {
            (alertAction) -> Void in
            self.calculate.converter = self.calculate.converters[0]
            self.inputDisplay.placeholder = self.calculate.converters[0].inputUnit
            self.outputDisplay.placeholder = self.calculate.converters[0].outputUnit
            self.calculate.clearInput()
            self.updateDisplay()
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: .default, handler: {
            (alertAction) -> Void in
            self.calculate.converter = self.calculate.converters[1]
            self.inputDisplay.placeholder = self.calculate.converters[1].inputUnit
            self.outputDisplay.placeholder = self.calculate.converters[1].outputUnit
            self.calculate.clearInput()
            self.updateDisplay()
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: .default, handler: {
            (alertAction) -> Void in
            self.calculate.converter = self.calculate.converters[2]
            self.inputDisplay.placeholder = self.calculate.converters[2].inputUnit
            self.outputDisplay.placeholder = self.calculate.converters[2].outputUnit
            self.calculate.clearInput()
            self.updateDisplay()
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: .default, handler: {
            (alertAction) -> Void in
            self.calculate.converter = self.calculate.converters[3]
            self.inputDisplay.placeholder = self.calculate.converters[3].inputUnit
            self.outputDisplay.placeholder = self.calculate.converters[3].outputUnit
            self.calculate.clearInput()
            self.updateDisplay()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func valueButtonPress(_ sender: UIButton) {
        calculate.newInput(input: (sender.titleLabel?.text)!)
        updateDisplay()
    }
    
    @IBAction func clearInput(_ sender: Any) {
        calculate.clearInput()
        updateDisplay()
    }
    
    @IBAction func negateInput(_ sender: Any) {
        calculate.negateInput()
        updateDisplay()
    }
    
    func updateDisplay(){
        outputDisplay.text = calculate.outputDisplay
        inputDisplay.text = calculate.inputDisplay
    }
}
