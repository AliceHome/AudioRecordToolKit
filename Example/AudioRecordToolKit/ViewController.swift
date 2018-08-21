//
//  ViewController.swift
//  AudioRecordToolKit
//
//  Created by Rey-superlrp on 08/20/2018.
//  Copyright (c) 2018 Rey-superlrp. All rights reserved.
//

import UIKit
import AudioRecordToolKit

class ViewController: UIViewController {
    let audioTool = HTAudioRecordTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startRecord(_ sender: Any) {
        print("start record")
        audioTool.startRecord()
    }
    
    @IBAction func stopRecord(_ sender: Any) {
        audioTool.stopRecord()
        print("stop record ")
    }
    
    @IBAction func startPlay(_ sender: Any) {
        print("start  play")
        audioTool.startPlay()
    }
    
    @IBAction func stopPlay(_ sender: Any) {
        print("stop play")
        audioTool.stopPlay()
    }
}

