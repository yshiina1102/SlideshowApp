//
//  EnlargedViewController.swift
//  SlideshowApp
//
//  Created by Yusuke Shiina on 2020/04/13.
//  Copyright © 2020 Yusuke Shiina. All rights reserved.
//

import UIKit

class EnlargedViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var slide:String = "slide01.jpg"
    //var image: Int = 0
    //let slideImages: [String] = ["slide01.jpg", "slide02.jpg", "slide03.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像をUIImageViewに設定する.
        imageView.image = UIImage(named: slide)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
