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
    @FocusState private var amountIsFocused:Bool;
    
    //made local currency a property, to improve readability and allow for reusability
    private let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code:
        Locale.current.currency?.identifier  ?? "USD")
    
    
    var grandTotal: Double {
            let tipSelection = Double(tipPercentage)
            let tipValue = checkAmount / 100 * tipSelection
            return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        grandTotal / Double(numberOfPeople + 2)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip precentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much of a tip do you want to leave?")
                }
                
                Section {
                    Text(grandTotal, format: localCurrency)
                } header: {
                    Text("Total Cheque amount")
                }
                
                Section {
                    Text(totalPerPerson, format: localCurrency)
                } header: {
                    Text("Amount per person")
                }
                
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
