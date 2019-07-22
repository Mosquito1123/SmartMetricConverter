//
//  Converter.swift
//  SmartMetricConverter
//
//  Created by Mosquito1123 on 22/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import Foundation

internal class Converter
{
    private var Value: Double;    private var Unit1: Units!
    private var Unit2: Units!
    
    private enum Units
    {
        case NaN
        case Inches
        case Feet
        case Yards
        case Miles
        case Millimeters
        case Centimeters
        case Meters
        case Kilometers
        case Ft_S
        case MPH
        case M_S
        case Km_H
        case Quart
        case Gallon
        case Ounce
        case Pound
        case Liter
        case Cubic_Meter
        case Gram
        case Kilogram
    }
    
    private enum ConversionType
    {
        case Invalid
        case Distance
        case Speed
        case Weight
        case Volume
    }
    
    public init(val: Double, unit1: String, unit2: String)
    {
        self.Value = val;
        self.Unit1 = getUnit(unitString: unit1);
        self.Unit2 = getUnit(unitString: unit2);
    }
    
    public func UpdateUnits(newUnit: String, toUpdate: Int)
    {
        if (toUpdate == 1)
        {
            self.Unit1 = getUnit(unitString: newUnit);
        }
        else if (toUpdate == 2)
        {
            self.Unit2 = getUnit(unitString: newUnit);
        }
    }
    
    public func UpdateValue(val: String)
    {
        self.Value = (val as NSString).doubleValue;
    }
    
