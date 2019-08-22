//
//  ContentView.swift
//  SwUI
//
//  Created by IvanLyuhtikov on 8/12/19.
//  Copyright © 2019 IvanLyuhtikov. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        Text("Hello World")
        .bold()
        .italic()
        .color(.green)
        .kerning(10)
        .underline()
        .scaleEffect(2)
        .shadow(radius: 4)
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
