//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Stanley Sim on 18/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var weight = ""
    @State private var height = ""
    
    var body: some View {
        VStack {
            Form {
                Section("Body Metrics") {
                    HStack{
                        Text("Weight")
                            .font(.headline)
                        TextField("kilogram", text: $weight)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Height")
                            .font(.headline)
                        TextField("metre", text: $height)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section("Results") {
                    HStack {
                        Text("BMI")
                            .font(.headline)
                        Spacer() // Text view does not have a multilineTextAlignment modifier like TextField.
                        if let w = Double(weight), let h = Double(height){ // Cast String to Double if TextFields have text.
                            Text(String(format:"%.1f", calculateBMI(weight: w, height: h)))
                                .multilineTextAlignment(.trailing)

                        } else {
                            Text("No value").foregroundStyle(.tertiary)
                        }
                    }
                }
            }
        }
    }
}
/*
 * Create a function that takes in two arguments weight and height.
 * Function returns a Double
 */
func calculateBMI(weight: Double, height: Double) -> Double {
    let bmi = weight / pow(height, 2)
    return bmi
}

#Preview {
    ContentView()
}
