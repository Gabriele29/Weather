//
//  WeatherDataView.swift
//  Weather
//
//  Created by Gabriele Perillo on 18/11/23.
//

import SwiftUI

struct WeatherDataView: View {
    var body: some View {
        
        VStack(spacing: 8) {
            
            
            CustomStackView {
                
                Label {
                    
                    Text("10-DAY FORECAST")
                    
                } icon: {
                    
                    Image(systemName: "calendar")
                }
                
            } contentView: {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(forecast) {cast in
                        
                        VStack {
                            HStack(spacing: 15) {
                                
                                Text(cast.day)
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                                    .frame(width: 60, alignment: .leading)
                                
                                
                                Image(systemName: cast.image)
                                    .font(.title3)
                                    .symbolVariant(.fill)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.yellow, .white)
                                    .frame(width: 30)
                                
                                Text("\(Int(cast.temperature - 8))°")
                                    .font(.title3.bold())
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(.white)
                                
                                
                                //Progress Bar...
                                ZStack(alignment: .leading) {
                                    
                                    Capsule()
                                        .fill(.tertiary)
                                        .foregroundStyle(.white)
                                    
                                    GeometryReader {proxy in
                                        
                                        Capsule()
                                            .fill(.linearGradient(.init(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing))
                                            .frame(width: (cast.temperature) * 2)
                                        
                                    }
                                    
                                }
                                .frame(height: 4)
                                
                                Text("\(Int(cast.temperature))°")
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                                
                            }
                            
                            Divider()
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            
//            HStack {
//                
//                CustomStackView {
//                    
//                    Label {
//                        
//                        Text("UV INDEX")
//                        
//                    } icon: {
//                        
//                        Image(systemName: "sun.max.fill")
//                    }
//                    
//                } contentView: {
//                    
//                    VStack(alignment: .leading, spacing: 10) {
//                        
//                        Text("2")
//                            .font(.title)
//                            .frame(alignment: .leading)
//                            .bold()
//                        
//                        Text("Low")
//                            .font(.title3)
//                            .frame(alignment: .leading)
//                            .bold()
//                            .fontWeight(.semibold)
//                        
//                    }
//                    
//                    ZStack(alignment: .leading) {
//                        
//                        Capsule()
//                            .fill(.tertiary)
//                            .foregroundStyle(.white)
//                        
//                        GeometryReader {proxy in
//                            
//                            Capsule()
//                                .fill(.linearGradient(.init(colors: [.blue, .cyan, .green, .yellow, .orange, .red, .purple]), startPoint: .leading, endPoint: .trailing))
//                            
//                        }
//                    }
//                    .frame(maxHeight: 4)
//                    .frame(alignment: .center)
//                    Text("Low levels all day")
//                    
//                }
//                .foregroundStyle(.white)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .multilineTextAlignment(.leading)
//            }
        }
    }
}

#Preview {
    ContentView()
}
