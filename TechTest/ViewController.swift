//
//  ViewController.swift
//  TechTest
//
//  Created by Luiz Provin on 10/11/2016.
//
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UITableViewController {
  
  var NumberOfRows = 0
  var names = ["hello", "world"]
  var images = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    Alamofire.request("https://sheetsu.com/apis/v1.0/aaf79d4763af").validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        
        self.NumberOfRows = json.count
        
        for i in 0...self.NumberOfRows {
          
          let name = json[i]["name"].string! as String
          
          self.names.append(name)
        }
          

        NSLog("\(json)\nEverything is fine!")
      case .failure(let error):
        print(error)
      }
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return NumberOfRows
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
    
    if names.count != 0 {
      cell.textLabel?.text = names[indexPath.row]
    }
    
    return cell
  }
  
}

