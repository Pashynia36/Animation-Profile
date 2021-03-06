//
//  MainViewController.swift
//  Animation Profile
//
//  Created by Pavlo Novak on 3/14/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Constraints
    @IBOutlet weak var nameConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var headerViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerSecondConstraint: NSLayoutConstraint!
    // UI elements
    @IBOutlet weak var headerBlur: UIVisualEffectView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    // Variables
    var lastContentOffset: CGFloat = 0
    var scrollVar: CGFloat = 0
    var newScroll: CGFloat = 0
    var imagePosition: CGFloat = 0.0
    var labelPosition: CGFloat = 0.0
    var check: Bool = false
    var heightStart: CGFloat = 0.0
    var delta: CGFloat = 0.0
    var halfWidth: CGFloat = 0.0
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
        imagePosition = imageConstraint.constant
        heightStart = headerView.frame.size.height
        halfWidth = profileImage.frame.size.width / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCellTableViewCell
        cell.prepareForCell(information: information[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height)) || scrollView.contentOffset.y < 0 {
        } else {
            if scrollView.contentOffset.y > scrollVar {
                newScroll = scrollView.contentOffset.y - scrollVar
                check = false
            } else {
                newScroll = scrollVar - scrollView.contentOffset.y
                check = true
            }
            if check {
                if headerSecondConstraint.constant < 200 {
                    headerSecondConstraint.constant += newScroll
                    headerViewConstraint.constant += newScroll
                }
                if headerSecondConstraint.constant > 200 || headerViewConstraint.constant > 200 {
                    headerSecondConstraint.constant = 200
                    headerViewConstraint.constant = 200
                }
                if scrollView.contentOffset.y > 0 {
                    lastContentOffset += -newScroll
                }
            }
            else if (self.lastContentOffset < scrollView.contentOffset.y) {
                if headerViewConstraint.constant > 100 {
                    headerSecondConstraint.constant += -newScroll
                    headerViewConstraint.constant += -newScroll
                    if headerSecondConstraint.constant < 100 || headerViewConstraint.constant < 100 {
                        headerSecondConstraint.constant = 100
                        headerViewConstraint.constant = 100
                    }
                }
                lastContentOffset += newScroll
            }
            scrollVar = scrollView.contentOffset.y
        }
        // Animating label & image
        delta = headerViewConstraint.constant / heightStart
        profileImage.transform = CGAffineTransform.identity.scaledBy(x: delta, y: delta).translatedBy(x:  -(1 - delta) * 600, y: 0)
        if delta >= 0.5 && delta <= 0.75 {
            // top to middle
            profileName.transform = CGAffineTransform(translationX: -(1 - delta)*100 + halfWidth, y: -(1 - delta)*50 )
        } else {
            // bottom to middle
            profileName.transform = CGAffineTransform(translationX: (1 - delta)*100, y: -(1 - delta)*50 )
        }
    }
}
