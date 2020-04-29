//
//  ViewController.swift
//  Project01
//
//  Created by 19swu02 on 2020/04/29.
//  Copyright © 2020 19swu02. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var wordTField: UITextField!
    @IBOutlet weak var koreanTField: UITextField!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var word2: UILabel!
    @IBOutlet weak var menuPicker: UIPickerView!
    
    typealias wordTuple = (English:String?, Korean:String?)
     var WordList:[wordTuple] = [];
    
    let menuArray:[String]=["연습", "실전", "뜻보고 영어쓰기"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameView" {
            let destVC = segue.destination as! GameViewController
            let type: String! = menuArray[self.menuPicker.selectedRow(inComponent: 0)]
            let wordArray:[wordTuple] = WordList
            destVC.gameType = type
            destVC.wordList = wordArray
        }
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menuArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menuArray[row]
    }
    

    
    @IBAction func addWord() {
        if(wordTField != nil && koreanTField != nil){
            WordList.append((wordTField.text, koreanTField.text))
                word.text = ""
                word2.text = ""
                if WordList.count > 6 {
                        for i in 0...5{
                        word.text! += "\(i+1)"
                                word.text! += ")"
                                if let w = WordList[i].English{
                                    word.text! += w
                                }
                        
                                word.text! += " "
                                if let w = WordList[i].Korean{
                                    word.text! += w
                                }
                                word.text! += "\n"
                        }
                        for i in 6...WordList.count-1{
                        word2.text! += "\(i+1)"
                                word2.text! += ")"
                                if let w = WordList[i].English{
                                    word2.text! += w
                                }
                        
                                word2.text! += " "
                                if let w = WordList[i].Korean{
                                    word2.text! += w
                                }
                                word2.text! += "\n"
                        }
                    }
                    else{
                        for i in 0...WordList.count-1{
                        word.text! += "\(i+1)"
                                word.text! += ")"
                                if let w = WordList[i].English{
                                    word.text! += w
                                }
                        
                                word.text! += " "
                                if let w = WordList[i].Korean{
                                    word.text! += w
                                }
                                word.text! += "\n"
                        }
                    }
            }
        wordTField.text = ""
        koreanTField.text = ""
        }
        
        
    }
    


