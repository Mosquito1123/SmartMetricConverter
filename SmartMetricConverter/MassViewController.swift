//
//  MassViewController.swift
//  SmartMetricConverter
//
//  Created by Mosquito1123 on 22/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import Foundation
import UIKit

class MassViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var tbInput1: UITextField!
    @IBOutlet weak var cmbxInput1: UIPickerView!
    @IBOutlet weak var cmbxInput2: UIPickerView!
    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    
    let arMassUnits = ["Quart", "Gallon", "Ounce", "Pound", "Liter", "Cubic Meter", "Gram", "Kilogram"]
    var m_pMassConverter = Converter(val: 1.0, unit1: "Quart", unit2: "Quart");
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        tbInput1.text = "1";
        tbInput1.layer.borderColor = UIColor.black.cgColor;
        tbInput1.layer.borderWidth = 1;
        cmbxInput1.layer.borderColor = UIColor.black.cgColor;
        cmbxInput1.layer.borderWidth = 1;
        cmbxInput2.layer.borderColor = UIColor.black.cgColor;
        cmbxInput2.layer.borderWidth = 1;
        lblDisplay.layer.borderColor = UIColor.black.cgColor;
        lblDisplay.layer.borderWidth = 1;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return arMassUnits.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return arMassUnits[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let pSelected = arMassUnits[row];
        if (pickerView == cmbxInput1)
        {
            m_pMassConverter.UpdateUnits(newUnit: pSelected, toUpdate: 1);
        }
        else if (pickerView == cmbxInput2)
        {
            m_pMassConverter.UpdateUnits(newUnit: pSelected, toUpdate: 2);
        }
    }
    
    @IBAction func btnConvert_Click(_ sender: UIButton)
    {
        m_pMassConverter.UpdateValue(val: tbInput1.text!);
        lblDisplay.text = m_pMassConverter.Convert();
    }
}
