//
//  GeometryGetter.swift
//  swiftui-wot-components
//
//  Created by Administrador on 19/08/19.
//  Copyright © 2019 Jagni. All rights reserved.
//

import SwiftUI

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }

    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            let newRect = geometry.frame(in: .global)
            let newMin = newRect.minY
            if self.rect.minY != newMin{
                self.rect = newRect
            }
        }

        return Rectangle().fill(Color.clear)
    }
}
