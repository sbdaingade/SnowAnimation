//
//  ContentView.swift
//  christmasSnowAnimation
//
//  Created by Sachin Daingade on 14/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack  {
            ChristmasView().ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}


struct ChristmasView: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .foregroundColor(.black).opacity(0.8)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
            EmitterView()
                .scaleEffect(1, anchor: .top)
                .opacity(1)
                .ignoresSafeArea()
        }
    }
}
