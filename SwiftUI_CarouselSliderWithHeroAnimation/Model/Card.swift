//
//  Card.swift
//  SwiftUI_CarouselSliderWithHeroAnimation
//
//  Created by park kyung seok on 2021/08/19.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offset: CGFloat = 0
    var title: String
}

