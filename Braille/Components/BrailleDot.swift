import SwiftUI
import AVFoundation

struct BrailleDot: View {
    @Binding var input: String
    @State var bsize: Int
    let rows = 3
    let columns = 2
    @State private var audioManager: AudioManager?
    @State private var circleStates: [[Bool]] = Array(repeating: Array(repeating: false, count: 2), count: 3)

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack() {
            ForEach(Array(0..<rows), id: \.self) { row in
                HStack {
                    ForEach(Array(0..<columns), id: \.self) { column in
                        let dotNumber = row * columns + column + 1
                        let shouldFill = input.contains("\(dotNumber)")
                        let index = row * columns + column
                        
                        let isSelected = circleStates[row][column]
                        
                        
                        Circle()
                            .fill(isSelected ? (shouldFill ? Color.gray : Color.black) : (shouldFill ? Color.white : Color.clear))
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: CGFloat(bsize), height: CGFloat(bsize))
                            .onHover { hover in
                                circleStates[row][column] = true
                                checkAllCirclesDone()
                                let soundName = shouldFill  ? "beep" : "beep1"
                                audioManager = AudioManager(soundName: soundName)
                                audioManager?.playSound()
                            }
                            .onTapGesture {
                                circleStates[row][column] = true
                                checkAllCirclesDone()
                                let soundName = shouldFill  ? "beep" : "beep1"
                                audioManager = AudioManager(soundName: soundName)
                                audioManager?.playSound()
                            }
                    }
                }
            }
        }.onChange(of: input) { _ in
            resetCircleStates()
        }
    }
    
     func checkAllCirclesDone() {
        let allCirclesDone = circleStates.allSatisfy { row in
            row.allSatisfy { $0 }
        }
        if allCirclesDone {
            UIAccessibility.post(notification: .announcement, argument: "Done")
                
            resetCircleStates()
        }
    }

     func resetCircleStates() {
        circleStates = Array(repeating: Array(repeating: false, count: 2), count: 3)
    }
}

struct BrailleDot_Preview: PreviewProvider {
    @State static var input: String = "123456"

    static var previews: some View {
        BrailleDot(input: $input, bsize: 20)
    }
}

class AudioManager {
    var audioPlayer: AVAudioPlayer?

    init(soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            print("Sound file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading sound file: \(error.localizedDescription)")
        }
    }

    func playSound() {
        audioPlayer?.play()
    }
}
