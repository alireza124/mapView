//
//  CustomCalloutView.swift
//  6.1.1
//
//  Created by user on 11/13/1395 AP.
//  Copyright © 1395 user. All rights reserved.
//

import UIKit

class CustomCalloutView: UIView {


    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    /*
    override func draw(_ rect: CGRect)
    {
    let context = UIGraphicsGetCurrentContext()
    context?.setLineWidth(2.0)
    context?.setStrokeColor(UIColor.blue.cgColor)
    context?.move(to: CGPoint(x:150, y: 150))
    context?.addLine(to: CGPoint(x: 150, y: 150))
    context?.addLine(to: CGPoint(x: 100, y: 200))
    context?.addLine(to: CGPoint(x: 50, y: 150))
    context?.addLine(to: CGPoint(x: 100, y: 100))
    context?.strokePath()
    }
    */
}
