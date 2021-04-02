//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Ahmed on 4/2/21.
//

import Foundation
private let defaultIcon = " ？"

private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain" : "🌧",
    "Snow" : "❄️",
    "Clear" : "☀️",
    "Clouds" : "☁️",

]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "__"
    @Published var weatherDescription: String = "__"
    @Published var weatherIcon: String = ""
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService)
    self.weath
}
