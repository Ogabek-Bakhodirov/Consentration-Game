//
//  Constants.swift
//  ConsentrationGame
//
//  Created by Ogabek Bakhodirov on 23/11/22.
//

import UIKit

var windowWidth = UIScreen.main.bounds.width
var windowHeight = UIScreen.main.bounds.height

func universalWidth(_ width: CGFloat) -> CGFloat {
    return (width / 375) * windowWidth
}

func universalHeight(_ height: CGFloat) -> CGFloat {
    return (height / 812) * windowHeight
}
