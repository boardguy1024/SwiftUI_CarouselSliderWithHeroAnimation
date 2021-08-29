//
//  DetailView.swift
//  SwiftUI_CarouselSliderWithHeroAnimation
//
//  Created by park kyung seok on 2021/08/29.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var model: CarouselViewModel
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            
            Text("Monday 28 December")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Date-\(model.selectedCard.id)", in: animation)
            
            HStack {
                Text(model.selectedCard.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)

                Spacer()
            }
            
            
            if model.hasShowedDetail {
                Text(model.detailDescription)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
            }
         
            Spacer()
            
           
            if model.hasShowedDetail {
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "arrow.down")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(.top, 35)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            model.selectedCard.cardColor
                .cornerRadius(25)
                
                .matchedGeometryEffect(id: "bgColor-\(model.selectedCard.id)", in: animation)
                .ignoresSafeArea(.all, edges: .bottom)

        )
        .onTapGesture {
            
            closeView()
        }
        
    }
    
    func closeView() {
        withAnimation(.spring()) {
            model.isShowDetail.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                withAnimation(.easeOut) {
                    model.hasShowedDetail = false

                }
            }
        }
    }
}
