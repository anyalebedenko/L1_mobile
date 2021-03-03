//
//  ViewController.swift
//  Lebedenko_l1
//
//  Created by Anna Lebedenko on 02.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textBox_type: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    
    var list = ["1","2","3"]
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
            return 1
        }

        public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

            return list.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

            self.view.endEditing(true)
            return list[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            self.textBox_type.text = self.list[row]
            self.dropDown.isHidden = true
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {

            if textField == self.textBox_type {
                self.dropDown.isHidden = false
                //if you don't want the users to se the keyboard type:

                textField.endEditing(true)
            }
        
        }
}

