//
//  LoginView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        
        VStack(spacing: 10) {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Email")
                    .fontWeight(.bold)
                    .foregroundColor(Color.init(hex: "54925A"))
                
                TextField("Enter your email address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Password")
                    .fontWeight(.bold)
                    .foregroundColor(Color.init(hex: "54925A"))
                
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .center, spacing: 20) {
                
                Button(action: {
                    
                }, label: {
                    
                    Text("Create an account")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.init(hex: "54925A"))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                })
                
                Button(action: {
                    
                }, label: {
                    
                    Text("Login")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.init(hex: "54925A"))
                        .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.init(hex: "54925A"), lineWidth: 3))
                })
                
            }
            .padding(30)
            .padding(.top, 40)

            
            
        }
        
        
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
