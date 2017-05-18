//
//  ViewController.swift
//  VMSignatureViewExample
//
//  Created by Vaibhav Misra on 17/05/17.
//  Copyright © 2017 Vaibhav Misra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VMSignatureDelegate {

    @IBOutlet weak var signatureView: VMSignatureView!
    @IBOutlet weak var signatureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.signatureView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clearTapped(_ sender: Any) {
        self.signatureView.clear()
    }
    @IBAction func getImageTapped(_ sender: Any) {
        self.signatureImageView.image = self.signatureView.getSignature()
    }

    //MARK: - VMSignatureDelegate methods
    func startedDrawing() {
        //Do something when drawing started
    }
    
    func finishedDrawing() {
        //Do something when drawing stops
    }

}

