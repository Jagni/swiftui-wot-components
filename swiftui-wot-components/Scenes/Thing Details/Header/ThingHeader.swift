//
//  ThingHeader.swift
//  swiftui-wot-components
//
//  Created by Administrador on 19/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct ThingDetailsHeader: View {
    @Binding var offset : CGFloat
    
    var mapHeight: CGFloat {
        max(min(self.offset/1.5, 200), 50)
    }
    
    @State var bodyMetrics = CGRect()
    
    var imageSize: CGFloat {
        max(mapHeight/2, 50)
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
        MapView()
            .edgesIgnoringSafeArea(.top)
            .frame(height: self.mapHeight)
        CircleImageView(
            image: Image(systemName: "star"),
            tintColor: .accentColor
        )
            .frame(width: self.imageSize, height: self.imageSize)
            .offset(y: -self.imageSize/2)
            .padding(.bottom, -self.imageSize/2)
            .zIndex(3)
        
        HStack {
            VStack(alignment: .center) {
                Text("Thing Name")
                    .font(.title)
                    .bold()
                Text("Communication protocol : identifier")
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .frame(width: bodyMetrics.size.width)
            .padding([.top, .bottom], 8)
        }
        }
        .background(GeometryGetter(rect: $bodyMetrics))
    }
}

#if DEBUG
struct ThingDetailsHeader_Previews: PreviewProvider {
    @State static var height : CGFloat = 200 // Note: it must be static

    static var previews: some View {
        ThingDetailsHeader(offset: $height)
    }
}
#endif
