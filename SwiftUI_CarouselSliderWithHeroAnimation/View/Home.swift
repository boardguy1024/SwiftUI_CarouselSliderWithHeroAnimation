//
//  Home.swift
//  SwiftUI_CarouselSliderWithHeroAnimation
//
//  Created by park kyung seok on 2021/08/18.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var model: CarouselViewModel
    @Namespace var animation
    
    var body: some View {
        
        ZStack {
            VStack {
                
                // Header
                HStack {
                    
                    Button(action: { }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Health Tips")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding()
                
                // Carousel // Card
                
                ZStack {
                    
                    ForEach(model.cards.indices.reversed(), id: \.self) { index in
                        
                        HStack {
                            
                            CardView(card: model.cards[index], animation: animation)
                                .frame(width: getCardWidth(index: index), height: getCardHeight(index: index))
                                .offset(x: getCardOffset(index: index))  // 2. DragGuestureによりここが呼ばれる、Dragした分カードをoffsetする
                                .rotationEffect(.init(degrees: getCardRotation(index: index)))
                            
                            Spacer(minLength: 0)
                        }
                        .frame(height: 400)
                        .offset(x: model.cards[index].offset)
                        .gesture(DragGesture(minimumDistance: 0).onChanged({ value in
                            onChanged(value: value, index: index)
                        }).onEnded({ value in
                            onEnded(value: value, index: index)
                        }))

                        
                       
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 30)
                
                Button(action: resetCards) {
                    
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(.top, 35)
                .matchedGeometryEffect(id: "arrow-button", in: animation)

                Spacer()
            }
            
            // Detail View
            
            if model.isShowDetail {
                DetailView(animation: animation)
            }
        }
        
    }
    
    func resetCards() {
        
        for index in model.cards.indices {
            
            withAnimation(.spring()) {
                model.cards[index].offset = 0
                model.swipedCardsCount = 0
            }
        }
    }
    
    // カードをDragするたびに呼ばれる
    func onChanged(value: DragGesture.Value, index: Int) {
        
        // 1.
        // cardsは「ObservableObject」の「Published」のため、値が変化すると
        // cardsを参照している箇所が描画される（呼ばれる）
        model.cards[index].offset = value.translation.width
    }
    
    func onEnded(value: DragGesture.Value, index: Int) {
        
        withAnimation {
            
            if -value.translation.width > UIScreen.main.bounds.width / 3 {
                
                //画面の左側(見えない部分)にoffsetさせる
                model.cards[index].offset = -UIScreen.main.bounds.width
                
                model.swipedCardsCount += 1
            } else {
                //閾値を超えなかったらカードoffsetを元に戻す
                model.cards[index].offset = 0
            }
        }
    }
    
    // Getting Rotation when card is being swiped.
    func getCardRotation(index: Int) -> Double {
        
        
        let boxWidth = Double(UIScreen.main.bounds.width / 3)
        
        let offset = Double(model.cards[index].offset)
        
        return offset / boxWidth
    }
    
    //カードの高さを決める
    func getCardHeight(index: Int) -> CGFloat {
        let height: CGFloat = 400
        
        let cardHeight: CGFloat = index - model.swipedCardsCount <= 2 ?  CGFloat(index - model.swipedCardsCount) * 30 : 70
        
        // index:0  = 400 - 0 * 30 = 0
        // index:1  = 400 - ((1 - 0) * 30) = 370
        // index:2  = 400 = ((2 - 0) * 30) = 360
        
        // index:3 以降は　見えないので　400 - 70 = 330
        
        //----------------------------------------------------------
        
        // index:0目のカードをDragして非表示にした場合、
        
        // index:1 = 400 - ((1 - 1) * 30) = 400になるので index:0だったときの高さにする
        
        
        return height - cardHeight
    }
    
    func getCardWidth(index: Int) -> CGFloat {
     
        let boxWidth = UIScreen.main.bounds.width - 120
        
        return boxWidth
    }
    
    // Getting Offset
    func getCardOffset(index: Int) -> CGFloat {

        // index:0  = 0
        // index:1  = ((1 - 0) * 30) = 30
        // index:2  = ((2 - 0) * 30) = 60
        
        return index - model.swipedCardsCount <= 2 ?  CGFloat(index - model.swipedCardsCount) * 30 : 60
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
