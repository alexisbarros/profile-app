//
//  ProfileViewModel.swift
//  Profile App
//
//  Created by Alexis Barros on 06/12/23.
//

import Foundation

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
