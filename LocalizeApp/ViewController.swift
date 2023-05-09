//
//  ViewController.swift
//  LocalizeApp
//
//  Created by mayank ranka on 09/05/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var textLanguage: UITextField!
    @IBOutlet weak var labelTwo: UILabel!
    var picker : UIPickerView!
    var languages = [("English","English"),("Hindi","Hindi")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPicker()
    }
    
    func loadPicker(){
        picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 150))
        picker.backgroundColor = .systemGray
        picker.delegate = self
        picker.dataSource = self
        textLanguage.inputView = self.picker
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.languages[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textLanguage.resignFirstResponder()
        self.textLanguage.text = self.languages[row].1
    }

    @IBAction func segControl(_ sender: Any) {
        if seg.selectedSegmentIndex == 0{
            labelOne.text = "FirstNameKey".localisedString(loc: "en")
            labelTwo.text = "LastNameKey".localisedString(loc: "en")
        }else{
            labelOne.text = "FirstNameKey".localisedString(loc: "hi")
            labelTwo.text = "LastNameKey".localisedString(loc: "hi")
        }
        
    }
    
}

extension String{
    func localisedString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil ,bundle: bundle!, value: "" , comment: "")
    }
}

