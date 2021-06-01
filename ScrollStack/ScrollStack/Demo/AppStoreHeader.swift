//
//  AppStoreHeader.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 6/1/21.
//

import SwiftUI

struct AppStoreHeader: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("river")
                .resizable()
            VStack(spacing: 0) {
                Text("Night lights.")
                    .padding(.bottom, 10)
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text("The night sky as you've never seen it before.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .frame(width: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }.ignoresSafeArea()
    }
}
