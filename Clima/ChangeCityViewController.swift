//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName (city : String)
    func userWantsPrecipitation(precipitationOn: Bool)
    //hello
}

class ChangeCityViewController: UIViewController {
    
    //Declare the delegate variable here:
    var delegate : ChangeCityDelegate?
    //variable we send to the other view controller
    var switchOnOff = true
    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!

    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        
        
        //1 Get the city name the user entered in the text field
        let cityName = changeCityTextField.text!
        
        //2 If we have a delegate set, call the method userEnteredANewCityName
        delegate?.userEnteredANewCityName(city: cityName)
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)
        delegate?.userWantsPrecipitation(precipitationOn: switchOnOff)
        
    }
    
    
    @IBAction func precipitationButton(_ sender: UISwitch) {
        if sender.isOn == true {
            switchOnOff = true
            
        } else {
            switchOnOff = false
        }
        
    }

    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    delegate?.userWantsPrecipitation(precipitationOn: switchOnOff)
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        switchOutlet.isOn = switchOnOff
    }
    
}

