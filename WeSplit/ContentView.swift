//
//  ContentView.swift
//  WeSplit
//
//  Created by A11AN0.

/*
content view - contains the main UI for program, majority of
 where we'll be spending time lolo
 
 heaps of different frameworks for work e.g.
 machine learning, audio playback, audio maniputation, etc.
 
 hold the option key and hover over to d
isplay info about method/ variable etc
 a question mark will appear
 
 OPTION + COMMAND + P } Important shortcut for resume of the canvas
 
 OPTION + COMMAND + ENTER} to toggle the canvas view too!
 
 COMMAND + R} to build and run code
 
 Swift UI will only allow a MAX of 10 children in an element - just a limitation, e.g. a form will only allow 5 things.
 
 In order to have more than 10 elements, e.g. in a form - use Groups(which in themselves, will only allow max of 10 items- however groups don't create distinct sections,
 
 For distinct visual sections to separates items, use the sections struct
 
 also use COMMAND + 2 to open the version control sidebar
 */


import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0;
    @State private var numberOfPeople = 2;
    @State private var tipPercentage = 0;
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        //calculate total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (tipSelection/100) * checkAmount
        return (checkAmount + tipValue)/peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip precentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much of a tip do you want to leave?")
                }
                
                
                Section {
                    Text(totalPerPerson, format: .currency(code:
                        Locale.current.currency?.identifier ?? "USD"))
                }
                
                
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
