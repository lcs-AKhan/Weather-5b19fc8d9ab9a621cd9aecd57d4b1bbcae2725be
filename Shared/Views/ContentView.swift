//
//  ContentView.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    
    // Because the properties have no default values,
    // the call site must provide arguments to populate them
    
    @ObservedObject var viewModel: WeatherViewModel
    
    @State var temperature: Double
    
    @State var feel: String = ""

    @State var conditions: String
    
    @State var weatherImage: String = ""

    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                VStack {
                                    
                    Image("\(weatherImage)")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("\(conditions)")
                        .foregroundColor(.white)
                    #if os(iOS)
                        .font(.title)
                    #else
                        .font(.title3)
                    #endif
                    
                    Text("\(String(format: "%.1f", arguments: [temperature])) °C")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("\(feel)")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                }

                Spacer()
                
                Button {
                    
                    // Get a new prediction from the view model
                    let prediction = viewModel.providePrediction()
                    
                    // Populate state variables so the user interface updates
                    temperature = prediction.temperature
                    feel = "\(prediction.feel)"
                    conditions = prediction.condition.description
                    getImage(condition: prediction.condition.description)
                    
                    
                } label: {
                    Text("Get New Prediction")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(.white)
                        .background(RoundedRectangle( cornerRadius: 20).foregroundColor(.black))
                    
                }
                .padding(.horizontal, 5.0)
                
                Spacer()

                
            }
        }
        .navigationTitle("Current")
        
    }
    func getImage(condition: String) {
        if condition == "Sunny/Clear" {
            weatherImage = "sunny"
        } else if condition == "Partially cloudy" {
            weatherImage = "cloudy"
        } else if condition == "Cloudy" {
            weatherImage = "cloudy"
        } else if condition == "Overcast" {
            weatherImage = "cloudy"
        } else if condition == "Rain" {
            weatherImage = "rain"
        } else if condition == "Drizzle" {
            weatherImage = "rain"
        } else if condition == "Snow" {
            weatherImage = "snow"
        } else {
            weatherImage = "wind"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    //
    @StateObject private static var viewModel = WeatherViewModel()
    
    static var previews: some View {
        ContentView(viewModel: viewModel,
                    temperature: viewModel.history.last!.temperature,
                    feel: viewModel.history.last!.feel,
                    conditions: viewModel.history.last!.condition.description)
    }
}
