//
//  ForecastListViewModel.swift
//  Projet_WeatherApp
//
//  Created by Hubert Page on 29/03/2021.
//

import Foundation
import SwiftUI

class ForecastListViewModel: ObservableObject {
    @Published var forecasts: [ForecastViewModel] = []
    var system: Int = 0
    //@AppStorage("system")var system: Int = 0
    
    /*
    init() {
        if location != "" {
            getWeatherForecast()
        }
    }
 */
    
    func getWeatherForecast() {
        let apiService = APIService.shared

        apiService.getJSON(urlString: "https://api.openweathermap.org/data/2.5/forecast?q=Paris&appid=\(apiKey)",
                           dateDecodingStrategy: .secondsSince1970) { (result: Result<Forecast,APIService.APIError>) in
            switch result {
            case .success(let forecast):
                DispatchQueue.main.async {
                    self.forecasts = forecast.list.map { ForecastViewModel(forecast: $0, system: self.system) }
                }
                
//                for list in forecast.list {
//                    print(dateFormatter.string(from: list.dt))
//                    print("   Température:", list.main.temp) 
//                    print("   Description:", list.weather[0].description)
//                    print("   Icone:", list.weather[0].icon)
//                    print("   URL de l'icone:", list.weather[0].weatherIconURL)
//
//                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    print(errorString)
                }
            }
        }
        
    }
}

