//
//  ContentView.swift
//  BullsEye
//
//  Created by Femi Adegbite on 24/08/2020.
//  Copyright © 2020 Efhem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool  = false
    @State var targetValue = Int.random(in: 1...100)
    @State var sliderValue: Double = 50.0
    @State var score = 0
    @State var round = 1
    
    struct LabelStyle: ViewModifier {
        
        func body(content: Content) -> some View {
            return content.foregroundColor(Color.white).shadow(color: Color.black, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
                .modifier(Shadow())
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    
    var body: some View {

        VStack {
            Spacer()
            HStack {
                Text("Put the bulleye as close as you can to:").modifier(LabelStyle())
                Text(" \(targetValue)").modifier(ValueStyle())
            }
            
            Spacer()
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            Button(action: {
                self.alertIsVisible = true
                self.score = self.score + self.pointsForCurrentRound()
            }){Text("Hit me!").modifier(ButtonLargeTextStyle())}.background(Image("Button")).modifier(Shadow())
            .alert(isPresented: $alertIsVisible){ () -> Alert in
                return Alert(title: Text("\(alertTitle())"), message: Text("Your slider value is \(sliderValueRounded())\n" +
                    "You score \(pointsForCurrentRound()) this round"), dismissButton: .default(Text("Awesome")){
                        self.targetValue = Int.random(in: 1...100)
                        self.round = self.round + 1
                    })
            }
            Spacer()
            
            HStack {
                Button(action: {}){HStack {
                    Image("StartOverIcon")
                    Text("Start Over").modifier(ButtonSmallTextStyle())
                    }}.background(Image("Button")).modifier(Shadow())
                
                Spacer()
                Text("Score").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                
                Spacer()
                Text("Round").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                
                Button(action: {}){HStack {
                    Image("InfoIcon")
                    Text("Info").modifier(ButtonSmallTextStyle())
                    }}.background(Image("Button")).modifier(Shadow())
                
            }.padding(.bottom, 20)
            
            }.background(Image("Background")).accentColor(Color.green).navigationBarTitle("Bullseye")
    }
    
    func sliderValueRounded() -> Int {return Int(self.sliderValue.rounded())}
    func pointsForCurrentRound() -> Int {
        return 100 - abs(targetValue - sliderValueRounded())
    }
    
    func alertTitle() -> String {
        let difference = abs(targetValue - sliderValueRounded())
        let title: String
        if difference == 0 {
            title = "Perfect"
        }else if difference < 5{
            title = "You almost had it"
        }else if difference <= 10 {
            title = "Not bad"
        }else {
            title = "Are you even trying"
        }
        return title
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
