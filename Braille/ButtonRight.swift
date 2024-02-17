//
//  ButtonRight.swift
//  Braille
//
//  Created by Jeevan Choudhary on 17/02/24.
//

import SwiftUI

struct ButtonRight: View {
    @Binding var counter:Int
    @Binding var state:Int
    @State var letters:[String]
    @State var special:[String]
    @Binding var selectedid:String
    @Binding var text:String
    @State var numbers:[String]
    @Binding var input:String
    var body: some View {
        Button(action: {
            updateSelectionRight(counter: &counter, state: &state, letters: letters, numbers: numbers, special: special, selectedid: &selectedid, text: &text, input: &input)
        }) {
            
        }
        .padding()
    }
}

func updateSelectionRight(counter: inout Int, state: inout Int, letters: [String], numbers: [String], special: [String], selectedid: inout String, text: inout String, input: inout String) {
    counter += 1
    
    if counter >= letters.count && state == 0 {
        counter = 0
        state = 1
        selectedid = letters[counter]
        text = selectedid
    } else if counter >= letters.count && state == 1 {
        counter = 0
        state = 2
        selectedid = String(numbers[counter])
        text = selectedid
    } else if counter >= numbers.count && state == 2 {
        counter = 0
        state = 3
        selectedid = special[counter]
        text = selectedid
    } else if counter >= special.count && state == 3 {
        counter = 0
        state = 0
        selectedid = letters[counter]
        text = selectedid
    } else {
        if state == 0 || state == 1 {
            selectedid = letters[counter]
            text = selectedid
        } else if state == 2 {
            selectedid = String(numbers[counter])
            text = selectedid
        } else if state == 3 {
            selectedid = special[counter]
            text = selectedid
        }
    }
    
    input = convertToBraille(selectedid)
}
