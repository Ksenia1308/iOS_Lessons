//
//  SecondViewController.swift
//  Friend3
//
//  Created by 18986602 on 12.02.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    var text = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2viewDidLoad")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("2viewDidAppear")
        print(text)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("2viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("2viewDidDisappear")
    }
    deinit {
        print("2ViewController die")
    }
}
