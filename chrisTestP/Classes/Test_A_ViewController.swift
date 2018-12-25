//
//  Test_A_ViewController.swift
//  FBSnapshotTestCase
//
//  Created by wilson on 2018/12/4.
//

import UIKit

public class Test_A_ViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(notification:)), name: NSNotification.Name("hiA") , object: nil)
    }
    
    @IBAction func changeColorBtnOnClick(_ sender: Any) {
        
        let randomNum = CGFloat((Float)(arc4random() % 100)/100)
        let userDefaults = UserDefaults.standard
        userDefaults.set(randomNum, forKey: "PodA")
        print("PodA random \(randomNum)")
        
        let podBVal = userDefaults.value(forKey: "PodB")
        let mainVal = userDefaults.value(forKey: "Main")
        print("pod B val:\(podBVal ?? "shit")")
        print("main val:\(mainVal ?? "shit")")
        
        self.view.backgroundColor = UIColor (red: 0, green: randomNum, blue: 0.5, alpha: 1.0)
        NotificationCenter.default.post(name: Notification.Name("hiMain"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("hiB"), object: nil)
    }
    
    @objc func receiveNotification(notification:Notification) -> () {
        print("receiveNotification Pod_A")
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
