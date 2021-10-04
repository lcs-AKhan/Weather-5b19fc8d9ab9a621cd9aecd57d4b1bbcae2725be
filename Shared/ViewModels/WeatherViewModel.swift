//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    // Create an empty list to keep track of predictions made
    @Published var history: [Prediction] = []
    
    init() {
        // Generate several predictions right away
        for _ in 1...3 {
            // Invoke providePrediction method (part of this class)
            // to generate and save a prediction
            _ = self.providePrediction()
        }
    }

    // Give a predicction
    func providePrediction() -> Prediction {
        
        // Generate a weather prediction
        let prediction = WeatherPredictionGenerator.getPrediction()

        // Save the prediction
        history.append(prediction)

        // Return the prediction
        return prediction
        
    }
    
}
