//
//  Navigator.swift
//  movie-app-ios
//
//  Created by Paweł on 11/11/2022.
//

import SwiftUI

struct Navigator: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
        }
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
