//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 丸山万綾 on 2023/10/25.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer!
    var timer_sec: Int = 0
    var play_count: Int = 0
    let image_name = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6"]
    var button_count: Int = 0
    
    @IBOutlet weak var playandstopbutton: UIButton!
    @IBOutlet weak var returnbutton: UIButton!
    @IBOutlet weak var turnbutton: UIButton!
    @IBOutlet weak var slide_image: UIImageView!
    @IBOutlet weak var return_image: UIImageView!
    @IBOutlet weak var turn_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playandstopbutton.addTarget(self, action: #selector(ViewController.buttonEvent(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonEvent(sender: Any){
        if (play_count%2) == 0{
            playandstopbutton.setTitle("停止", for: .normal)
            play_count += 1
            //停止状態の0から再生状態の1へ遷移
            //play_countが奇数の間はスライドショーが再生されている状態
            turnbutton.isEnabled = false
            returnbutton.isEnabled = false
            turn_image.isHidden = true
            return_image.isHidden = true
        }else{
            playandstopbutton.setTitle("再生", for: .normal)
            play_count += 1
            //再生状態の1から停止状態の0へ遷移
            //play_countが0を含む偶数の間はスライドショーが停止している状態
            turnbutton.isEnabled = true
            returnbutton.isEnabled = true
            turn_image.isHidden = false
            return_image.isHidden = false
        }
    }
    
    @objc func updateTimer(_ timer: Timer){
        if (play_count%2) == 1{
            self.timer_sec += 2
            //2秒ごとに6枚の写真が格納されたimage_name配列の画像をチェンジする
            if button_count != 5 {
                button_count += 1
            }else{
                button_count = 0
            }
            let pic_name = image_name[button_count]
            //配列の何番目の写真を読み込むか（button_count番目）
            slide_image.image = UIImage(named: pic_name)
            //UIImageViewの生成
        }
    }
    
    @IBAction func turnpicEvent(_ sender: Any) {
        if button_count != 5 {
            button_count += 1
        }else{
            button_count = 0
        }
        let pic_name = image_name[button_count]
        slide_image.image = UIImage(named: pic_name)
    }
    //進むボタンがタップされたら動くコード
    
    @IBAction func returnpicEvent(_ sender: Any) {
        if button_count != 0 {
            button_count -= 1
        }else{
            button_count = 5
        }
        let pic_name = image_name[button_count]
        slide_image.image = UIImage(named: pic_name)
    }
    
    @IBAction func slideshow(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }else{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func slidetap_Event(_ sender: Any) {
        performSegue(withIdentifier: "detail", sender: nil)
        //画像タップで遷移するコード
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expansionViewController.result_image = slide_image.image!
        if ((play_count%2) == 1){
            self.timer.invalidate()
            self.timer = nil
            playandstopbutton.setTitle("再生", for: .normal)
            play_count += 1
            //再生状態の1から停止状態の0へ遷移
            //play_countが0を含む偶数の間はスライドショーが停止している状態
            turnbutton.isEnabled = true
            returnbutton.isEnabled = true
            turn_image.isHidden = false
            return_image.isHidden = false
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }


}

