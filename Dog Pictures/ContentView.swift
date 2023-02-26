//
//  ContentView.swift
//  Dog Pictures
//
//  Created by Don Bouncy on 26/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dc = DogController()
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: dc.dog?.message ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            .padding(.horizontal)
        }
        .padding()
        .frame(width: 400, height: 500)
        .background(
            Rectangle()
                .fill(Color.white)
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 8, x: -8, y: 8)
            
        )
        .task {
            await dc.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
