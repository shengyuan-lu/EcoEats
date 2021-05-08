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
        
        
        ZStack {
            
            Color.init(hex: "EDFFF3")
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                
                Image("Icon")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    HStack {
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        Text("Email")
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                    }
                    
                    
                    TextField("Enter your email address...", text: $email)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                    
                    
                    
                    HStack {
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        Text("Password")
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                    }
                    
                    SecureField("Enter your password...", text: $password)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                }
                .padding()
                .padding(.horizontal, 10)
                
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
            }
            
            
            
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
