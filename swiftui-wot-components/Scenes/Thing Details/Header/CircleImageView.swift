//
//  CircleImageView.swift
//  HelloSwiftUI
//
//  Created by Administrador on 18/08/19.
//  Copyright © 2019 Administrador. All rights reserved.
//

import SwiftUI

struct CircleImageView: View {
    @State private var rect = CGRect()
    var image : Image
    var tintColor : Color = .primary
    
    var body: some View {
        GeometryReader { bodyMetrics in
            VStack {
                self.image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(self.tintColor)
                    .frame(width: self.rect.width/3, height: self.rect.width/3, alignment: .center)
            }
        }
        .background(Rectangle().fill(Color.white))
        .background(GeometryGetter(rect: self.$rect))
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: Color.init(hue: 0, saturation: 0, brightness: 0, opacity: 0.5), radius: self.rect.width/25, x: 0, y: self.rect.width/50)
        .overlay(Circle().stroke(tintColor, lineWidth: self.rect.width/25))
    }
}

#if DEBUG
struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image(systemName: "star"))
            .previewLayout(.fixed(width: 100, height: 100))
    }
    
}
#endif
