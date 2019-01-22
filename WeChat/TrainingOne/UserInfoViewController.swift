//
//  ViewController.swift
//  TrainingOne
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 Vicky. All rights reserved.
//

import UIKit

class UserInfoViewController: UITableViewController {
    var data = [
    ("A",[(NSLocalizedString("weather", comment: ""),"weather.png")]),
    ("B",[(NSLocalizedString("spring", comment: ""),"rain.png"),
          (NSLocalizedString("summer", comment: ""),"sunny.png"),
          (NSLocalizedString("fall", comment: ""),"cloudy.png"),
          (NSLocalizedString("winter", comment: ""),"snow.png")]),
    ("C",[(NSLocalizedString("umbrella", comment: ""),"umbrella.png")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("userInfo", comment: "")
        //self.navigationItem.title = "UserInfo"
        self.view.backgroundColor = UIColor.white
        //初始化tableView,设置tableView的样式，如果不设置grouped页面将会显示成一整段带横线的样式
        tableView = UITableView(frame: UIScreen.main.bounds,style:UITableView.Style.grouped)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("doneButton", comment: ""), style: .done, target: self, action: #selector(nextPage))
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
        return 20
    }
    //设置tableView每个部分Header的内容
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        let viewLable = UILabel(frame: CGRect(x: 10,y: 0,width: UIScreen.main.bounds.size.width,height: 30))
        //显示前面英文字母的
        //viewLable.text = data[section].0
        viewLable.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.0)
        view.addSubview(viewLable)
        tableView.addSubview(view)
        return view
    }
    //计算每个部分的数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(detailsPageController(), animated: true)
    }
    //将数据填充到UITableViewCell里
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        let image = UIImage(named: data[indexPath.section].1[indexPath.row].1)
        cell.imageView?.image = image
        cell.textLabel?.text = data[indexPath.section].1[indexPath.row].0
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func nextPage(){
        present(donepageController(),animated: true,completion: nil)
    }
}

