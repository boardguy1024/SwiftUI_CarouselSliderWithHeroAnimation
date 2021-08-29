//
//  ContentView.swift
//  SwiftUI_CarouselSliderWithHeroAnimation
//
//  Created by park kyung seok on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var homeModel = CarouselViewModel()

    var body: some View {
        Home()
        // Using it as Environment Object
            .environmentObject(homeModel)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
