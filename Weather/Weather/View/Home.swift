//
//  Home.swift
//  Weather
//
//  Created by Gabriele Perillo on 14/11/23.
//

import SwiftUI

struct Home: View {
    @State var offset: CGFloat = 0
    var topEdge: CGFloat
    
    var body: some View {
        ZStack {
            
            // Using Geometry Reader to get height and width...
            GeometryReader {proxy in
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                
            }
            .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 5) {
                
                Section {
                    
                    Text("My Location")
                        .font(.system(size: 35))
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                    Text("NAPLES")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                        .bold()
                    
                } header: {
                    
                   
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Section {
                            
                            VStack {
                                
                                ZStack {
                                    
                
                                    Text("18")
                                        .font(.system(size: 80))
                                        .fontWeight(.thin)
                                        .foregroundStyle(.white)
                                        .shadow(radius: 5)
                                        .padding(.top, -5)
                                        .opacity(getTitleOpactiy())
                                    
                                    Text("°")
                                        .font(.system(size: 80))
                                        .fontWeight(.thin)
                                        .foregroundStyle(.white)
                                        .shadow(radius: 5)
                                        .padding(.top, -5)
                                        .offset(x: 55)
                                        .opacity(getTitleOpactiy())
                                }
                                
                                Text("Sunny")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                    //.padding(.top, -5)
                                    .opacity(getTitleOpactiy())
                                
                                Text("H:21º L:15º")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                    .opacity(getTitleOpactiy())
                                
                            }
                            
                        }
                    
                    .padding(.top, -40)
                    .padding(.bottom, 60)
                    //.offset(y: -offset)
                    // For the drag effect...
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    // Custom Data View...
                    VStack(spacing: 8) {
                        
                        CustomStackView {
                            
                            Label {
                                
                                Text("AIR QUALITY")
                                
                            } icon: {
                                
                                Image(systemName: "aqi.low")
                            }
                            
                        } contentView: {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Normal")
                                    .font(.title2)
                                    .frame(alignment: .leading)
                                    .bold()
                                
                            }
                            
                            ZStack(alignment: .leading) {
                                
                                Capsule()
                                    .fill(.tertiary)
                                    .foregroundStyle(.white)
                                
                                GeometryReader {proxy in
                                    
                                    Capsule()
                                        .fill(.linearGradient(.init(colors: [.blue, .cyan, .green, .yellow, .orange, .red, .purple]), startPoint: .leading, endPoint: .trailing))
                                    
                                }
                                
                                CircleView()
                                    

                            }
                            .frame(height: 4)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                            Text("Air quality is worse than yesterday at about this time.")
                                
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

                        
                            CustomStackView {
                                
                                Label {
                                    
                                    Text("HOURLY FORECAST")
                                    
                                } icon: {
                                    
                                    Image(systemName: "clock")
                                }
                                
                            } contentView: {
                                
                                // Content...
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    HStack(spacing: 15) {
                                        
                                        ForecastView(time: "12", celcius: 20, image: "sun.max", colour1: .yellow, colour2: .white)
                                        
                                        ForecastView(time: "13", celcius: 20, image: "sun.max", colour1: .yellow, colour2: .white)
                                        
                                        ForecastView(time: "14", celcius: 20, image: "cloud.sun.fill", colour1: .white, colour2: .yellow)
                                        
                                        ForecastView(time: "15", celcius: 20, image: "sun.max", colour1: .yellow, colour2: .white)
                                        
                                        ForecastView(time: "16", celcius: 19, image: "cloud.sun.fill", colour1: .white, colour2: .yellow)
                                        
                                        ForecastView(time: "17", celcius: 19, image: "sunset.fill", colour1: .white, colour2: .yellow)
                                        
                                        ForecastView(time: "18", celcius: 18, image: "moon.stars.fill", colour1: .white, colour2: .white)
                                    }
                                }
                                
                                
                            }
                        WeatherDataView()
                            
                    }
                }
                .padding(.top, 25)
                .padding([.horizontal, .bottom])
                
                // Getting Offset...
                .overlay(
                    
                    GeometryReader {proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            
                            self.offset = minY
                        }
                        
                        return Color.clear
                        
                    }
                )
            }
        }
    }
    
    func getTitleOpactiy()->CGFloat {
        
        let titleOffset = -getTitleOffset ()
        
        let progress = titleOffset / 20
        
        let opacity = 1 - progress
        
        return opacity
    }
    
    func getTitleOffset()->CGFloat {
        
        // Setting max (160) height...
        if offset < 0 {
            let progress = -offset / 180
            
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            
            return -newOffset
        }
        return 0
    }
}

#Preview {
    ContentView()
}

struct ForecastView: View {
    var time: String
    var celcius: CGFloat
    var image: String
    var colour1: Color
    var colour2: Color
    
    
    var body: some View {
        VStack(spacing: 15) {
            
            Text(time)
                .font(.callout.bold())
                .foregroundStyle(.white)
            
            Image(systemName: image)
                .font(.title2)
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(colour1, colour2)
            
            
            Text("\(Int(celcius))°")
                .font(.callout.bold())
                .foregroundStyle(.white)
            
        }
        .padding(.horizontal, 10)
    }
}
//
