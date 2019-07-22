//
//  DistanceViewController.swift
//  SmartMetricConverter
//
//  Created by Mosquito1123 on 22/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var tbInput1: UITextField!
    @IBOutlet weak var cmbxInput1: UIPickerView!
    @IBOutlet weak var cmbxInput2: UIPickerView!
    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    
    let arDistanceUnits = ["Inches", "Feet", "Yards", "Miles", "Millimeters", "Centimeters", "Meters", "Kilometers"]
    var m_pDistConverter = Converter(val: 1.0, unit1: "Inches", unit2: "Inches");
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        return arDistanceUnits.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return arDistanceUnits[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let pSelected = arDistanceUnits[row];
        if (pickerView == cmbxInput1)
        {
            m_pDistConverter.UpdateUnits(newUnit: pSelected, toUpdate: 1);
        }
        else if (pickerView == cmbxInput2)
        {
            m_pDistConverter.UpdateUnits(newUnit: pSelected, toUpdate: 2);
        }
    }
    
    @IBAction func btnConvert(_ sender: UIButton)
    {
        m_pDistConverter.UpdateValue(val: tbInput1.text!);
        lblDisplay.text = m_pDistConverter.Convert();
    }
}

