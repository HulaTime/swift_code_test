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

class ViewController: UIViewController {
  
  var NumberOfRows = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    Alamofire.request("https://sheetsu.com/apis/v1.0/aaf79d4763af").validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        
        print("\(json)\nEverything is fine!")
      case .failure(let error):
        print(error)
      }
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

