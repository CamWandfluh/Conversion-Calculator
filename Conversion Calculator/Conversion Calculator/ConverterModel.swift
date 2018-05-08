//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Cameron Wandfluh on 4/12/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import Foundation

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
}

class Conversion {
    var converter: Converter
    var inputString: String
    var inputDisplay: String
    var outputDisplay: String
    var inputValue: Double
    var outputValue: Double
    
    let converters: [Converter] =
    [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
    Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
    Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
    Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    
    init() {
        self.converter = converters[0]
        self.inputString = ""
        self.outputDisplay = ""
        self.inputDisplay = ""
        self.inputValue = 0.0
        self.outputValue = 0.0
        
    }
    
    func convertUnit(input: Double) -> Double
    {
        switch (converter.label) {
            
        case "fahrenheit to celcius":
            return (input - 32) / 1.8
        case "celcius to fahrenheit":
            return (input * 1.8) / 32
        case "miles to kilometers":
            return input * 1.609344
        case "kilometers to miles":
            return input * 0.62137
        default:
            return input
        }
    }
    
    func newInput(input: String) {
        if(input == "."){
            appendDecimal()
            return
        }
        if(input == "0" && inputString == "0"){
            return
        }
        
        inputString = inputString + input
        inputValue = inputNum()
        outputValue = convertUnit(input: inputValue)
        
        inputDisplay = inputString + converter.inputUnit
        outputDisplay = "\(outputValue)" + converter.outputUnit
        
    }
    
    func appendDecimal() {
        guard !inputString.contains(".") else { return }
        
        if inputString.isEmpty {
            inputString += "0."
        } else {
            inputString += "."
        }
        inputDisplay = inputString + converter.inputUnit
    }
    
    func inputNum() -> Double {
        return Double(inputString) ?? 0.0
    }
    
    func negateInput(){
        inputValue = -1 * inputValue
        inputString = String(inputValue)
        
        outputValue = convertUnit(input: inputValue)
        inputDisplay = inputString + converter.inputUnit
        outputDisplay = "\(outputValue)" + converter.outputUnit
    }
    
    func clearInput() {
        inputDisplay = ""
        inputString = ""
        outputDisplay = ""
        outputValue = 0.0
        inputValue = 0.0
    }
    
}
