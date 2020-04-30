//
//  ViewController.swift
//  Chapter 15
//
//  Created by Brad D. Messner on 3/20/18.
//  Copyright © 2018 Brad D. Messner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var drinkPref: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var results: UITextView?
    

    
    
    
    
    
    
    
    
    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String = "\(firstName.text!),\(lastName.text!),\(drinkPref.text!),\(age.text!)\n"
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
                                                            //bmessner_results.csv
        
        
        
        // Ended Class 2 here Wed
        if !FileManager.default.fileExists(atPath: resultsFile) {
            FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
        }
        
        let fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        firstName.text = ""
        lastName.text = ""
        drinkPref.text = ""
        age.text = ""
    }
    
    
    
    
    
    
    
    
    
    @IBAction func displayResults(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let docDir:String=paths[0] as String
        
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        
        
        
        if FileManager.default.fileExists(atPath: resultsFile) {
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            
            
            results?.text=resultsData
        }
        else
        {
            // file does not exist
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

