//
//  TexttoBraille.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct TexttoBraille: View {
    @State var paragraph = "Hi"
    @State var isEditing = false
    @State var input: [String] = ["134", "23"]
    @State var bsize: Int = 10
    let rows = 3
    let columns = 2
    @State var input1: [String] = []

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Color"), Color("Color 1")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    HStack {
                        ForEach(input, id: \.self) { letter in
                            VStack {
                                ForEach(Array(0..<rows), id: \.self) { row in
                                    HStack {
                                        ForEach(Array(0..<columns), id: \.self) { column in
                                            let dotNumber = row * columns + column + 1
                                            let shouldFill = letter.contains("\(dotNumber)")
                                            let index = row * columns + column
                                            Circle()
                                                .fill(shouldFill ? Color.white : Color.clear)
                                                .stroke(Color.white, lineWidth: 2)
                                                .frame(width: CGFloat(bsize), height: CGFloat(bsize))
                                        }
                                    }
                                }
                            }.padding(.horizontal, 5)
                        }
                    }
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
                        .onChange(of: paragraph, perform: { value in
                            updateBrailleText(braile: $input, paragraph: $paragraph)
                        })
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

    func updateBrailleText(braile: Binding<[String]>, paragraph: Binding<String>) {
        var braileValue = braile.wrappedValue
        for letter in paragraph.wrappedValue {
            print(letter)
            braileValue.append(convertToBraille(String(letter)))
        }
        braile.wrappedValue = braileValue
        print(paragraph.wrappedValue)
        print(braileValue)
    }

}




