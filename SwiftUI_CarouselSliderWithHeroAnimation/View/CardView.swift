//
//  CardView.swift
//  SwiftUI_CarouselSliderWithHeroAnimation
//
//  Created by park kyung seok on 2021/08/29.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model: CarouselViewModel
    
    var card: Card
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            Text("Monday 28 December")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Date-\(card.id)", in: animation)
            
            HStack {
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "Title-\(card.id)", in: animation)

                Spacer()
            }
          
            Spacer(minLength: 0)

            
            HStack {
                
                Spacer(minLength: 0)
                
                if !model.hasShowedDetail {
                    Text("Read More")
                    
                    Image(systemName: "arrow.right")
                }
              
            }
            .foregroundColor(Color.white.opacity(0.9))
            .padding(30)
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            card.cardColor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation)
        )
        .onTapGesture {
            
            withAnimation(.spring()) {
                model.selectedCard = card
                model.isShowDetail.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn) {
                        model.hasShowedDetail = true
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
