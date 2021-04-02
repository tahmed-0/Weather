//
//  WeatherService.swift
//  Weather
//
//  Created by Ahmed on 4/1/21.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject {
    
    private let locationMangager = CLLocationManager()
    private let API_Key = "991bfed43704062ad41ec93b56669a71"
    private var completionHandler: ((Weather) -> Void)?
    
    public override init() {
        super.init()
        locationMangager.delegate.self
        
    }
    
    public func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)) {
        self.completionHandler = completionHandler
        locationMangager.requestWhenInUseAuthorization()
        locationMangager.startUpdatingLocation()
    
    }
    
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_Key)&units=metric"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error  in
            guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response))
            }
        }.resume()
        
    }
    
}
extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else  { return }
            makeDataRequest(forCoordinates: location.coordinate)
        }
    public func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Something went wrong: \(error.localizedDescription)")
    }
    
}

    


//response from API

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
    
}

struct APIWeather: Decodable {
    let description: String
    let IconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case IconName = "main"
    }
}
