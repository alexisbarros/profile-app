//
//  ContentView.swift
//  Profile App
//
//  Created by Alexis Barros on 04/12/23.
//

import SwiftUI

//MARK: Model
struct User {
    var name: String
    var github: String
    var follows: String
}

//MARK: View
struct ProfileView: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.black)
                .ignoresSafeArea()
            
            VStack {
                Image("profile_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit).clipShape(Capsule())
                    .frame(height: 300)
                    .padding(.bottom, 30)
                
                Text("Alexis de Barros")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("github.com/alexisbarros")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Text("10")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ProfileView()
}
