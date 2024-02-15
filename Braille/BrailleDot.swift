import SwiftUI

struct BrailleDot: View {
    @Binding var input: String
    @State var bsize: Int
    let rows = 3
    let columns = 2
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            ForEach(Array(0..<rows), id: \.self) { row in
                    HStack {
                        ForEach(Array(0..<columns), id: \.self) { column in
                            let dotNumber = row * columns + column + 1
                            let shouldFill = input.contains("\(dotNumber)")
                            
                            Circle()
                                .fill(shouldFill ? colorScheme == .dark ? Color.white : Color.black : Color.clear)
                                .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 2)
                                .frame(width: CGFloat(bsize), height: CGFloat(bsize))
                        }
                    }
                }
                    
            
        }
    }
}

struct BrailleDot_Preview: PreviewProvider {
    @State static var input: String = "123456"

    static var previews: some View {
        BrailleDot(input: $input, bsize: 20)
    }
}


