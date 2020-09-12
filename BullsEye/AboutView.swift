//
//  AboutView.swift
//  BullsEye
//
//  Created by Femi Adegbite on 12/09/2020.
//  Copyright © 2020 Efhem. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Text("🎯 Bullseye 🎯")
            Text("This is bullseye, the game you can win points and earn fame by dragging a slider")
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you socre.")
            Text("Enjoy!")
            
        }
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
