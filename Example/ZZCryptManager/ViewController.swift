//
//  ViewController.swift
//  ZZCryptManager
//
//  Created by 185226139@qq.com on 04/27/2019.
//  Copyright (c) 2019 185226139@qq.com. All rights reserved.
//

import UIKit
import ZZCryptManager

let publicKey = ""

//AES密钥字符串
private let  AES_KEY = ""

 //AES偏移量
private let  AES_IV = ""


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      print(ZZCryptManager.zz_rsaEncrypt("大佬666", publicKey)!)
        
      print(ZZCryptManager.zz_aesEncryptStr("老铁没毛病，1@？aB", AES_KEY, AES_IV)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

