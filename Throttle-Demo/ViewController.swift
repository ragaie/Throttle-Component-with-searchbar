//
//  ViewController.swift
//  Throttle-Demo
//
//  Created by Ragaie alfy on 5/9/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate {
  
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var resultLabel: UILabel!
    //cellid ---> filterTitleCEllID
    @IBOutlet weak var filterSearchTable: UITableView!
    
    var thrit : ChtarThrottle!
    var index : Int = 0
    var originalData : [String]! = ["welcome","hello ","ragiae","alfy","fahmey","Assuit","cairo","egypt ","roma","wood","motorBike","thanks","for","testing","find you next time","welcome my baby"]
     var textFilterArr : [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textFilterArr = originalData
    
         thrit  = ChtarThrottle()
        searchBar.delegate = self
      filterSearchTable.delegate = self
        
      filterSearchTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textFilterArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "filterTitleCEllID", for: indexPath)

        cell.textLabel?.text = textFilterArr[indexPath.row]
        return cell
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if (self.searchBar.text == ""){
            textFilterArr = originalData
            self.filterSearchTable.reloadData()

           // thrit.stop()
            
        }
        else{
            thrit.excute(period: 1.0) {
                print(self.searchBar.text)
                self.resultLabel.text = self.searchBar.text!
                self.filterArray(str: self.searchBar.text!)
            }
            
        }
        
        
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
     
        
        
    
    }
    
    
    
    
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        
        thrit.stop()
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        thrit.stop()

        
    }
   

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        thrit.stop()

        
    }
    
    
    func filterArray(str : String){
    
        let filtered = originalData.filter { $0.lowercased().contains(str.lowercased()) }
        print(filtered)
        
        textFilterArr = filtered
        
        filterSearchTable.reloadData()
    
    }
    
}

