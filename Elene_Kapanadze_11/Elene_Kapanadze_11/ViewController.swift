//
//  ViewController.swift
//  Elene_Kapanadze_11
//
//  Created by Ellen_Kapii on 30.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    // Labels
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    // Slider
    @IBOutlet weak var slider: UISlider!
    
    // Range Labels
    @IBOutlet weak var leftRangeLabel: UILabel!
    @IBOutlet weak var rightRangeLable: UILabel!
    
    //TextField
    @IBOutlet weak var desiredAction: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftRangeLabel.text = "\(Int(slider.minimumValue))"
        rightRangeLable.text = "\(Int(slider.maximumValue))"
    }
    
    enum Action: String {
        case maximum, sum, average
    }
    
    func getLabelText(_ label: UILabel, _ slider: UISlider) {
        label.text = "\(Int(Float.random(in: 0...slider.value).rounded()))"
    }
    
    func labelTextToInt(_ label: UILabel) -> Int? {
        if let number = Int(label.text!) { return number }
        return nil
    }
    
    
    // 1
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        getLabelText(firstLabel, sender)
        getLabelText(secondLabel, sender)
        getLabelText(thirdLabel, sender)
    }
    
    // 2
    @IBAction func enterTapped(_ sender: UIButton) {
        let number1 = labelTextToInt(firstLabel)
        let number2 = labelTextToInt(secondLabel)
        let number3 = labelTextToInt(thirdLabel)
        
        if number1 != nil && number2 != nil && number3 != nil {
            desiredAction.getResult(label: resultLabel, number1: number1!, number2: number2!, number3: number3!)
        } else {
            desiredAction.moveSlider(label: resultLabel)
        }
    }
}

extension UITextField {
    enum Action: String {
        case maximum, sum, average
    }
    func getResult(label: UILabel, number1: Int, number2: Int, number3: Int) {
        switch self.text {
        case Action.maximum.rawValue:
            label.text = "\(max(number1, number2, number3))"
        case Action.sum.rawValue:
            label.text = "\(number1 + number2 + number3)"
        case Action.average.rawValue:
            label.text = "\((number1 + number2 + number3) / 3)"
        default:
            label.text = "Incorrect Action"
        }
    }
    func moveSlider(label: UILabel) {
        label.text = "Move The Slider"
    }
}


