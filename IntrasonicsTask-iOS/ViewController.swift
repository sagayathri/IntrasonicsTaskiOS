//
//  ViewController.swift
//  IntrasonicsTask-iOS
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numberListTF: UITextField!
    @IBOutlet var sortedListLabel: UILabel!
    @IBOutlet var meanLabel: UILabel!
    @IBOutlet weak var medianLabel: UILabel!
    
    var rawNumberList = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberListTF.delegate = self
        
    }
    
    @IBAction func btnCalculateTapped(_ sender: UIButton) {
        calculateMeanMedian()
        numberListTF.resignFirstResponder()
    }
    
    @IBAction func btnClearTapped(_ sender: UIButton) {
        clearAll()
    }
    
    //Calculates Mean and Median
    func calculateMeanMedian() {
        rawNumberList = numberListTF.text!
        let sortedList = sortNumbers()
        var mean = 0, median = 0, sum = 0;
        var finalListString: String = ""

        //Finds the number of items in the list
        let listCount = sortedList.count
        
        if listCount != 0 {
            //Calculates Mean
            for i in 0 ..< listCount {
                sum += sortedList[i]
            }
            mean = sum/listCount;

            //Checks if the listCount is even or odd
            if (listCount%2 == 0) {
                //Even
                median = (sortedList[(listCount/2) - 1] + sortedList[listCount/2] ) / 2;
            }
            else {
                //Odd
                median = sortedList[listCount/2];
            }

            //Convert back sortedList to string
            for item in sortedList {
                finalListString.append(String(item));
                if item != sortedList[sortedList.count - 1] {
                    finalListString.append(", ")
                }
            }
            
            numberListTF.text = ""
            
            sortedListLabel.textColor = .label
            sortedListLabel.text = finalListString
            
            meanLabel.textColor = .label
            meanLabel.text = String(mean)
            
            medianLabel.textColor = .label
            medianLabel.text = String(median)
            
        }
        else {
            sortedListLabel.text = "Invalid input"
            meanLabel.text = "0"
            meanLabel.text = "0"
        }
    }
    
    //Returns sorted array list
    func sortNumbers() -> [Int] {
        //Split given numbers separated by comma
        let numbersString = rawNumberList
        let numbersStringArray = numbersString.components(separatedBy: [" ", ","])
        
        //Convert string numbers into an array of Integer
        var numbersListInteger: [Int] = []
        for item in numbersStringArray {
            if isNumeric(str: item) {
                let number = Int(item)
                if let numberNotNull = number {
                    numbersListInteger.append(numberNotNull)
                }
            }
        }
        
        //Sort numbers in ascending order
        numbersListInteger.sort()
        
        return numbersListInteger
    }
    
    //Clears all the text field
    func clearAll() {
        numberListTF.text = ""
        
        sortedListLabel.textColor = .lightGray
        sortedListLabel.text = "0"
        
        meanLabel.textColor = .lightGray
        meanLabel.text = "0"
        
        medianLabel.textColor = .lightGray
        medianLabel.text = "0"
    }
    
    func isNumeric(str: String) -> Bool {
        return Int(str) != nil
    }
}

