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
    var followers: Int
}

//MARK: ModelView
class ProfileViewModel: ObservableObject {
    
    @Published var user = User(profilePhoto: "profile_photo",
                   name: "Alexis de Barros",
                   github: "alexisbarros",
                               followers: 8)
    
    @Published var isFollowing: Bool = false
    
    func toggleFollow(){
        user.followers += (isFollowing ? -1:1)
        isFollowing.toggle()
    }
    
}

//MARK: View
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            InfoView(viewModel: viewModel)
            ActionView(viewModel: viewModel)
        }.padding()
    }
}

struct InfoView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Image(viewModel.user.profilePhoto)
                .resizable()
                .aspectRatio(contentMode: .fit).clipShape(Capsule())
                .frame(height: 300)
                .padding(.bottom, 30)
            
            Text(viewModel.user.name)
                .font(.largeTitle)
            
            Text("github.com/\(viewModel.user.github)")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            Text("\(viewModel.user.followers)")
                .font(.system(size: 80))
        }
    }
}

struct ActionView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Button {
            viewModel.toggleFollow()
        } label: {
            Label(viewModel.isFollowing ? "Unfollow" : "Follow", systemImage: "person.fill.badge.\(viewModel.isFollowing ? "minus":"plus")")
                .frame(maxWidth: .infinity)
                .padding(10)
                .font(.title3)
        }
        .buttonStyle(.bordered)
        .tint(viewModel.isFollowing ? .red : .blue)
    }
}

#Preview {
    ProfileView()
}
