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
    
    var converters = [Conversion(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                      Conversion(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                      Conversion(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                      Conversion(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is 0xCDFFFF
        //outputDisplay.backgroundColor = UIColor(red:0.74, green:1.00, blue:1.00, alpha:1.0)
        outputDisplay.text = converters[0].outputUnit
        inputDisplay.text = converters[0].inputUnit

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converstionTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: .default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converters[0].outputUnit
            self.inputDisplay.text = self.converters[0].inputUnit
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: .default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converters[1].outputUnit
            self.inputDisplay.text = self.converters[1].inputUnit
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: .default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converters[2].outputUnit
            self.inputDisplay.text = self.converters[2].inputUnit
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: .default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converters[3].outputUnit
            self.inputDisplay.text = self.converters[3].inputUnit
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
