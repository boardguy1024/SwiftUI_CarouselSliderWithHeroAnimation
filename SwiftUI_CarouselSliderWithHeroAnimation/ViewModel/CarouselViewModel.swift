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
    
    // Detail Content
    
    @Published var isShowDetail = false
    @Published var selectedCard = Card(cardColor: .clear, title: "")
    @Published var hasShowedDetail = false // detailDescriptionの表示にdelayをかけるため

    var detailDescription = "Hurricane Ida gained power rapidly Sunday as it crossed the Gulf of Mexico on its way to smashing into Louisiana, threatening to unleash mass flooding and destruction in New Orleans. The Category 4 hurricane has top winds of 150 miles (241 kilometers) per hour, the National Hurricane Center said at 7 a.m. local time. Only two other storms on record have made landfall in Louisiana with winds that powerful. I feel sick to my stomach watching,” Eric Blake, a forecaster at the National Hurricane Center said on Twitter. “This is a very sobering morning. Ida is barreling into New Orleans on the 16th anniversary of Hurricane Katrina, one of the most devastating natural disasters in U.S. history. When it hits Sunday, the storm will be the biggest test yet of the region’s levees and infrastructure rebuilt after Katrina."
}
