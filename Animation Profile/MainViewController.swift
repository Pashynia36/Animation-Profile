//
//  MainViewController.swift
//  Animation Profile
//
//  Created by Pavlo Novak on 3/14/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var information = [InfoClass(information: "I love you the more in that I believe you had liked me for my own sake and for nothing else."),
                       InfoClass(information: "But man is not made for defeat. A man can be destroyed but not defeated."),
                       InfoClass(information: "But man is not made for defeat. A man can be destroyed but not defeated."),
                       InfoClass(information: "One thing we DO know is that  whether you've love and won — or loved and lost, it's ALWAYS worth it."),
                       InfoClass(information: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical"),
                       InfoClass(information: "qwerqwetqwetwq"),
                       InfoClass(information: "wqetwqetwqetwqet"),
                       InfoClass(information: "asdfg"),
                       InfoClass(information: "zxcv"),
                       InfoClass(information: "dfgay"),
                       InfoClass(information: "eewqay")]
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCellTableViewCell
        cell.prepareForCell(information: information[indexPath.row])
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
