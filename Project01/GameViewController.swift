//
//  GameViewController.swift
//  Project01
//
//  Created by 19swu02 on 2020/04/29.
//  Copyright © 2020 19swu02. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var koreanLabel: UILabel!
    @IBOutlet weak var answerTField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    typealias wordTuple = (English:String?, Korean:String?)
    var gameType: String = ""
    var wordList:[wordTuple] = []
    var numR: Int = 0
    var correct: Int = 0
    var wrong: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.text = gameType
        numR = Int(arc4random_uniform(UInt32(wordList.count)))
        if gameType == "뜻보고 영어쓰기"{
            wordLabel.text =  wordList[numR].Korean
        }
        else{
        wordLabel.text =  wordList[numR].English
        }
        
    
        nextButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecordView" {
            let destVC = segue.destination as! RecordViewController
            let correctNum: Int = correct
            let wrongNum: Int = wrong
            destVC.correct = correctNum
            destVC.wrong = wrongNum
        }
        
    }
    
    @IBAction func checkResult() {
        var wordNum: Int = 0
        nextButton.isHidden = false
        for i in 0...wordList.count-1 {
            if gameType == "뜻보고 영어쓰기"{
                if wordLabel.text == wordList[i].Korean{
                wordNum = i
            }
            }
            else{
            if wordLabel.text == wordList[i].English{
                wordNum = i
            }
            }
            
        }
            if gameType == "뜻보고 영어쓰기"{
               koreanLabel.text = wordList[wordNum].English
            }
            
        else {
            koreanLabel.text = wordList[wordNum].Korean
            }
            
        if gameType == "뜻보고 영어쓰기"{
              if answerTField.text == wordList[wordNum].English && answerTField != nil{
                  resultLabel.text = "정답!"
                  resultLabel.textColor = UIColor.black
                  correct += 1
              }
              else{
                  resultLabel.text = "오답!"
                  resultLabel.textColor = UIColor.red
                  wrong += 1
              }
            }
            
        else {
            if answerTField.text == wordList[wordNum].Korean && answerTField != nil{
                resultLabel.text = "정답!"
                resultLabel.textColor = UIColor.black
                correct += 1
            }
            else{
                resultLabel.text = "오답!"
                resultLabel.textColor = UIColor.red
                wrong += 1
            }
            }
        
        checkButton.isHidden = true
    }


   
@IBAction func nextWord() {
        koreanLabel.text = ""
        resultLabel.text = ""
        answerTField.text = ""
        if gameType == "실전"{
            wordList.remove(at:numR)
        }
        
        if wordList.count <= 0 {
            wordLabel.text = "모든 단어를 확인했어요.\n맞은 갯수 : \(correct), 틀린 갯수 : \(wrong)"
            recordButton.isHidden = false
        }
        else{
            numR = Int(arc4random_uniform(UInt32(wordList.count)))
            wordLabel.text = wordList[numR].English
            checkButton.isHidden = false
        }
        nextButton.isHidden = true
        
    }
    
}

