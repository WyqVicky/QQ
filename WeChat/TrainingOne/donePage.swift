//
//  donePage.swift
//  TrainingOne
//
//  Created by mac on 2019/1/17.
//  Copyright © 2019年 Vicky. All rights reserved.
//

import UIKit
class donepageController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        let button = UIButton(frame: CGRect(x:20, y:60,width:80,height:40))
        button.setTitle(NSLocalizedString("backButton", comment: ""), for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func backToPrevious(){
        dismiss(animated: true, completion: nil)
    }
}
