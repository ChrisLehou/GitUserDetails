//
//  UserDetailView.swift
//  GitHubUsers
//
//  Created by CHRISTOPHE LEHOUSSINE on 27/09/2022.
//

import SwiftUI

struct UserDetailView: View {
    @State var userName = ""
    @ State var user = User(avatar_url: "", name: "", public_repos: 0, public_gists: 0, followers: 0, following: 0)
    
    
    var body: some View {
        
        VStack{
            TextField("Github User Name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                Task {
                    user = try await getUserDetail(userName: userName)
                    
                    
                }
            } label: {
                Text("OK")
                 
            }
        
            if !user.avatar_url.isEmpty {
                AsyncImage(url: URL(string: user.avatar_url), scale: 1.8)
                    .cornerRadius(30)
                
            }
            else {
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            if !user.name.isEmpty  {
                Text(user.name)
                    .font(.title)
            }
                
            HStack{
                VStack {
                    Text("Repository")
                    Text("\(user.public_repos)")
                }.padding()
                    .font(.title3)
                Spacer()
                VStack {
                    Text("Followers")
                    Text("\(user.followers)")
                }.padding()
                    .font(.title3)
                
                Spacer()
                VStack {
                    
                    Text("Following")
                        .padding(.trailing)
                    Text("\(user.following)")
                }
            }.padding(.bottom, 100.0)
                .font(.title3)
        }
    }
    
}


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
