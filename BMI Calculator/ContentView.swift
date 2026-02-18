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
                        if let w = Double(weight), let h = Double(height){
                            Text(String(calculateBMI(weight: w, height: h)))

                        } else {
                            Text("")
                        }
                    }
                    
                }
            }
        }
    }
}

func calculateBMI(weight: Double, height: Double) -> Double {
    let bmi = weight / pow(height, 2)
    return bmi
}

#Preview {
    ContentView()
}
