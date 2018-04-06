//
//  ViewController.swift
//  StringExtensionHTML
//
//  Created by Adela on 02/15/2016.
//  Copyright (c) 2016 Adela. All rights reserved.
//

import UIKit
import StringExtensionHTML

class ViewController: UIViewController {
    
    @IBOutlet weak var stripTags: UIButton!
    @IBOutlet weak var decode: UIButton!
    @IBOutlet weak var sample1: UIButton!
    @IBOutlet weak var sample2: UIButton!
    @IBOutlet weak var sample3: UIButton!
    @IBOutlet weak var sampleText: UITextField!
    @IBOutlet weak var convertedResult: UITextField!
    
    
    @objc func sample1Click() {
        sampleText.text = "&#x22;That&#x27;s your d&#xE6;mon, Lyra.&#x22;"
    }
    
    @objc func sample2Click() {
        sampleText.text = "&lt;a href=&quot;mailto:foo@foo.com&quot;&gt;email&lt;/a&gt;"
    }
    
    @objc func sample3Click() {
        sampleText.text = "<h2>Try stripping <b>my</b> <a href=''><i>html</i></a> tags!</h2>"
    }
    
    @objc func stripTagsClick() {
       convertedResult.text = sampleText.text!.stringByStrippingHTMLTags
    }
    
    @objc func decodeClick() {
        convertedResult.text = sampleText.text!.stringByDecodingHTMLEntities
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        sampleText.becomeFirstResponder()
        sample1.addTarget(self, action: #selector(ViewController.sample1Click), for: .touchUpInside)
        sample2.addTarget(self, action: #selector(ViewController.sample2Click), for: .touchUpInside)
        sample3.addTarget(self, action: #selector(ViewController.sample3Click), for: .touchUpInside)
        stripTags.addTarget(self, action: #selector(ViewController.stripTagsClick), for: .touchUpInside)
        decode.addTarget(self, action: #selector(ViewController.decodeClick), for: .touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

