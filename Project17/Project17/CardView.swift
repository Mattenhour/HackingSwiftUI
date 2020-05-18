//
//  CardView.swift
//  Project17
//
//  Created by Matt Ridenhour on 5/8/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI

//struct CardColor: ViewModifier {
//    @State private var isDragging: Bool
//    @State private var offset: CGSize
//
//    func body(content: Conent) -> some View {
//
//    }
//}

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    
    let card: Card
    var removal: ((_ isWrongAnswer: Bool) -> Void)? = nil
    
    @State private var isShowingAnswer = false
    
    @State private var offset = CGSize.zero
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                        ? Color.white
                        : Color.white
                            .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    differentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(cardColor(offset))
                )
                .shadow(radius: 10)
            
            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
            
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibility(addTraits: .isButton)
            
        .gesture(
            DragGesture()
            
            .onChanged { gesture in
                self.offset = gesture.translation
                self.feedback.prepare()
            }
                
            .onEnded { _ in
                if abs(self.offset.width) > 100 {
                    
                    // Error hapitic when swiping left
                    if self.offset.width < 0 {
                        self.feedback.notificationOccurred(.error)
                        self.removal?(true)
                    } else {
                        self.removal?(false) // ? means closure will only be called if it has been set
                    }
                    
                } else {
                    self.offset = .zero
                }
            }
        )
            .onTapGesture {
                self.isShowingAnswer.toggle()
        }
        .animation(.spring())
    }
    
    func cardColor(_ offset: CGSize) -> Color {
        if offset == .zero {
            return Color.white
        } else if offset.width > 0 {
            return Color.green
        } else {
            return Color.red
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
