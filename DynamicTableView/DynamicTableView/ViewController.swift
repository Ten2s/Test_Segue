//
//  ViewController.swift
//  DynamicTableView
//
//  Created by linc on 2020/01/09.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let album:Getalbumnames = Getalbumnames()
     
     func getNames()
     {
         album.getNames()
     }
    
    @IBOutlet weak var PhotovView: UITableView!
    
    var getPhoto:GetPhoto = GetPhoto()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNames()
        PhotovView.dataSource = self
        PhotovView.delegate = self
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.album.albumNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)
        let rowData = self.album.albumNames[indexPath.row]
        cell.textLabel?.text = rowData
        cell.detailTextLabel?.text = "원"
        return cell
    }
}
