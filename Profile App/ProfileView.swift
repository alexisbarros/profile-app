//
//  ContentView.swift
//  Profile App
//
//  Created by Alexis Barros on 04/12/23.
//

import SwiftUI

//MARK: Model
struct User {
    var profilePhoto: String
    var name: String
    var github: String
    var follows: String
}

//MARK: ModelView
class ProfileModelView {
    
}

//MARK: View
struct ProfileView: View {
    let isFollowing: Bool = false
    
    var body: some View {
        VStack {
            Image("profile_photo")
                .resizable()
                .aspectRatio(contentMode: .fit).clipShape(Capsule())
                .frame(height: 300)
                .padding(.bottom, 30)
            
            Text("Alexis de Barros")
                .font(.largeTitle)
            
            Text("github.com/alexisbarros")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            Text("10")
                .font(.system(size: 80))
            
            Button {} label: {
                Label(isFollowing ? "Unfollow" : "Follow", systemImage: "person.fill.badge.\(isFollowing ? "minus":"plus")")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .font(.title3)
            }
            .buttonStyle(.bordered)
            .tint(isFollowing ? .red : .blue)
            
                
        }.padding()
    }
}

#Preview {
    ProfileView()
}
