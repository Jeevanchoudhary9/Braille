//
//  Tip.swift
//  Braille
//
//  Created by Jeevan Choudhary on 18/02/24.
//

import Foundation
import TipKit

struct AddSlideTip:Tip{
    var title: Text{
        Text("Slide")
    }
    var message: Text?{
        Text("To navigate to the next screen, simply swipe either right or left.")
    }
    
    var image: Image?{
        Image(systemName: "hand.draw")
    }
}

struct AddBralleTip:Tip{
    var title: Text{
        Text("Tap or Hover")
    }
    var message: Text?{
        Text("To identify Braille characters, you can tap or hover over them.")
    }
    
    var image: Image?{
        Image(systemName: "hand.point.up.braille")
    }
}

struct AddTranslateTip:Tip{
    var title: Text{
        Text("Tap")
    }
    var message: Text?{
        Text("Tap to provide input")
    }
    
    var image: Image?{
        Image(systemName: "hand.tap")
    }
}
