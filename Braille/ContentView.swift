import SwiftUI

struct ContentView: View {
    @State private var text: String = "a"
    @State private var selectedid: String = "a"
    @State private var state: Int = 0
    @State private var counter: Int = 0
    @State private var cap: String = "6"
    @State private var num: String = "2456"
    @State private var statetext = ["Small","Capital","Numerical","Special"]
    @State private var input: String = "1"
    @State var buttontext: String = "Next"
    @State private var letters = ["a", "b", "c", "d","e", "f", "g", "h", "i", "j", "k", "l", "m", "n","o", "p", "q", "r", "s", "t", "u", "v", "w", "x","y", "z"]
    @State private var special = [" ",".",",","?",":",";","-","/","<",">","!","(",")"]
    @State private var numbers = ["0", "1", "2", "3", "4", "5", "6", "7","8", "9"]



    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Color"), Color("Color 1")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {Spacer()
                
                HStack {
                    Button(action: {
                        counter -= 1
                        
                        if counter < 0 {
                            if state == 0 {
                                state = 3
                                counter = special.count - 1
                                selectedid = special[counter]
                                text = selectedid
                            } else if state == 1 {
                                state = 0
                                counter = letters.count - 1
                                selectedid = letters[counter]
                                text = selectedid
                            } else if state == 2 {
                                state = 1
                                counter = letters.count - 1
                                selectedid = letters[counter]
                                text = selectedid
                            } else if state == 3 {
                                state = 2
                                counter = numbers.count - 1
                                selectedid = numbers[counter]
                                text = selectedid
                            }
                        } else {
                            if state == 0 || state == 1 {
                                selectedid = letters[counter]
                                text = selectedid
                            } else if state == 2 {
                                selectedid = numbers[counter]
                                text = selectedid
                            } else if state == 3 {
                                selectedid = special[counter]
                                text = selectedid
                            }
                        }
                        input = convertToBraille(selectedid)
                    }) {
                        Rectangle()
                            .frame(width: 80, height: 160)
                            .background(Color("Color 2").opacity(1))
                            .overlay(Image(systemName: "arrow.backward").font(.system(size: 50)).foregroundColor(.white).bold())
                            
                        
                            .foregroundColor(.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.blue)
                            )
                            .cornerRadius(15.0)
                    }
                    .padding()
                    
                    Spacer()
                    VStack {
                        if state == 0{ // small
                            BrailleDot(input: $input, bsize: 80)
                        }
                        else if state == 1{  // capital
                            HStack(spacing: 30){
                                BrailleDot(input: $cap, bsize: 80)
                                BrailleDot(input: $input, bsize: 80)
                            }
                        }
                        else if state == 2{  // numerical
                            HStack(spacing: 30){
                                BrailleDot(input: $num, bsize: 80)
                                
                                BrailleDot(input: $input, bsize: 80)
                            }
                        }
                        else if state == 3{    // special
                            HStack(spacing: 30){
                                
                                BrailleDot(input: $input, bsize: 80)
                                
                            }
                        }
                        
                    }
                    .frame(width: 400,height: 400)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue)
                    )
                    
                    
                    
                    VStack {
                        
                        Text(text != "" ? (state == 1 ? text.capitalized : text) : "A")
                            .font(.system(size: 300))
                            .foregroundColor(.white)
                        
                    }
                    
                    .frame(width: 400, height: 400)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue)
                    )
                    
                    
                    
                    Spacer()
                    Button(action: {
                        counter += 1
                        
                        if counter >= letters.count && state == 0 {
                            counter = 0
                            state = 1
                            selectedid = letters[counter]
                            text = selectedid
                        }
                        else if counter >= letters.count && state == 1 {
                            counter = 0
                            state = 2
                            selectedid = numbers[counter]
                            text = selectedid
                        }
                        else if counter >= numbers.count && state == 2 {
                            counter = 0
                            state = 3
                            selectedid = special[counter]
                            
                            text = selectedid
                        }
                        else if counter >= special.count && state == 3 {
                            counter = 0
                            state = 0
                            selectedid = letters[counter]
                            text = selectedid
                        }
                        else{
                            if state == 0 || state == 1{
                                selectedid = letters[counter]
                                text = selectedid
                            }
                            else if state == 2{
                                selectedid = numbers[counter]
                                text = selectedid
                            }
                            else if state == 3{
                                selectedid = special[counter]
                                text = selectedid
                            }
                        }
                        
                        
                        input = convertToBraille(selectedid)
                    }) {
                        Rectangle()
                            .frame(width: 80, height: 160)
                            .background(Color("Color 2").opacity(1))
                            .overlay(Image(systemName: "arrow.forward").font(.system(size: 50)).foregroundColor(.white).bold())
                        
                            .foregroundColor(.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.blue)
                            )
                            .cornerRadius(15.0)
                            .padding()
                    }
                }
                Spacer()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                       ForEach(statetext.indices, id: \.self) { index in
                           HStack {
                               let text = statetext[index]
                               Button(action: {
                                   state = index
                                   if state == 0 {
                                       self.text = "a"
                                       self.selectedid = "a"
                                       counter = 0
                                   } else if state == 1 {
                                       self.text = "A"
                                       self.selectedid = "a"
                                       counter = 0
                                   } else if state == 2 {
                                       self.text = "0"
                                       self.selectedid = "0"
                                       counter = 0
                                   } else if state == 3 {
                                       self.text = " "
                                       self.selectedid = " "
                                       counter = 0
                                   }
                               }) {
                                   Rectangle()
                                       .frame(width: 150, height: 50)
                                       .background(state == index ? Color.white.opacity(1) : Color.clear)
                                       .overlay(Text("\(text)").font(.system(size: 25)).foregroundColor(state == index ? .black : .white).bold())
                                       .foregroundColor(.clear)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: 20)
                                               .stroke(Color.white)
                                       )
                                       .cornerRadius(15.0)
                               }
                           }

                       }
                   }
                   .padding(.horizontal, 40)
                   .padding(.bottom, 30)
               

                
                
                
                
                
                HStack(alignment: .center){
                    if state == 0{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(letters, id: \.self) { letter in
                                bottomNav(text: $text, selectedid: $selectedid, input: $input, state: state, id: letter, counter: $counter, letters: letters, numbers: numbers, special: special)
                                
                                    .padding(5)
                            }
                        }.padding(.horizontal,40)
                    }
                    else if state == 1{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(letters, id: \.self) { letter in
                                bottomNav(text: $text, selectedid: $selectedid, input: $input, state: state, id: letter, counter: $counter, letters: letters, numbers: numbers, special: special)
                                    .padding(5)
                            }
                        }.padding(.horizontal,40)
                    }
                    else if state == 2{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(numbers, id: \.self) { letter in
                                
                                bottomNav(text: $text, selectedid: $selectedid, input: $input, state: state, id: letter, counter: $counter, letters: letters, numbers: numbers, special: special)
                                    .padding(5)
                            }
                        }.padding(.horizontal,40)
                    }
                    else if state == 3{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(special, id: \.self) { letter in
                                
                                bottomNav(text: $text, selectedid: $selectedid, input: $input, state: state, id: letter, counter: $counter, letters: letters, numbers: numbers, special: special)
                                    .padding(5)
                                
                                
                            }
                        }.padding(.horizontal,40)
                        
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 100)
                
                
                Button(action: {
                    
                }){
                    Rectangle()
                        .frame(width: 200, height: 50)
                        .background(Color("Color 2").opacity(1))
                        .overlay(Text("Next").font(.system(size: 30)).foregroundColor(.white).bold())
                    
                        .foregroundColor(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Color 2"))
                        )
                        .cornerRadius(15.0)
                    

                    
                    
                    
                }
                
                
                
                
                
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .padding(30)
                .aspectRatio(1.0, contentMode: .fit)
            
        }
        
        
    }
}



