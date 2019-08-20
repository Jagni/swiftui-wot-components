//
//  ActionView.swift
//  swiftui-wot-components
//
//  Created by Administrador on 19/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct ActionRow: View {
    @Binding var showingForm : Bool
    @State var bodyMetrics = CGRect()
    @State var label: String = "Method"
    var value: String = "Value"
    var description: String = "Action description that can be very big and descriptive and detail how the property works"
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center){
                Text(label)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
            }
            
            HStack {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(height: 90)
                HStack {
                    Button(action: {
                        self.showingForm = true
                    }) {
                        HStack{
                            Text("Submit")
                                .foregroundColor(.white)
                            .padding()
                        }
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.accentColor))
                    }
                }
            }
        }
        .padding()
    }
}

#if DEBUG
struct ActionRow_Previews: PreviewProvider {
    @State static var form : Bool = false // Note: it must be static

    static var previews: some View {
        ActionRow(showingForm: $form)
    }
}
#endif
