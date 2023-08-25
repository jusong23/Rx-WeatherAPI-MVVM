//
//  RegisterWidget.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/25.
//

import UIKit

class RegisterWidget: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addWidget(_ sender: Any) {
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