    public func Convert() -> String!
    {
        let NaN = "NaN";
        var sReturn = NaN;
        let pConversionType1 = getConversionType(unit: Unit1);
        let pConversionType2 = getConversionType(unit: Unit2);
        if (pConversionType1 != pConversionType2)
        {
            return NaN;
        }
        
        switch (pConversionType1)
        {
        case ConversionType.Distance:
            switch (Unit1.unsafelyUnwrapped)
            {
            case Units.Inches:
                switch Unit2.unsafelyUnwrapped
                {
                // Inches to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value);
                // Inches to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value / 12);
                // Inches to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value / 36);
                // Inches to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value / 63360);
                // Inches to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value / 25.4);
                // Inches to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value / 254);
                // Inches to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value / 25400);
                // Inches to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value / 2540000);
                default:
                    return NaN;
                }
            case Units.Feet:
                switch Unit2.unsafelyUnwrapped
                {
                // Feet to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value * 12);
                // Feet to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value);
                // Feet to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value / 3);
                // Feet to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value / 5280);
                // Feet to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value * 304.8);
                // Feet to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value * 30.48);
                // Feet to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value / 3.281);
                // Feet to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value / 3180.84);
                default:
                    return NaN;
                }
            case Units.Yards:
                switch Unit2.unsafelyUnwrapped
                {
                // Yards to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value * 36);
                // Yards to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value * 3);
                // Yards to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value);
                // Yards to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value / 1760);
                // Yards to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value * 914.4);
                // Yards to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value * 91.44);
                // Yards to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value / 1.094);
                // Yards to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value / 1093.613);
                default:
                    return NaN;
                }
            case Units.Miles:
                switch Unit2.unsafelyUnwrapped
                {
                // Miles to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value * 63360);
                // Miles to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value * 5280);
                // Miles to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value * 1760);
                // Miles to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value);
                // Miles to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value * 1.609e+6);
                // Miles to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value * 160900);
                // Miles to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value * 1609);
                // Miles to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value * 1.609);
                default:
                    return NaN;
                }
            case Units.Millimeters:
                switch Unit2.unsafelyUnwrapped
                {
                // Millimeters to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value / 25.4);
                // Millimeters to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value / 304.8);
                // Millimeters to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value / 914.4);
                // Millimeters to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value / 1.609e+6);
                // mm to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value);
                // mm to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value / 10);
                // Millimeters to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value / 1000);
                // Millimeters to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value / 1e+6);
                default:
                    return NaN;
                }
            case Units.Centimeters:
                switch Unit2.unsafelyUnwrapped
                {
                // Centimeters to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value / 2.54);
                // Centimeters to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value / 30.48);
                // Centimeters to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value / 91.44);
                // Centimeters to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value / 160900);
                // Centimeters to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value * 10);
                // Centimeters to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value);
                // Centimeters to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value / 100);
                // Centimeters to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value / 1e+5);
                default:
                    return NaN;
                }
            case Units.Meters:
                switch Unit2.unsafelyUnwrapped
                {
                // Meters to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value * 39.37);
                // Meters to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value * 3.281);
                // Meters to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value * 1.094);
                // Meters to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value / 1609);
                // Meters to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value / 1000);
                // Meters to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value / 100);
                // Meters to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value);
                // Meters to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value / 1000);
                default:
                    return NaN;
                }
            case Units.Kilometers:
                switch Unit2.unsafelyUnwrapped
                {
                // Kilometers to Inches
                case Units.Inches:
                    sReturn = String(format: "%g", Value * 39370.1);
                // Kilometers to Feet
                case Units.Feet:
                    sReturn = String(format: "%g", Value * 3280.84);
                // Kilometers to Yards
                case Units.Yards:
                    sReturn = String(format: "%g", Value * 1093.613);
                // Kilometers to Miles
                case Units.Miles:
                    sReturn = String(format: "%g", Value * 1.609);
                // Kilometers to mm
                case Units.Millimeters:
                    sReturn = String(format: "%g", Value * 1e+6);
                // Kilometers to cm
                case Units.Centimeters:
                    sReturn = String(format: "%g", Value * 1e+5);
                // Kilometers to m
                case Units.Meters:
                    sReturn = String(format: "%g", Value * 1000);
                // Kilometers to Km
                case Units.Kilometers:
                    sReturn = String(format: "%g", Value);
                default:
                    return NaN;
                }
            case Units.Ft_S: fallthrough
            case Units.MPH: fallthrough
            case Units.M_S: fallthrough
            case Units.Km_H: fallthrough
            case Units.Quart: fallthrough
            case Units.Gallon: fallthrough
            case Units.Liter: fallthrough
            case Units.Cubic_Meter: fallthrough
            case Units.Ounce: fallthrough
            case Units.Pound: fallthrough
            case Units.Gram: fallthrough
            case Units.Kilogram: fallthrough
            default: sReturn = NaN;
            }
        case ConversionType.Speed:
            switch (Unit1.unsafelyUnwrapped)
            {
            case Units.Ft_S:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ft_S:
                    sReturn = String(format: "%g", Value);
                case Units.MPH:
                    sReturn = String(format: "%g", Value / 1.4667);
                case Units.M_S:
                    sReturn = String(format: "%g", Value / 3.281);
                case Units.Km_H:
                    sReturn = String(format: "%g", Value * 1.09728);
                default: sReturn = NaN;
                }
            case Units.MPH:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ft_S:
                    sReturn = String(format: "%g", Value * 1.4667);
                case Units.MPH:
                    sReturn = String(format: "%g", Value);
                case Units.M_S:
                    sReturn = String(format: "%g", Value / 2.237);
                case Units.Km_H:
                    sReturn = String(format: "%g", Value * 1.609);
                default: sReturn = NaN;
                }
            case Units.M_S:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ft_S:
                    sReturn = String(format: "%g", Value * 3.281);
                case Units.MPH:
                    sReturn = String(format: "%g", Value * 2.237);
                case Units.M_S:
                    sReturn = String(format: "%g", Value);
                case Units.Km_H:
                    sReturn = String(format: "%g", Value * 3.6);
                default: sReturn = NaN;
                }
            case Units.Km_H:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ft_S:
                    sReturn = String(format: "%g", Value / 1.09728);
                case Units.MPH:
                    sReturn = String(format: "%g", Value / 1.609);
                case Units.M_S:
                    sReturn = String(format: "%g", Value / 3.6);
                case Units.Km_H:
                    sReturn = String(format: "%g", Value);
                default: sReturn = NaN;
                }
            case Units.Inches: fallthrough
            case Units.Feet: fallthrough
            case Units.Yards: fallthrough
            case Units.Miles: fallthrough
            case Units.Millimeters: fallthrough
            case Units.Centimeters: fallthrough
            case Units.Meters: fallthrough
            case Units.Kilometers: fallthrough
            case Units.Quart: fallthrough
            case Units.Gallon: fallthrough
            case Units.Liter: fallthrough
            case Units.Cubic_Meter: fallthrough
            case Units.Ounce: fallthrough
            case Units.Pound: fallthrough
            case Units.Gram: fallthrough
            case Units.Kilogram: fallthrough
            default: sReturn = NaN;
            }
        case ConversionType.Volume:
            switch (Unit1.unsafelyUnwrapped)
            {
            case Units.Quart:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Quart:
                    sReturn = String(format: "%g", Value);
                case Units.Gallon:
                    sReturn = String(format: "%g", Value / 4);
                case Units.Liter:
                    sReturn = String(format: "%g", Value * 1.057);
                case Units.Cubic_Meter:
                    sReturn = String(format: "%g", Value / 1056.688);
                default: sReturn = NaN;
                }
            case Units.Gallon:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Quart:
                    sReturn = String(format: "%g", Value * 4);
                case Units.Gallon:
                    sReturn = String(format: "%g", Value);
                case Units.Liter:
                    sReturn = String(format: "%g", Value * 3.785);
                case Units.Cubic_Meter:
                    sReturn = String(format: "%g", Value / 264.172);
                default: sReturn = NaN;
                }
            case Units.Liter:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Quart:
                    sReturn = String(format: "%g", Value * 1.057);
                case Units.Gallon:
                    sReturn = String(format: "%g", Value / 3.785);
                case Units.Liter:
                    sReturn = String(format: "%g", Value);
                case Units.Cubic_Meter:
                    sReturn = String(format: "%g", Value / 1000);
                default: sReturn = NaN;
                }
            case Units.Cubic_Meter:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Quart:
                    sReturn = String(format: "%g", Value * 1056.688);
                case Units.Gallon:
                    sReturn = String(format: "%g", Value * 264.172);
                case Units.Liter:
                    sReturn = String(format: "%g", Value * 1000);
                case Units.Cubic_Meter:
                    sReturn = String(format: "%g", Value);
                default: sReturn = NaN;
                }
            case Units.Inches: fallthrough
            case Units.Feet: fallthrough
            case Units.Yards: fallthrough
            case Units.Miles: fallthrough
            case Units.Millimeters: fallthrough
            case Units.Centimeters: fallthrough
            case Units.Meters: fallthrough
            case Units.Kilometers: fallthrough
            case Units.Ft_S:fallthrough
            case Units.MPH: fallthrough
            case Units.M_S: fallthrough
            case Units.Km_H: fallthrough
            case Units.Ounce: fallthrough
            case Units.Pound: fallthrough
            case Units.Gram: fallthrough
            case Units.Kilogram: fallthrough
            default: sReturn = NaN;
            }
        case ConversionType.Weight:
            switch (Unit1.unsafelyUnwrapped)
            {
            case Units.Ounce:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ounce:
                    sReturn = String(format: "%g", Value);
                case Units.Pound:
                    sReturn = String(format: "%g", Value / 16);
                case Units.Gram:
                    sReturn = String(format: "%g", Value * 28.35);
                case Units.Kilogram:
                    sReturn = String(format: "%g", Value / 35.274);
                default: sReturn = NaN;
                }
            case Units.Pound:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ounce:
                    sReturn = String(format: "%g", Value * 16);
                case Units.Pound:
                    sReturn = String(format: "%g", Value);
                case Units.Gram:
                    sReturn = String(format: "%g", Value * 453.592);
                case Units.Kilogram:
                    sReturn = String(format: "%g", Value / 2.205);
                default: sReturn = NaN;
                }
            case Units.Gram:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ounce:
                    sReturn = String(format: "%g", Value / 28.35);
                case Units.Pound:
                    sReturn = String(format: "%g", Value / 453.592);
                case Units.Gram:
                    sReturn = String(format: "%g", Value);
                case Units.Kilogram:
                    sReturn = String(format: "%g", Value / 1000);
                default: sReturn = NaN;
                }
            case Units.Kilogram:
                switch (Unit2.unsafelyUnwrapped)
                {
                case Units.Ounce:
                    sReturn = String(format: "%g", Value * 35.274);
                case Units.Pound:
                    sReturn = String(format: "%g", Value * 2.205);
                case Units.Gram:
                    sReturn = String(format: "%g", Value * 1000);
                case Units.Kilogram:
                    sReturn = String(format: "%g", Value);
                default: sReturn = NaN;
                }
            case Units.Quart: fallthrough
            case Units.Gallon: fallthrough
            case Units.Liter: fallthrough
            case Units.Cubic_Meter: fallthrough
            case Units.Inches: fallthrough
            case Units.Feet: fallthrough
            case Units.Yards: fallthrough
            case Units.Miles: fallthrough
            case Units.Millimeters: fallthrough
            case Units.Centimeters: fallthrough
            case Units.Meters: fallthrough
            case Units.Kilometers: fallthrough
            case Units.Ft_S:fallthrough
            case Units.MPH: fallthrough
            case Units.M_S: fallthrough
            case Units.Km_H: fallthrough
            default: sReturn = NaN;
            }
        case ConversionType.Invalid: fallthrough
        default:
            sReturn = NaN;
        }
        return sReturn;
    }
    
    private func getUnit(unitString:String) ->Units
    {
        switch unitString
        {
        case "Inches":
            return Units.Inches;
        case "Feet":
            return Units.Feet;
        case "Yards":
            return Units.Yards;
        case "Miles":
            return Units.Miles;
        case "Millimeters":
            return Units.Millimeters;
        case "Centimeters":
            return Units.Centimeters;
        case "Meters":
            return Units.Meters;
        case "Kilometers":
            return Units.Kilometers;
        case "ft/s":
            return Units.Ft_S;
        case "mph":
            return Units.MPH;
        case "m/s":
            return Units.M_S;
        case "km/h":
            return Units.Km_H;
        case "Quart":
            return Units.Quart;
        case "Gallon":
            return Units.Gallon;
        case "Ounce":
            return Units.Ounce;
        case "Pound":
            return Units.Pound;
        case "Liter":
            return Units.Liter;
        case "Cubic Meter":
            return Units.Cubic_Meter;
        case "Gram":
            return Units.Gram;
        case "Kilogram":
            return Units.Kilogram;
        default:
            return Units.NaN;
        }
    }
    
    private func getConversionType(unit: Units) -> ConversionType
    {
        switch unit
        {
        case Units.Inches: fallthrough
        case Units.Feet: fallthrough
        case Units.Yards: fallthrough
        case Units.Miles: fallthrough
        case Units.Millimeters: fallthrough
        case Units.Centimeters: fallthrough
        case Units.Meters: fallthrough
        case Units.Kilometers:
            return ConversionType.Distance;
        case Units.Ft_S: fallthrough
        case Units.MPH: fallthrough
        case Units.M_S: fallthrough
        case Units.Km_H:
            return ConversionType.Speed;
        case Units.Quart: fallthrough
        case Units.Gallon: fallthrough
        case Units.Liter: fallthrough
        case Units.Cubic_Meter:
            return ConversionType.Volume;
        case Units.Ounce: fallthrough
        case Units.Pound: fallthrough
        case Units.Gram: fallthrough
        case Units.Kilogram:
            return ConversionType.Weight;
        default:
            return ConversionType.Invalid;
        }
    }
}
