//
//  BrailleDotView.swift
//  Braille
//
//  Created by Jeevan Choudhary on 17/02/24.
//

import SwiftUI

struct BrailleDotView: View {
    @Binding var state:Int
    @Binding var input:String
    @Binding var cap:String
    @Binding var num:String
    var body: some View {
        HStack {
            
            if state == 0 { // small
                BrailleDot(input: $input, bsize: 80)
                
            } else if state == 1 { // capital
                HStack(spacing: 30) {
                    BrailleDot(input: $cap, bsize: 80)
                    BrailleDot(input: $input, bsize: 80)
                }
            } else if state == 2 { // numerical
                HStack(spacing: 30) {
                    BrailleDot(input: $num, bsize: 80)
                    BrailleDot(input: $input, bsize: 80)
                }
            } else if state == 3 { // special
                HStack(spacing: 30) {
                    BrailleDot(input: $input, bsize: 80)
                }
            }
        }
        .frame(width: 400, height: 400)
        .aspectRatio(1/2, contentMode: .fit)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.blue)
        )
    }
}

