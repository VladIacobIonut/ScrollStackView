//
//  ContentView.swift
//  ScrollStack
//
//  Created by Vlad Iacob on 5/28/21.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Share")
            }, label: {
                Image(systemName: "square.and.arrow.up")
            })
            Spacer()
            Button(action: {
                print("Share")
            }, label: {
                HStack(spacing: 5) {
                    Image(systemName: "pencil")
                    Text("Edit").font(.subheadline)
                }
            })
            Spacer()
            Button(action: {
                print("Share")
            }, label: {
                Image(systemName: "trash.fill").foregroundColor(.red)
            })
        }.padding()
        .ignoresSafeArea()
    }
}