struct bottomNav: View {
    @Binding var text: String
    @Binding var selectedid: String
    @Binding var input: String
    
    var state: Int
    let id: String
    @Binding var counter: Int
       let letters: [String]
        let numbers: [String]
       let special: [String]
    
    var body: some View {
        
        Rectangle()
            .frame(width: 50, height: 50)
            .background(selectedid == id ? Color.white.opacity(1) : .clear)
            .foregroundColor(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white)
            )
            .cornerRadius(15.0)
            .overlay(Text(state == 1 ? id.capitalized : id).font(.system(size: 25)).foregroundColor(selectedid == id ? .black : .white).bold())
        

        
            .onTapGesture {
                text = id
                selectedid = id
                input = id
                if state == 0 || state == 1{
                    counter = letters.firstIndex(of: id) ?? 0
                } else if state == 2 {
                    counter = numbers.firstIndex(of: id) ?? 0
                } else if state == 3 {
                    counter = special.firstIndex(of: id) ?? 0
                }
                input=convertToBraille(id)
                
                }

            }
        

        
    }


//struct ExtractedView: View {
//    @State var text:String
//    @State var selected:Bool
//    var body: some View {
//        Rectangle()
//            .frame(width: 50, height: 50)
//            .background(selected ? .blue.opacity(0.10) : .clear)
//            .foregroundColor(.clear)
//            .border(Color.blue)
//            .cornerRadius(15.0)
//            .overlay(Text(text).font(.system(size: 25)).foregroundColor(.blue))
//
//    }
//}

func convertToBraille(_ letter: String) -> String {
    switch letter {
        case "a":
            return "1"
        case "b":
            return "13"
        case "c":
            return "12"
        case "d":
            return "124"
        case "e":
            return "14"
        case "f":
            return "123"
        case "g":
            return "1234"
        case "h":
            return "134"
        case "i":
            return "23"
        case "j":
            return "234"
        case "k":
            return "15"
        case "l":
            return "135"
        case "m":
            return "125"
        case "n":
            return "1245"
        case "o":
            return "145"
        case "p":
            return "1235"
        case "q":
            return "12345"
        case "r":
            return "1345"
        case "s":
            return "235"
        case "t":
            return "2345"
        case "u":
            return "156"
        case "v":
            return "1356"
        case "w":
            return "2346"
        case "x":
            return "1256"
        case "y":
            return "12456"
        case "z":
            return "1456"
        case " ":
            return "" // Space
        case ".":
            return "346" // Period
        case ",":
            return "3" // Comma
        case "?":
            return "356" // Question mark
        case "!":
            return "345" // Exclamation mark
        case "(":
            return "136" // Left parenthesis
        case ")":
            return "245" // Right parenthesis
        case ":":
            return "34" // Colon
        case ";":
            return "35" // Semicolon
        case "-":
            return "56"
        case "/":
            return "25"
        case "<":
            return "236"
        case ">":
            return "145"
        case "1":
            return "1"
        case "2":
            return "13"
        case "3":
            return "12"
        case "4":
            return "124"
        case "5":
            return "14"
        case "6":
            return "123"
        case "7":
            return "1234"
        case "8":
            return "134"
        case "9":
            return "23"
        case "0":
            return "234"
        case "numint":
            return "2456"
        default:
            return "123456"
    }
}



#Preview {
    ContentView()
}

