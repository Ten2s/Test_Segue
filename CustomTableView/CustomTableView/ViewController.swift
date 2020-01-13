//
//  ViewController.swift
//  CustomTableView
//
//  Created by KANG HEE JONG on 2020/01/09.
//  Copyright © 2020 KANG HEE JONG. All rights reserved.
//


struct CoffeeMenu {
    var name: String
    var price: Float
}

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coffeeTableView: UITableView!
    
    let menu:[CoffeeMenu] = [
        CoffeeMenu(name: "아메리카노", price: 2500),
        CoffeeMenu(name: "카페라떼", price: 2700),
        CoffeeMenu(name: "캬라멜 마키아또", price: 3500),
        CoffeeMenu(name: "아이스 아메리카노", price: 2700),
        CoffeeMenu(name: "콜드브루", price: 3500),
        CoffeeMenu(name: "오늘의 커피", price: 3200),
        CoffeeMenu(name: "초코라떼", price: 3000),
        CoffeeMenu(name: "딸기 라떼", price: 3000),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeeTableView.dataSource = self
        coffeeTableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeMenuCell", for: indexPath) as! CoffeeMenuCell
        let rowData = self.menu[indexPath.row]
        cell.nameLabel.text = rowData.name
        cell.priceLabel.text = "\(rowData.price)"
        return cell
    }
}
