//
//  Setting.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct info: View {
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color("Color"), Color("Color 1")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Braille")
                    .font(.system(size: 50))
                    .bold()
                Text("-An invisible hand for you")
                    .padding(.leading, 200)
                    .bold()

                    
                    
                                
                 Text("This app is designed to facilitate Braille learning and teaching for both sighted and visually impaired individuals. It includes a feature where sighted users can learn Braille and teach it to visually impaired users. Additionally, the app provides a way to differentiate between Braille dots using sounds and can translate English characters into Braille.")
                    .font(.system(size: 20))
                    .bold()
                    .frame(width: 1000,height: 100)
                    Divider()
                
                Text("Thank you for considering my application. I have invested significant effort in creating this application, and I am excited to submit it to the WWDC24 Swift Student Challenge.")
                    .font(.system(size: 20))
                    .bold()
                    .frame(width: 1000,height: 100)

                VStack(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Jeevan Ramkrishna Choudhary")
                                        .font(.body.bold())
                                    Text("Designer & Developer")
                                        .foregroundColor(.white)
                                }
                                .accessibilityElement(children: .combine)
                    HStack{
                        Link(destination: URL(string: "https://github.com/Jeevanchoudhary9")!) {
                            Label("GitHub", systemImage: "link")
                                .font(.body.bold())
                        }
                        .buttonStyle(.bordered)
                        .tint(.accentColor)
                        
                        Link(destination: URL(string: "https://www.linkedin.com/in/jeevan-choudhary-")!) {
                            Label("Linkedin", systemImage: "link")
                                .font(.body.bold())
                        }
                        .buttonStyle(.bordered)
                        .tint(.accentColor)
                    }
                            }
                            .padding(.top)


            }
            .foregroundColor(.white)
            
        }
    }
}

#Preview {
    info()
}
