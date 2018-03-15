//
//  MainViewController.swift
//  Animation Profile
//
//  Created by Pavlo Novak on 3/14/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var nameConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    
    @IBOutlet weak var headerBlur: UIVisualEffectView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerSecondConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var draggedToTop: Int? = nil
    var draggedToBottom: Int? = 1
    private var lastContentOffset: CGFloat = 0
    var scrollVar: CGFloat = 0
    var newScroll: CGFloat = 0
    var imagePosition: CGFloat = 0.0
    var labelPosition: CGFloat = 0.0
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
        imagePosition = imageConstraint.constant
        labelPosition = nameConstraint.constant
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
    //анимация по картинке, лейблу и вью одновременно плавно
    //разобраться со скроллдаун багом
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y <= 0 {
//            self.lastContentOffset = 0
//        }
        if scrollView.contentOffset.y > scrollVar {
            newScroll = scrollView.contentOffset.y - scrollVar
            check = false
        } else {
            newScroll = scrollVar - scrollView.contentOffset.y
            check = true
        }
        if check {
            if headerSecondConstraint.constant < 200 {
                headerSecondConstraint.constant = headerSecondConstraint.constant + newScroll
                headerViewConstraint.constant = headerViewConstraint.constant + newScroll
            }
            if imageConstraint.constant <= imagePosition {
                imageConstraint.constant = imageConstraint.constant + newScroll * 1.5
                if imageHeight.constant <= 100 {
                    imageHeight.constant = imageHeight.constant + newScroll / 2
                    imageWidth.constant = imageWidth.constant + newScroll / 2
                    profileImage.layer.cornerRadius = imageWidth.constant / 2
                }
                if imageConstraint.constant > imagePosition {
                    imageConstraint.constant = imagePosition
                    imageHeight.constant = 100
                    imageWidth.constant = 100
                    profileImage.layer.cornerRadius = imageWidth.constant / 2
                }
            }
            if nameConstraint.constant >= labelPosition {
                nameConstraint.constant = nameConstraint.constant - newScroll / 5
                if nameConstraint.constant < labelPosition {
                    nameConstraint.constant = labelPosition
                }
            }
            if let _ = draggedToTop, headerSecondConstraint.constant >= 200 {
                scrollVar = scrollVar - scrollView.contentOffset.y
                
                imageConstraint.constant = imagePosition
                draggedToTop = nil
                draggedToBottom = 1
            }
            if scrollView.contentOffset.y > 0 {
                lastContentOffset += -newScroll
            }
            
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            if headerSecondConstraint.constant > 100 {
                headerSecondConstraint.constant = headerSecondConstraint.constant - newScroll
                headerViewConstraint.constant = headerViewConstraint.constant - newScroll
            }
            if imageConstraint.constant >= 5 {
                imageConstraint.constant = imageConstraint.constant - newScroll * 1.5
                imageHeight.constant = imageHeight.constant - newScroll / 2
                imageWidth.constant = imageWidth.constant - newScroll / 2
                profileImage.layer.cornerRadius = imageWidth.constant / 2
            }
            if nameConstraint.constant <= headerView.frame.size.height / 4 {
                nameConstraint.constant = nameConstraint.constant + newScroll / 3
            }
            lastContentOffset += newScroll //scrollView.contentOffset.y
            if let _ = draggedToBottom {
                // move down
                draggedToTop = 1
                draggedToBottom = nil
                // update the new position

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
