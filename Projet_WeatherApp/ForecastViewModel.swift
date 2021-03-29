//
//  ForecastViewModel.swift
//  Projet_WeatherApp
//
//  Created by Hubert Page on 29/03/2021.
//

import Foundation

struct ForecastViewModel {
    let forecast: Forecast.List
    var system: Int
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    
    private static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    func convert(_ temp: Double) -> Double {
        let celsius = temp - 273.5
        if system == 0 {
            return celsius
        } else {
            return celsius * 9 / 5 + 32
        }
    }
 
    
    var day: String {
        return Self.dateFormatter.string(from: forecast.dt)
    }
    
    var overview: String {
        return forecast.weather[0].description.capitalized
    }
    
    
    var temp: String {
        return " 🌡 Température: \(Self.numberFormatter.string(for: convert(forecast.main.temp))  ?? "0") ℃"
    }
    
    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(forecast.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
    
}
