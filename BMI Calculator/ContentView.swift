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
    @FocusState private var isEditing: Bool
    
    var body: some View {
        VStack {
            Form {
                Section("Body Metrics") {
                    HStack{
                        Text("Weight")
                            .font(.headline)
                        TextField("kilogram", text: $weight)
                            .multilineTextAlignment(.trailing)
                            .focused($isEditing)
                    }
                    HStack {
                        Text("Height")
                            .font(.headline)
                        TextField("metre", text: $height)
                            .multilineTextAlignment(.trailing)
                            .focused($isEditing)
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
                
                Section("Description") {
                    if let w = Double(weight), let h = Double(height){
                        let bmi = calculateBMI(weight: w, height: h)
                        Text(String(bmiDescription(bmi)))
                    } else {
                        Text("")
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

func bmiDescription(_ bmi: Double) -> String {
    switch bmi {
    case 0 ..< 18.5:
        return "Possible nutritional deficiency and osteoporosis."
    case 18.5 ..< 22.9:
        return "Low risk (healthy range)."
    case 22.9 ..< 27.4:
        return "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus"
    case 27.4 ..< 40:
        return "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome."
    default:
        return ""
    }
}

#Preview {
    ContentView()
}
