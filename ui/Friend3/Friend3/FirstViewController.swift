//
//  ViewController.swift
//  Friend3
//
//  Created by 18986602 on 12.02.2022.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var bigGreyButton: UIButton!
    
    
    var secondText = String()
    let fromFirstToSecondSegue = "fromFirstToSecondSegue"
    let toSendString = "Hello Second Controller"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1viewDidAppear")
        
        //performSegue(withIdentifier: fromFirstToSecondSegue, sender: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("1viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1viewDidDisappear")
    }
    @IBAction func unwindToFirst(segue: UIStoryboardSegue) {
        print("unwind to First")
        guard let secondViewController = segue.source as? SecondViewController else {return}
        
        if let text = secondViewController.textField.text {
            print(text)
            self.secondText = text
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFirstToSecondSegue {
            guard let secondController = segue.destination as? SecondViewController,
                  let text = sender as? String
                  else {return}
        secondController.text = text
        }
    }
    
    
    
    @IBAction func bigGreyButtonPressed(_ sender: UIButton) {
        bigGreyButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        sleep(2)
        performSegue(withIdentifier: fromFirstToSecondSegue, sender: self.toSendString)
    }
    
    deinit {
        print("1ViewController die")
    }
}

