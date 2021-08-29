//
//  CarouselViewModel.swift
//  SwiftUI_CarouselSliderWithHeroAnimation
//
//  Created by park kyung seok on 2021/08/19.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
  
   @Published var cards = [
        Card(cardColor: Color("blue"), title: "Neurobics for your mind"),
        Card(cardColor: Color("purple"), title: "Surfing is fun"),
        Card(cardColor: Color("green"), title: "Don't skip breakfast"),
        Card(cardColor: Color.yellow, title: "Brush up on hygine"),
        Card(cardColor: Color.orange, title: "Neurobics for your mind"),
    ]
    
    @Published var swipedCardsCount: Int = 0
}
