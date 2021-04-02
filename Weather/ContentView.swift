//
//  ContentView.swift
//  Weather
//
//  Created by Ahmed on 4/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Los Angeles")
                .font(.largeTitle)
                .padding()
            Text("25°C")
                .font(.system(size: 70))
                .bold()
            Text("⛅️")
                .font(.largeTitle)
                .padding()
            Text("Clear Sky")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
