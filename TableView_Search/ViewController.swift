//
//  ViewController.swift
//  TableView_Search
//
//  Created by Enamul Haque on 10/13/19.
//  Copyright © 2019 Enamul Haque. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    
    var originalArr = [[String:Any]]();
    var searchArrRes = [[String:Any]]()
    var searching:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign delegate  don't forget
         txtName.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //my array
        originalArr =   [
            ["name": "abdul", "number": "+8800000001"],
            ["name": "abdin", "number": "+8800000002"],
            ["name": "Enamul", "number": "+8800000003"],
            ["name": "enam", "number": "+8800000004"],
            ["name": "Rafi", "number": "+8800000005"],
            ["name": "Ehaque", "number": "+8800000006"],
            ["name": "ab", "number": "+8800000007"],
            ["name": "Emon", "number": "+8800000008"],
            ["name": "enamu1", "number": "+8800000009"],
            ["name": "rafi", "number": "+88000000010"],
            ["name": "karim", "number": "+88000000011"],
            ["name": "radev", "number": "+88000000012"],
            ["name": "da", "number": "+88000000013"],
            ["name": "aa", "number": "+88000000014"],
            ["name": "rafi", "number": "+88000000010"],
            ["name": "karim", "number": "+88000000011"],
            ["name": "radev", "number": "+88000000012"],
            ["name": "da", "number": "+88000000013"],
            ["name": "aa", "number": "+88000000014"]
        ]
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //input text
       let searchText  = textField.text! + string
        //add matching text to arrya
        searchArrRes = self.originalArr.filter({(($0["name"] as! String).localizedCaseInsensitiveContains(searchText))})
        
        if(searchArrRes.count == 0){
            searching = false
        }else{
            searching = true
        }
        self.tableView.reloadData();
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //check search text & original text
        if( searching == true){
            return searchArrRes.count
        }else{
            return originalArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //custom cell Custom_cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Custom_cell
        //check search text & original text
        if( searching == true){
            var dict = searchArrRes[indexPath.row]
            cell.label_name.text = dict["name"] as? String
            cell.label_number.text = dict["number"] as? String
        }else{
            var dict = originalArr[indexPath.row]
            cell.label_name.text = dict["name"] as? String
            cell.label_number.text = dict["number"] as? String
            
        }
        
        return cell
    }
    
    
}

