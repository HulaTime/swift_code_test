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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
          let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
          let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
          let session = URLSession.shared
          let task = session.dataTask(with: urlRequest as URLRequest) {
              (data, response, error) -> Void in
            
              let httpResponse = response as! HTTPURLResponse
              let statusCode = httpResponse.statusCode
            
              if (statusCode == 200) {
                  print("Everyone is fine, file downloaded successfully.")
                
                do{
                  let json = JSON(data: dataFromNetworking)
                  if let userName = json[0]["user"]["name"].string {
                    //Now you got your value
                  }
                }catch {
                  
                }
              
              }
          }
      
          task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

