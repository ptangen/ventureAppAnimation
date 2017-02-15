//
//  ViewController.swift
//  animatedLogoVentureApp
//
//  Created by Paul Tangen on 2/13/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let startUpLabel = UILabel()
    let startUpLabelMutable = NSMutableAttributedString()
    let needLabel = UILabel()
    let needLabelMutable = NSMutableAttributedString()
    
    // get coordinates for layout
    let centerX = UIScreen.main.bounds.width / 2
    let row1 = (UIScreen.main.bounds.height / 2) - 120
    let row2 = (UIScreen.main.bounds.height / 2) - 60
    let row3 = (UIScreen.main.bounds.height / 2)
    let row4 = (UIScreen.main.bounds.height / 2) + 20
    let row5 = (UIScreen.main.bounds.height / 2) + 60
    
    let green = UIColor(red: 86/255, green: 192/255, blue: 184/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        setupLogo()
    }
    
    func setupLogo() {

        self.startUpLabel.text = "EVERY START UP"
        self.startUpLabel.frame = CGRect()
        self.startUpLabel.frame.size = CGSize(width: 300, height: 50)
        self.startUpLabel.center = CGPoint(x: self.centerX, y: self.row1)
        self.startUpLabel.textAlignment = .center
        self.view.addSubview(self.startUpLabel)
        
        // needLabel
        self.needLabel.text = "NEEDS"
        self.needLabel.frame = CGRect()
        self.needLabel.frame.size = CGSize(width: 300, height: 50)
        self.needLabel.center = CGPoint(x: self.centerX, y: self.row2)
        self.needLabel.textAlignment = .center
        self.view.addSubview(self.needLabel)
        
        // set the fonts for the labels
        if let startUpLabelUnwrapped = self.startUpLabel.text, let needLabelUnwrapped = self.needLabel.text {
            let startupString = NSAttributedString(string: startUpLabelUnwrapped)
            self.startUpLabelMutable.setAttributedString(startupString)
            self.startUpLabelMutable.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue", size: 36.0)!, range: NSRange(location:0,length:14))
            
            let needString = NSAttributedString(string: needLabelUnwrapped)
            self.needLabelMutable.setAttributedString(needString)
            self.needLabelMutable.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue", size: 36.0)!, range: NSRange(location:0,length:5))
        }

        // V
        self.setStartUpLetterColor(label: "startup", location: 1)
        self.moveChar(letter: "V", rowStart: row1, xOffsetStart: -98, xOffsetEnd: -92, completion: { result in
            // E
            self.setStartUpLetterColor(label: "startup", location: 0)
            self.moveChar(letter: "E", rowStart: self.row1, xOffsetStart: -121, xOffsetEnd: -70, completion: { result in
                // N
                self.setStartUpLetterColor(label: "needs", location: 0)
                self.moveChar(letter: "N", rowStart: self.row2, xOffsetStart: -34, xOffsetEnd: -48, completion: { result in
                    // T
                    self.setStartUpLetterColor(label: "startup", location: 10)
                    self.moveChar(letter: "T", rowStart: self.row1, xOffsetStart: 89, xOffsetEnd: -22, completion: { result in
                        // U
                        self.setStartUpLetterColor(label: "startup", location: 12)
                        self.moveChar(letter: "U", rowStart: self.row1, xOffsetStart: 121, xOffsetEnd: -1, completion: { result in
                            // R
                            self.setStartUpLetterColor(label: "startup", location: 9)
                            self.moveChar(letter: "R", rowStart: self.row1, xOffsetStart: 66, xOffsetEnd: 25, completion: { result in
                                // E
                                self.setStartUpLetterColor(label: "needs", location: 2)
                                self.moveChar(letter: "E", rowStart: self.row2, xOffsetStart: 17, xOffsetEnd: 49.5, completion: { result in
                                    // A
                                    self.setStartUpLetterColor(label: "startup", location: 8)
                                    self.moveChar(letter: "A", rowStart: self.row1, xOffsetStart: 44, xOffsetEnd: 72, completion: { result in
                                        // P
                                        self.setStartUpLetterColor(label: "startup", location: 13)
                                        self.moveChar(letter: "P", rowStart: self.row1, xOffsetStart: 146, xOffsetEnd: 94.5, completion: { result in
                                            // P
                                            self.setStartUpLetterColor(label: "startup", location: 13)
                                            self.moveChar(letter: "P", rowStart: self.row1, xOffsetStart: 146, xOffsetEnd: 118, completion: { result in
                                                self.resetFontColor()
                                                print("complete10")
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
    
    func setStartUpLetterColor(label: String, location: Int) {
        self.resetFontColor()

        if label == "startup" {
            // set the A and P to green, else white
            if location == 8 || location == 13 {
                self.startUpLabelMutable.addAttribute(NSForegroundColorAttributeName, value: self.green, range: NSRange(location:location,length:1))
            } else {
                self.startUpLabelMutable.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location:location,length:1))
            }
            self.startUpLabel.attributedText = startUpLabelMutable
        } else {
            self.needLabelMutable.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange(location:location,length:1))
            self.needLabel.attributedText = needLabelMutable
        }
    }
    
    func resetFontColor() {
        // set startup label to gray
        self.startUpLabelMutable.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range: NSRange(location:0,length:14))
        self.startUpLabel.attributedText = self.startUpLabelMutable
        
        // set needs label to gray
        needLabelMutable.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range: NSRange(location:0,length:5))
        self.needLabel.attributedText = needLabelMutable
    }
    
    func moveChar(letter: String, rowStart: CGFloat, xOffsetStart: CGFloat, xOffsetEnd: CGFloat, completion: @escaping (_ result: Bool) -> ()) {
        
        let pointStart = CGPoint(x: centerX + xOffsetStart, y: rowStart)
        let pointMid1 = CGPoint(x: centerX + xOffsetStart, y: row3)
        let pointMid2 = CGPoint(x: centerX + xOffsetEnd, y: row4)
        let pointEnd = CGPoint(x: centerX + xOffsetEnd, y: row5)
        
        // first set up an object to animate
        let labelInst = UILabel()
        labelInst.text = letter
        labelInst.textColor = UIColor.white
        labelInst.font = UIFont(name: "HelveticaNeue", size: 36.0)
        labelInst.frame = CGRect()
        labelInst.frame.size = CGSize(width: 50, height: 50)
        labelInst.center = pointEnd // define x,y by the center as the path/line does

        letter == "A" || letter == "P" ? (labelInst.textColor = self.green) : (labelInst.textColor = UIColor.white)
        
        // add the letter to the screen
        self.view.addSubview(labelInst)
        self.view.sendSubview(toBack: labelInst)
        
        let path = UIBezierPath()
        path.move(to: pointStart)
        path.addCurve(to: pointEnd, controlPoint1: pointMid1, controlPoint2: pointMid2)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            letter == "A" || letter == "P" ? (labelInst.textColor = self.green) : (labelInst.textColor = UIColor.white)
            completion(true)
        })
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.cgPath
        anim.duration = 1.0
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        labelInst.layer.add(anim, forKey: "animate position along path")
        
        CATransaction.commit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

