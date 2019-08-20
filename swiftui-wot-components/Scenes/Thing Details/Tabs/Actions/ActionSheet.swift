//
//  ActionSheet.swift
//  swiftui-wot-components
//
//  Created by Administrador on 20/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct ActionSheet: View {
    @State var fieldValue = ""
    @Binding var showingForm : Bool

    var body: some View {
        VStack{
        HStack(alignment: .bottom){
                Button(action: {
                    self.showingForm = false
                }) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: {
                    self.showingForm = false
                }) {
                    Text("Submit")
                }
            }
            .padding()
            
            ScrollView{
            VStack{
                
                ForEach(0 ..< 5){ index in
                    VStack(alignment: .leading){
                        Text("Label")
                            .bold()
                            .font(.headline)
                        HStack{
                        TextField("", text: self.$fieldValue)
                            .padding()
                            .foregroundColor(.white)
                        } .background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.25)))
                        
                        HStack {
                            Spacer()
                            Text("hint")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                }
                Spacer()
            }
            .padding()
            }
        }.accentColor(.green)
    }
}

#if DEBUG
struct ActionSheet_Previews: PreviewProvider {
    @State static var initialState = true // Note: it must be static

    static var previews: some View {
        ActionSheet(showingForm: $initialState)
    }
}
#endif
