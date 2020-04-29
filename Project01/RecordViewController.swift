//
//  RecordViewController.swift
//  Project01
//
//  Created by 19swu02 on 2020/04/29.
//  Copyright © 2020 19swu02. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var recordLable: UILabel!
    
    var correct: Int = 0
    var wrong: Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 hh시 mm분"
        let stringDate = dateFormatter.string(from: date)
        recordLable.text! += "\(stringDate) \n맞은 갯수: \(correct), 틀린 갯수: \(wrong)"
        
    }
    

    

}
