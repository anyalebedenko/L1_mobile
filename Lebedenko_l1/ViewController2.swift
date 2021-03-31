//
//  ViewController2.swift
//  Lebedenko_l1
//
//  Created by Anna Lebedenko on 07.03.2021.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var FirmaNameLabel2: UILabel!
    @IBOutlet var ProductTypeLabel2: UILabel!
    var firmaname2 = "Hello"
    var producttype2 = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        FirmaNameLabel2.text=firmaname2
        ProductTypeLabel2.text=producttype2
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
