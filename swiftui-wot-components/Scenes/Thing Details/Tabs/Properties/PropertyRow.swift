//
//  PropertyView.swift
//  swiftui-wot-components
//
//  Created by Administrador on 19/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct PropertyRow: View {
    @State var loading = true
    var label: String = "Label:"
    var value: String = "Value"
    var description: String = "Property description that can be very big and descriptive and detail how the property works"
    
    func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.loading = false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Text(label)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                if loading{
                    ActivityIndicator(isAnimating: .constant(true), style: .medium)
                        .onAppear {
                            self.simulateLoading()
                    }.animation(.easeInOut)
                } else {
                    Text(value)
                        .font(.title)
                        .foregroundColor(.accentColor)
                    .animation(.easeInOut)
                }
                Spacer()
                Button(action: {
                    self.loading = true
                    self.simulateLoading()
                }) {
                Image(systemName: "arrow.2.circlepath")
                    .foregroundColor(.accentColor)
                }
            }
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(height: 60)
        }
        .padding()
        
    }
}

#if DEBUG
struct PropertyRow_Previews: PreviewProvider {
    static var previews: some View {
        PropertyRow()
    }
}
#endif
