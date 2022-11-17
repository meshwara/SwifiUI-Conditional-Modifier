//
//  ContentView.swift
//  Conditional Modifier
//
//  Created by D. Prameswara on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showColor: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Toggle warna background"){
                showColor = !showColor
            }
            
            Text("Hello, world!")
                .padding()
//                .background(Color( showColor ? .red : .clear))
                // gunakan conditional modifier
                .if(showColor){ view in
                    view.background(Color(.red))
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, modifier: (Self) -> Content) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }
}
