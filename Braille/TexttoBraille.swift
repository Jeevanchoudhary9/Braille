//
//  TexttoBraille.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct TexttoBraille: View {
    @State var paragraph = "Hi WWDC"
    @State var isEditing = false
    @State var input: [String] = ["6","134", "23", " ", "6","2346","6","2346","6","124","6","12"]
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
                    ScrollView(.horizontal,showsIndicators: false){
                        
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
                                                    .stroke(shouldFill ? Color.white : Color.clear, lineWidth: 2)
                                                    .frame(width: CGFloat(bsize), height: CGFloat(bsize))
                                            }
                                        }
                                    }
                                }.padding(.horizontal, 5)
                            }
                        }
                        .frame(height: 200)
                    }
                    .accessibility(label: Text("Braille Translation it can be Scrolled"))
                    .frame(width: 800, height: 200)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue)
                    )}
                ZStack{
                VStack{
                    if isEditing {
                        TextField("", text: $paragraph)
                        
                            .onChange(of: paragraph, perform: { value in
                                updateBrailleText(braile: $input, paragraph: $paragraph)
                            })
                            .onTapGesture {
                                isEditing = true
                            }
                        
                    } else {
                        Text(paragraph)
                        
                        
                    }
                }.foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                    .frame(width: 800, height: 200)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue)
                    )
                    .onTapGesture {
                        isEditing = true
                        
                    }
                    .accessibility(label: Text("Enter Message To Translate"))
                    
                }

            }
        }
    }

    func updateBrailleText(braile: Binding<[String]>, paragraph: Binding<String>) {
        var brailleValues:[String] = []
        for char in paragraph.wrappedValue {
            if char.isUppercase{
                brailleValues.append("6")
            }else if char.isNumber{
                brailleValues.append("2456")
            }
            let brailleChar = convertToBraille(String(char.lowercased()))
            brailleValues.append(brailleChar)
        }
        input = brailleValues
    }
}




