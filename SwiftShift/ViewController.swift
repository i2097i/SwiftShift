//
//  ViewController.swift
//  SwiftShift
//
//  Created by Scot Reichman on 7/8/14.
//  Copyright (c) 2014 i2097i. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDataDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    var url : String = ""
    var mutableData : NSMutableData!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.Done
        textField.text = "http://www.google.com"
        textField.keyboardType = UIKeyboardType.URL
        
        textView.editable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(sender: AnyObject) {
        if !textField.text.isEmpty {
            textView.text = ""
            mutableData = NSMutableData()
            var connection = NSURLConnection(request: NSURLRequest(URL: NSURL(string: textField.text)), delegate: self, startImmediately: true)
        } else {
            var av = UIAlertView(title: "No url to download", message: "", delegate: self, cancelButtonTitle: "Dismiss")
            av.show()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        mutableData.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var htmlString = (NSString(data: NSData(data: mutableData), encoding: NSUTF8StringEncoding).stringByReplacingOccurrencesOfString(">", withString: ">\n")).stringByReplacingOccurrencesOfString("</", withString: "\n</")
        textView.text = htmlString
    }
}

