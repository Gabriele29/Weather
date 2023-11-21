//
//  CircleView.swift
//  Weather
//
//  Created by Gabriele Perillo on 21/11/23.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        
        ZStack {
            Circle()
                .fill(.mycolor)
                .frame(width: 90, height: 5)
                .blur(radius: 3.0)
            Circle()
                .fill(.white)
                .frame(width: 10, height: nil)
        }
    }
}

#Preview {
    CircleView()
}
