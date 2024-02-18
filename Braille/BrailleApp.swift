//
//  BrailleApp.swift
//  Braille
//
//  Created by Jeevan Choudhary on 15/02/24.
//

import SwiftUI
import TipKit

@main
struct BrailleApp: App {
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
//                        .displayFrequency(.immediate)
                        .datastoreLocation(.applicationDefault)])
                }
        }
    }
}
