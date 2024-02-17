//
//  TexttoBraille.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct TexttoBraille: View {
    @State private var paragraph = "Hello, world!"
    @State private var isEditing = false
    var size:Int = 40
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Color"), Color("Color 1")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("\(convertToBraille("b"))")
//                    @State var a = convertToBraille("b")
//                    BrailleDot(input: &a , bsize: size)
//                    ForEach(paragraph, id: \.self) { char in
//                        let brailleCode = convertToBraille(char)
//                        Text(brailleCode)
//                            .foregroundColor(.white)
//                    }


                }.frame(width: 800, height: 200)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.blue)
                )
                
                if isEditing {
                    TextField("", text: $paragraph)
                        .foregroundColor(.white)
                        .frame(width: 800, height: 200)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue)
                        )
                        .onTapGesture {
                            isEditing = true
                        }
                } else {
                    Text(paragraph)
                        .foregroundColor(.white)
                        .frame(width: 800, height: 200)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue)
                        )
                        .onTapGesture {
                            isEditing = true
                        }
                }
            }
        }
    }
    
    
}



#Preview {
    TexttoBraille()
}
