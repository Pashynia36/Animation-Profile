//
//  MainViewController.swift
//  Animation Profile
//
//  Created by Pavlo Novak on 3/14/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageLeft: NSLayoutConstraint!
    @IBOutlet weak var imageTop: NSLayoutConstraint!
    @IBOutlet weak var topNameConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerBlur: UIVisualEffectView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerSecondConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var nameConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var imageWidthPosition: NSLayoutConstraint!
    
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeightPosition: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    var draggedToTop: Int? = nil
    var draggedToBottom: Int? = 1
    private var lastContentOffset: CGFloat = 0
    var scrollVar: CGFloat = 0
    var newScroll: CGFloat = 0
    let imageSize: CGFloat = 100.0
    var check: Bool = false
    
    var information = [InfoClass(information: "I love you the more in that I believe you had liked me for my own sake and for nothing else."),
                       InfoClass(information: "But man is not made for defeat. A man can be destroyed but not defeated."),
                       InfoClass(information: "But man is not made for defeat. A man can be destroyed but not defeated."),
                       InfoClass(information: "One thing we DO know is that  whether you've love and won — or loved and lost, it's ALWAYS worth it."),
                       InfoClass(information: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical"),
                       InfoClass(information: "qwerqwetqwetwq"),
                       InfoClass(information: "To create an outlet from a constraint, control drag from the constraint in the storyboard editor (just like you would for an outlet of a UIView) into your code."),
                       InfoClass(information: "You are right - because you are using auto layout and constraints"),
                       InfoClass(information: "Chillin'"),
                       InfoClass(information: " I saw some posts about exactly what your saying "),
                       InfoClass(information: "Any luck yet "),
                       InfoClass(information: "Christmas!"),
                       InfoClass(information: "Your question is about the error that is now resolved. You should create a new question to deal with your new issue if needed (after you do lots of research first). But your constraints are going to cause issues trying to change the frame I believe. "),
                       InfoClass(information: "Is there any height"),
                       InfoClass(information: "Joe"),
                       InfoClass(information: "Your Answer is empty."),
                       InfoClass(information: "Howdy")]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        profileImage.image = #imageLiteral(resourceName: "profile")
        backgroundImage.image = #imageLiteral(resourceName: "profile")
        profileImage.layer.cornerRadius = 50
        profileName.text = "George"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCellTableViewCell
        cell.prepareForCell(information: information[indexPath.row])
        return cell
    }
    
    
    //придумать другой чек на запуск функции
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y > scrollVar {
            newScroll = scrollView.contentOffset.y - scrollVar
            check = false
        } else {
            newScroll = scrollVar - scrollView.contentOffset.y
            check = true
        }
        //print(newScroll)
        //if (scrollView.contentOffset.y == 0) {
        if check {
            if headerSecondConstraint.constant <= 200 {
                headerSecondConstraint.constant = headerSecondConstraint.constant + newScroll
                headerViewConstraint.constant = headerViewConstraint.constant + newScroll
            }
            if let _ = draggedToTop, headerSecondConstraint.constant >= 200 {
                scrollVar = scrollVar - scrollView.contentOffset.y
                //self.nameConstraint.isActive = true
                headerSecondConstraint.constant = headerSecondConstraint.constant + newScroll
                headerViewConstraint.constant = headerViewConstraint.constant + newScroll
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageLeft.isActive = false
                    self.imageHeightPosition.isActive = true
                    self.topNameConstraint.isActive = false
                    self.profileImage.center.x = 150
                    self.profileName.center.y = 200
                })
                self.imageHeight.constant = imageSize
                self.imageWidth.constant = imageSize
                self.profileImage.layer.cornerRadius = imageSize / 2
                draggedToTop = nil
                draggedToBottom = 1
            }
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            if headerSecondConstraint.constant >= 100 {
                headerSecondConstraint.constant = headerSecondConstraint.constant - newScroll
                headerViewConstraint.constant = headerViewConstraint.constant - newScroll
            }
            if let _ = draggedToBottom {
                // move down
                //self.nameConstraint.isActive = false
                UIView.animate(withDuration: 1.0, animations: {
                    //self.imageTop.isActive = true
                    self.imageLeft.isActive = true
                    //self.imageWidthPosition.isActive = false
                    self.imageHeightPosition.isActive = false
                    self.topNameConstraint.isActive = true
                    self.profileImage.center.x = 100
                    //self.profileImage.center.y = 0
                    //self.profileName.center.x = 200
                    self.profileName.center.y = 100
                    
                })
                self.imageWidth.constant = imageSize / 2
                self.profileImage.layer.cornerRadius = imageSize / 4
                self.imageHeight.constant = imageSize / 2
                self.view.layoutIfNeeded()
                draggedToTop = 1
                draggedToBottom = nil
                // update the new position acquired
                self.lastContentOffset = scrollView.contentOffset.y
            }
        }
        scrollVar = scrollView.contentOffset.y
    }
}
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
