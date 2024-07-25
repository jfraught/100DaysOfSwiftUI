//
//  ContentView.swift
//  Conversions
//
//  Created by Jordan Fraughton on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.kilometers
    @State private var selectedUnits = 0
    
    @FocusState private var inputIsFocused: Bool
    
    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    let unitTypes = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
    let units: [UnitLength] = [.feet, .kilometers, .meters, .miles, .yards]
    let formatter: MeasurementFormatter
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    var result: String {
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount to convert") {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Picker("Conversion", selection: $selectedUnits) {
                    ForEach(0..<conversions.count, id: \.self) {
                        Text(conversions[$0])
                    }
                }

                Picker("Convert from", selection: $inputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }

                Picker("Convert to", selection: $outputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section("Result") {
                    Text(result)
                }
            }
            .navigationTitle("Conversions")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: selectedUnits) {
                let units = unitTypes[selectedUnits]
                inputUnit = units[0]
                outputUnit = units[1]
            }
        }
    }
}

#Preview {
    ContentView()
}
