//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 丸山万綾 on 2023/10/27.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var expanded_image: UIImageView!
    var result_image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expanded_image.image = result_image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
