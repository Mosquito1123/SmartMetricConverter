//
//  SpeedViewController.swift
//  SmartMetricConverter
//
//  Created by Mosquito1123 on 22/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var tbInput1: UITextField!
    @IBOutlet weak var cmbxInput1: UIPickerView!
    @IBOutlet weak var cmbxInput2: UIPickerView!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblDisplay: UILabel!
    
    let arSpeedUnits = ["ft/s", "mph", "m/s", "km/h"]
    var m_pSpeedConverter = Converter(val: 1.0, unit1: "ft/s", unit2: "ft/s");
    
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
        return arSpeedUnits.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return arSpeedUnits[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let pSelected = arSpeedUnits[row];
        if (pickerView == cmbxInput1)
        {
            m_pSpeedConverter.UpdateUnits(newUnit: pSelected, toUpdate: 1);
        }
        else if (pickerView == cmbxInput2)
        {
            m_pSpeedConverter.UpdateUnits(newUnit: pSelected, toUpdate: 2);
        }
    }
    
    @IBAction func btnConvert_Click(_ sender: UIButton)
    {
        m_pSpeedConverter.UpdateValue(val: tbInput1.text!);
        lblDisplay.text = m_pSpeedConverter.Convert();
    }
}

