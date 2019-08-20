//
//  PropertyList.swift
//  swiftui-wot-components
//
//  Created by Administrador on 19/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct ActionList: View {
    @State var showingForm : Bool = false
    @Binding var offset : CGFloat
    
    var body: some View {
        ScrollView{
            GeometryReader { geometry -> Text in
                let newOffset = geometry.frame(in: .global).minY
                if self.offset != newOffset {
                    self.offset = newOffset
                }
                return Text("")
            }
            
            ForEach(0 ..< 10) { index in
                ActionRow(showingForm: self.$showingForm, label: "Method \(index)")
                Divider()
            }
        }
        .sheet(isPresented: $showingForm){
            ActionSheet(showingForm: self.$showingForm)
        }
    }
}

#if DEBUG
struct ActionList_Previews: PreviewProvider {
    @State static var initialOffset : CGFloat = 0 // Note: it must be static
    
    static var previews: some View {
        PropertyList(offset: $initialOffset)
    }
}
#endif
