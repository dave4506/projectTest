//
//  ViewController.swift
//  trialProkect
//
//  Created by Dav Sun on 5/16/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var productId: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        store.subscribe(self) { state in
            state
        }
        store.dispatch(fetchLooks)
    }
    
    func newState(state: State?) {
        guard let state = state else { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleBottomView(sender: AnyObject) {
        store.dispatch(SwitchBottomView(switchTo:.Product))
    }
    
    @IBAction func setTest(sender: AnyObject) {
        store.dispatch(SetCurrentProduct(product: .Request(self.productId.text ?? "")))
        store.dispatch(fetchCurrentProduct)
    }
    
    @IBAction func loadLook(sender: AnyObject) {
        store.dispatch(fetchLooks)
    }
    
    @IBAction func getSimilarProducts(sender: AnyObject) {
        store.dispatch(fetchSimilarProducts)
    }
}

