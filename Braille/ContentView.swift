import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var selectedid: String = "A"
    @State private var input: String = "1"

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    BrailleDot(input: $input, bsize: 80)
                    
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text(text != "" ? text : "A")
                        .font(.system(size: 300))
                }
                Spacer()
            }
            
            HStack {
                ExtractedView(text: $text, selectedid: $selectedid, input: $input, id: "A")
                ExtractedView(text: $text, selectedid: $selectedid, input: $input, id: "B")
                ExtractedView(text: $text, selectedid: $selectedid, input: $input, id: "C")
                ExtractedView(text: $text, selectedid: $selectedid, input: $input, id: "D")
            }
        }
    }
}

struct ExtractedView: View {
    @Binding var text: String
    @Binding var selectedid: String
    @Binding var input: String
    let id: String

    var body: some View {
        
        Rectangle()
            .frame(width: 50, height: 50)
            .background(selectedid == id ? .blue.opacity(0.10) : .clear)
            .foregroundColor(.clear)
            .border(Color.blue)
            .cornerRadius(15.0)
            .overlay(Text(id).font(.system(size: 25)).foregroundColor(selectedid == id ? .blue : .black))
            .onTapGesture {
                text = id
                selectedid = id
                input = id
                switch input {
                    case "A":
                        input = "1"
                    case "B":
                        input = "2"
                    case "C":
                        input = "3"
                    case "D":
                        input = "4"
                    case "E":
                        input = "5"
                    case "F":
                        input = "6"
                    case "G":
                        input = "7"
                    case "H":
                        input = "8"
                    case "I":
                        input = "9"
                    case "J":
                        input = "10"
                    case "K":
                        input = "11"
                    case "L":
                        input = "12"
                    case "M":
                        input = "13"
                    case "N":
                        input = "14"
                    case "O":
                        input = "15"
                    case "P":
                        input = "16"
                    case "Q":
                        input = "17"
                    case "R":
                        input = "18"
                    case "S":
                        input = "19"
                    case "T":
                        input = "20"
                    case "U":
                        input = "21"
                    case "V":
                        input = "22"
                    case "W":
                        input = "23"
                    case "X":
                        input = "24"
                    case "Y":
                        input = "25"
                    case "Z":
                        input = "26"
                    case " ":
                        input = "27" // Space
                    case ".":
                        input = "28" // Period
                    case ",":
                        input = "29" // Comma
                    case "?":
                        input = "30" // Question mark
                    case "'":
                        input = "31" // Apostrophe
                    case "!":
                        input = "32" // Exclamation mark
                    case "/":
                        input = "33" // Slash
                    case "(":
                        input = "34" // Left parenthesis
                    case ")":
                        input = "35" // Right parenthesis
                    case "&":
                        input = "36" // Ampersand
                    case ":":
                        input = "37" // Colon
                    case ";":
                        input = "38" // Semicolon
                    case "=":
                        input = "39" // Equals sign
                    case "+":
                        input = "40" // Plus sign
                    case "-":
                        input = "41" // Hyphen
                    case "_":
                        input = "42" // Underscore
                    case "\"":
                        input = "43" // Quotation mark
                    case "$":
                        input = "44" // Dollar sign
                    case "@":
                        input = "45" // At sign
                    case "0":
                        input = "46" // Zero
                    case "1":
                        input = "47" // One
                    case "2":
                        input = "48" // Two
                    case "3":
                        input = "49" // Three
                    case "4":
                        input = "50" // Four
                    case "5":
                        input = "51" // Five
                    case "6":
                        input = "52" // Six
                    case "7":
                        input = "53" // Seven
                    case "8":
                        input = "54" // Eight
                    case "9":
                        input = "55" // Nine
                    default:
                        break
                }

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



#Preview {
    ContentView()
}
