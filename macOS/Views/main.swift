//
//  main.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

// MARK: Global variables (variables used below)

// Create the view model
var viewModel = WeatherViewModel()

// MARK: Functions

// Show menu and handle selection
func menu() {
    
    // Loop continuously until user elects to quit
    while true {
        
        print("""
            Menu
            ----
            1 - Show new prediction
            2 - See history of predictions given
            Q - QUIT PROGRAM
            
            Your choice (1/2/Q)?
            """)
        
        // Get user input
        let input = readLine()!
        
        // Handle input
        switch input {
        case "1":
            // Show a new prediction
            showPrediction()
        case "2":
            // See history
            showHistory()
        case "q", "Q":
            // QUIT
            exit(0)
        default:
            continue
        }
        
    }


}

// Show a prediction
func showPrediction() {

    // Get latest prediction
    let prediction = viewModel.providePrediction()
    
    // Show the prediction
    print("")
    print("Current weather")
    print("---------------")
    print("Current conditions are \(prediction.condition.description.lowercased()) with a temperature of \(String(format: "%.1f", arguments: [prediction.temperature])) °C.")

    print("That's \(prediction.feel.lowercased())!")
    print("")

}

// Show the history of predictions
func showHistory() {
    
    print("""
        Previous weather
        ----------------
        """)
    for priorPrediction in viewModel.history {
        print("Conditions: \t\(priorPrediction.condition.description.lowercased())")
        print("Temperature: \t\(String(format: "%.1f", arguments: [priorPrediction.temperature])) °C")
        print("Felt like: \t\t\(priorPrediction.feel.lowercased())")
        print("")
    }
    
    
}


// MARK: Main part of program
print("""
    WEATHER
    =======

    """)

menu()

