//
//  Forecast.swift
//  Weather
//
//  Created by Gabriele Perillo on 18/11/23.
//

import Foundation
import SwiftUI

struct DayForecast: Identifiable {
    
    var id = UUID().uuidString
    var day: String
    var temperature: CGFloat
    var image: String
    
}

var forecast = [
    
    DayForecast(day: "Today", temperature: 20, image: "sun.max"),
    DayForecast(day: "Mon", temperature: 23, image: "sun.max"),
    DayForecast(day: "Tue", temperature: 18, image: "sun.max"),
    DayForecast(day: "Wed", temperature: 21, image: "sun.max"),
    DayForecast(day: "Thu", temperature: 20, image: "sun.max"),
    DayForecast(day: "Fri", temperature: 19, image: "sun.max"),
    DayForecast(day: "Sat", temperature: 20, image: "sun.max"),
    DayForecast(day: "Sun", temperature: 22, image: "sun.max"),

]
    
