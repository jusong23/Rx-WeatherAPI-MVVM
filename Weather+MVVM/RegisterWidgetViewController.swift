//
//  RegisterWidgetViewController.swift
//  Weather+MVVM
//
//  Created by jusong on 2023/08/25.
//

import UIKit

class RegisterWidgetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.barTintColor = .gray
        navigationItem.title = "Add Widget"
        view.backgroundColor = .white

        let leftButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(tapBackButton))
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(tapAddWidget))
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func tapAddWidget(_ sender: Any) {
        print(#function)
    }
    
    @objc func tapBackButton(_ sender: Any) {
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
