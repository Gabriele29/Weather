//
//  ContentView.swift
//  Weather
//
//  Created by Gabriele Perillo on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader { proxy in
            
            let topEdge = proxy.safeAreaInsets.top
            
            Home(topEdge: topEdge)
              //.ignoresSafeArea(.all, edges: .top)
            
        }
    }
}

#Preview {
    ContentView()
}
