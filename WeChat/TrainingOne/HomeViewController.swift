//
//  HomeViewController.swift
//  TrainingOne
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 Vicky. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    var data = [
        ("A", ["阿猫", "阿狗", "阿门", "阿前"]),
        ("B", ["背锅", "背诵", "北方", "北京", "北国", "卑鄙"]),
        ("C", ["曹操", "炒菜", "抄家", "菜子", "擦伤", "长短"]),
        ("D", ["大西安","大小", "大家", "带来", "捣蛋"]),
        ("F", ["仿佛", "仿照", "发财", "返航", "帆船"]),
        ("H", ["花泽香菜","合阳"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("homeInfo", comment: "")
        //self.navigationItem.title = "HomeInfo"
        self.view.backgroundColor = UIColor.white
        //初始化tableView
       // tableView = UITableView(frame: UIScreen.main.bounds,style:UITableView.Style.grouped)
        //设置数据源和代理
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //设置重用ID
        self.tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
    }
    //设置tableView有多少个部分
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    //设置tableView每个部分Header的高
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    //设置tableView每个部分Header的内容
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        let viewLable = UILabel(frame: CGRect(x: 10,y: 0,width: UIScreen.main.bounds.size.width,height: 30))
        viewLable.text = data[section].0
        viewLable.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.0)
        view.addSubview(viewLable)
        tableView.addSubview(view)
        return view
    }
    //计算每个部分的数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
    ///将数据填充到UITableViewCell里
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //显示下拉箭头
       //cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        //let image = UIImage(named: data[indexPath.section].1[indexPath.row].1)
        cell.imageView?.image = UIImage(named: "user")
        cell.textLabel?.text = data[indexPath.section].1[indexPath.row]
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
