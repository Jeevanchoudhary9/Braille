//
//  BrailleCharView.swift
//  Braille
//
//  Created by Jeevan Choudhary on 17/02/24.
//

import SwiftUI

struct BrailleCharView: View {
    @Binding var state:Int
    @Binding var text:String
    
    var body: some View {
        HStack {
            
            Text(text != "" ? (state == 1 ? text.capitalized : text) : "A")
                .font(.system(size: 300))
                .foregroundColor(.white)
            
                .frame(width: 400, height: 400)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.blue)
                )
        }

    }
}

