//
//  ViewController.swift
//  Multiples
//
//  Created by Anthony Whitaker on 7/13/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var numberEntryText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var addend: Int = 0
    var previousMultiple: Int = 0
    let defaultOuputText = "Press Add to add!"
    let maxMultipleCount = 2
    var multipleCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapper = UITapGestureRecognizer(target: view, action:#selector(UIView.endEditing))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
    }
    
    func toggleView(showMainScreen: Bool){
        logo.hidden = !showMainScreen
        numberEntryText.hidden = !showMainScreen
        playButton.hidden = !showMainScreen
        
        outputLabel.hidden = showMainScreen
        addButton.hidden = showMainScreen
    }
    
    @IBAction func onPlayPressed(sender: UIButton) {
        if(numberValidation()){
            addend = Int(numberEntryText.text!)!
            toggleView(false)
        }
    }
    
    func numberValidation() -> Bool{
        return numberEntryText != nil && numberEntryText.text != "" && Int(numberEntryText.text!) != nil
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        if(multipleCount >= maxMultipleCount){
            restart()
        }
        else {
            outputLabel.text = "\(previousMultiple) + \(addend) = \(previousMultiple + addend)"
            previousMultiple += addend
            multipleCount+=1
        }
    }
    
    func restart(){
        toggleView(true)
        addend = 0
        previousMultiple = 0
        outputLabel.text = defaultOuputText
        multipleCount = 0
        numberEntryText.text = ""
    }

}

