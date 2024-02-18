//
//  Introduction.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import SwiftUI

struct Introduction: View {
    @State private var offset: CGFloat = 0
    @State var statecounter:Bool = false
    @State var conversecounter:Int = 1
    @State var conversemessage:String = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Color"), Color("Color 1")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            
            if statecounter == false{
                VStack(alignment: .leading, spacing: 32) {
                IntroductionTemp(imageName: "books.vertical.fill", title: "Learn and Teach", description: "Introducing an app for the visually impaired, providing essential tools and a platform for learning and teaching Braille")
                
                IntroductionTemp(imageName: "bubble.left.and.text.bubble.right.fill", title: "Translation", description: "Explore a feature that presents the English alphabet alongside their Braille equivalents, enhancing accessibility.")
                IntroductionTemp(imageName: "hand.point.up.braille", title: "Interaction", description: "Experience a function that uses sound to interpret and translate Braille characters, offering a new way to interact with the world.")
            }
                .frame(maxWidth: 700, maxHeight: .infinity, alignment: .center)
            }else if statecounter == true{
                HStack{
                    
                    
                        boyconverse(conversecounter: conversecounter)
                                Spacer()
                        girlconverse(conversecounter: conversecounter)
                }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                        withAnimation {
                            if conversecounter < 11 {
                                conversecounter += 1
                            } else {
                                timer.invalidate()
                            }
                        }
                    }
                }

            }
            
        }
        
        .edgesIgnoringSafeArea(.all)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        
                    }
                    
                    .onEnded { gesture in
                        if gesture.translation.width > 0 {
                            // code to excute after run
                             statecounter.toggle()
                            
                                      }
                        
                        else if gesture.translation.width < 0{
                            statecounter.toggle()
                        }
                        self.offset = 0
                    }
            )
            .accessibility(label: Text("Swipe Right to Left for Forward"))
            .accessibility(label: Text("Swipe Left to Right for Backward"))

    }
}

#Preview {
    Introduction()
}

struct boyconverse: View {
    var conversecounter:Int
    var text: String {
            if conversecounter == 2 {
                return "Buddy, did you know you can use Braille? It's a system that allows you to understand text by touching it."
            } else if conversecounter == 4{
                return "I'm not familiar with the characters of Braille."
            } else if conversecounter == 6{
                return "Don't worry, I know something that can help."
            }else if conversecounter == 8{
                return "It's a Braille app. With it's help I can teach you."
            }else if conversecounter == 10{
                return "It has a feature where if you click on Braille, it will produce a sound, allowing you to differentiate between characters."
            }
            else {
                return ""
            }
        }
    
    var body: some View {
        
        Image("boywithbook")
            .resizable()
            .frame(width: 300, height: 300)
            .padding(40)
            .padding(.top,300)
        
        if conversecounter%2 == 0{
            HStack {
                Text(text)
                    .font(.system(size: 20))
                    .frame(width: 300)
                    .bold()
            }
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .foregroundColor(Color.white)
            .padding(.horizontal,-40)
            .padding(.bottom,0)
        }
    }
    
}

struct girlconverse: View {
    var conversecounter:Int
    
    var text: String {
            if conversecounter == 1 {
                return "Bro, I also want to read books like you do"
            } else if conversecounter == 3{
                return "Could you teach me?"
            } else if conversecounter == 5{
                return "Oh no!"
            }else if conversecounter == 7{
                return "what is it?"
            }else if conversecounter == 9{
                return "how can I learn?"
            }else if conversecounter == 11{
                return "that will be great!"
            }
            else {
                return ""
            }
        }
    
    var body: some View {
        HStack{
            if conversecounter%2 != 0 {
                HStack {
                    Text(text)
                        .font(.system(size: 20))
                        .frame(width: 300)
                        .bold()
                }
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .foregroundColor(Color.white)
                .padding(.horizontal,-40)
                .padding(.bottom,400)
            }
            
            Image("blindgirl")
                .resizable()
                .frame(width: 300, height: 300)
        }
    }
}
