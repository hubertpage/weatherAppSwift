//
//  ContentView.swift
//  Projet_WeatherApp
//
//  Created by Hubert Page on 28/03/2021.
//
import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    
   @StateObject private var forecastListVM = ForecastListViewModel()

        
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $forecastListVM.system, label: Text("System")) {
                    Text("℃").tag(0)
                }
                .pickerStyle(SegmentedPickerStyle()).frame(width: 100).padding(.vertical)
                HStack {
                    //TextField("Enter Location", text: $location).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        forecastListVM.getWeatherForecast()
                    } label: {
                        Text("Actualiser").font(.title3)
                    }
                }
                
                List(forecastListVM.forecasts, id: \.day) { day in
                        VStack(alignment: .leading) {
                            Text(day.day)
                            HStack(alignment: .center ){
                                WebImage(url: day.weatherIconURL)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 75)
                                VStack(alignment: .leading){
                                    Text(day.overview)
                                    HStack {
                                        Text(day.temp)
                                    }
                                    
                                }
                            }
                        }
                        
                    }
            }
            .padding(.horizontal)
            .navigationTitle("Météo de Paris")
        }
        
        
    }
    
}
    
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


