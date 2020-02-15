//
//  quizViewController.swift
//  My project
//
//  Created by 黒田桜介 on 2020/02/08.
//  Copyright © 2020 黒田桜介. All rights reserved.
//

import UIKit

class quizViewController: UIViewController {
//問題文を格納する配列
    var quizArray = [Any]()
    //正解数
    var correctAnswer: Int = 0
   //クイズを表示するTextview
    @IBOutlet var  quizTextview: UITextView!
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    //一時的にクイズを格納しておく配列
    var tmpArray = [Any]()
    //tmpArrayに問題文、３つの選択肢、答えの番号が入った配列を追加していく
    tmpArray.append(["quiz8","36","４","8",3])
    tmpArray.append(["quiz2","いご","けいご","いたご",1])
    tmpArray.append(["quiz1","この謎の答えは名前","この謎の答えは孤児","この謎の答えは魔女",3])
    //問題をシャッフルしてquizArrayに格納する
    while (tmpArray.count > 0) {
    let index = Int(arc4random()) % tmpArray.count
    quizArray.append(tmpArray[index])
    tmpArray.remove(at: index)
    }
        choiceQuiz()

    }


func choiceQuiz() {
    //一時的にクイズを取り出す配列
    let tmpArray = quizArray[0] as! [Any]
    //問題文のテキスト表示
    quizTextview.text = tmpArray[0] as! String
    //選択肢のボタンにそれぞれ選択肢のテキストをせっと
    choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
    choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
    choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
}
    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer = correctAnswer + 1
            }
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        //解いた問題数の合計があらかじめ設定していた問題数に達成したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
}












