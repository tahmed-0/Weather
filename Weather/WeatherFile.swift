//
//  WeatherFile.swift
//  Weather
//
//  Created by Ahmed on 4/1/21.
//

//model class


import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let IconName: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        IconName = response.weather.first?.IconName ?? ""
    }
}

