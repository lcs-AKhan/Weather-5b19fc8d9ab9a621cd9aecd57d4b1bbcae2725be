//
//  HistoryView.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        // Show the list of questions and responses
        List(viewModel.history.reversed()) { prediction in
            VStack(alignment: .leading) {
                Text("\(prediction.condition.description)")
                    .font(.title)

                Text("\(String(format: "%.1f", arguments: [prediction.temperature])) °C")
                    .font(.largeTitle)
                    .bold()
                
                Text("\(prediction.feel)")
                    .font(.title3)
            }
        }
        .padding()
        .navigationTitle("History")

    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
