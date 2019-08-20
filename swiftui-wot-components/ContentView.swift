//
//  ContentView.swift
//  swiftui-wot-components
//
//  Created by Administrador on 19/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var offset : CGFloat = 300
    @State private var currentTab = 0
    
    var colors : [Color] = [.blue, .green, .purple]
    
    var body: some View {
            VStack(spacing: 0.0) {
                ThingDetailsHeader(offset: self.$offset)
                .accentColor(colors[currentTab])
                .background(
                     Rectangle().fill(Color.white).shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 4)
                )
                    .zIndex(2)
                
                TabView(selection: $currentTab) {
                    PropertyList(offset: self.$offset)
                    .tabItem {
                        Image(systemName: "rosette")
                        Text("Properties")
                    }.tag(0)
                    ActionList(offset: self.$offset)
                        .tabItem {
                            Image(systemName: "cursor.rays")
                            Text("Actions")
                    }.tag(1)
                    PropertyList(offset: self.$offset)
                        .tabItem {
                            Image(systemName: "bell")
                            Text("Events")
                    }.tag(2)
                }
                .accentColor(colors[currentTab])
                .font(.headline)
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
