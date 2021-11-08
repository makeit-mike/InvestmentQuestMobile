//
//  ColorValue.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import Foundation
import SwiftUI

func ColorVal(r: Double, g: Double, b: Double, o: Double? = nil) -> Color {
    return Color(red: r / 255, green: g / 255, blue: b / 255, opacity: o ?? 1)
}

func ColorVal(r: Double, g: Double, b: Double) -> Color {
    return Color(red: r / 255, green: g / 255, blue: b / 255)
}

let Stocks_GrayBackground: Color = ColorVal(r: 150, g: 150, b: 155, o: 0.3)
let Stocks_UserInputBackGround: Color = ColorVal(r: 200, g: 200, b: 200, o: 0.5)
