//
//  quizViewController.swift
//  My project
//
//  Created by 黒田桜介 on 2020/02/08.
//  Copyright © 2020 黒田桜介. All rights reserved.
//

import UIKit

class quizViewController: UIViewController {
    //問題の答え，正解を格納する配列
    var quizArray = [Any]()
    
    //①問題文の画像を格納する配列

    //正解数
    var correctAnswer: Int = 0
   //クイズを表示するTextview
    @IBOutlet var  quizImageView: UIImageView!
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //一時的にクイズを格納しておく配列
        var tmpArray = [Any]()
        
        //②一時的に問題の画像を格納しておく配列
        
        //tmpArrayに３つの選択肢、答えの番号が入った配列を追加していく
        tmpArray.append(["36","４","8",3])
        tmpArray.append(["いご","けいご","いたご",1])
        tmpArray.append(["この謎の答えは名前","この謎の答えは孤児","この謎の答えは魔女",3])
        
        //③tmpImageArrayに問題の画像を追加する

        //問題をシャッフル
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            //④imageArrayにシャッフルされた画像を格納

            tmpArray.remove(at: index)
            //⑤表示した問題は削除する
            
        }
            choiceQuiz()

        }


func choiceQuiz() {
    //一時的にクイズを取り出す配列
    let tmpArray = quizArray[0] as! [Any]
    //⑥問題文のテキスト表示
    
    //選択肢のボタンにそれぞれ選択肢のテキストをセット
    choiceButton1.setTitle(tmpArray[0] as? String, for: .normal)
    choiceButton2.setTitle(tmpArray[1] as? String, for: .normal)
    choiceButton3.setTitle(tmpArray[2] as? String, for: .normal)
}

    
    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[3] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer = correctAnswer + 1
            }
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        //⑦解いた問題をimageArrayから取り除く

        //解いた問題数の合計があらかじめ設定していた問題数に達成したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }

//セグエを準備するときに呼ばれるメゾット
override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    if segue.identifier == "toResultView" {
        let resultViewController = segue.destination as! resultViewController
        resultViewController.correctAnswer = self.correctAnswer
     }
}

}












