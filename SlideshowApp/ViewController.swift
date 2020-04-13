//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yusuke Shiina on 2020/04/13.
//  Copyright © 2020 Yusuke Shiina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var preButton: UIButton!
    @IBOutlet weak var posButton: UIButton!
    var timer: Timer!
    let slideImages: [String] = ["slide01.jpg", "slide02.jpg", "slide03.jpg", "slide04.jpg"]
    var index: Int = 0
    
    @IBAction func beforeButton(_ sender: Any) { // 前へのボタン
        if self.timer == nil {
            self.index -= 1
            if self.index < 0{
                self.index = slideImages.count - 1
            }
            slideImageView.image = UIImage(named:self.slideImages[self.index])
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {   // 次へのボタン
        if self.timer == nil {
            self.index += 1
            if self.index == slideImages.count {
                self.index = 0
            }
            slideImageView.image = UIImage(named:self.slideImages[self.index])
        }
    }
    
    @IBAction func stertButton(_ sender: Any) {  // 再生ボタン
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
            // 進む・戻るボタンの無効化
            preButton.isEnabled = false
            posButton.isEnabled = false
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {  // 停止ボタン
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            // 進む・戻るボタンの有効化
            preButton.isEnabled = true
            posButton.isEnabled = true
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像をUIImageViewに設定する.
        slideImageView.image = UIImage(named:self.slideImages[self.index])
        
        // 画像がタップを感知する
        slideImageView.isUserInteractionEnabled = true
        let myTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        slideImageView.addGestureRecognizer(myTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateImage(timer: Timer) {
        self.index += 1
        if self.index == slideImages.count {
            self.index = 0
        }
        slideImageView.image = UIImage(named:self.slideImages[self.index])
    }

    func tapGesture(sender: UITapGestureRecognizer){
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            // 進む・戻るボタンの有効化
            preButton.isEnabled = true
            posButton.isEnabled = true
        }
        let enlargedViewController = storyboard?.instantiateViewController(withIdentifier: "enlarged") as! EnlargedViewController
        enlargedViewController.slide = self.slideImages[self.index]
        self.present(enlargedViewController, animated: true, completion: nil)
    }


}
