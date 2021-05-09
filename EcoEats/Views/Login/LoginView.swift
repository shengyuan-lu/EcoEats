//
//  LoginView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI
import UIKit

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showCantLogInAlert: Bool = false
    @State private var showCantCreateAccAlert: Bool = false
    
    @Binding var isLoggedin:Bool
    
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
                        .keyboardType(.emailAddress)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                        .background(Color.white)
                    
                    HStack {
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                        Text("Password")
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(hex: "54925A"))
                        
                    }
                    
                    SecureField("Enter your password...", text: $password)
                        .keyboardType(.default)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1)
                        )
                        .background(Color.white)
                }
                .padding()
                .padding(.horizontal, 10)
                
                Divider()
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Button(action: {
                        performAccCreation()
                        
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
                    .alert(isPresented: $showCantCreateAccAlert) {
                        Alert(title: Text("Can't create your account"), message: Text("Email or password field is empty!"), dismissButton: .cancel())
                    }
                    
                    Button(action: {
                        performLogin()
                        
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
                    .alert(isPresented: $showCantLogInAlert) {
                        Alert(title: Text("Incorrect Credentials"), message: Text("Check your email and password!"), dismissButton: .cancel())
                    }
                    
                }
                .padding(30)

            }
        }
        .onTapGesture {
            self.endEditing()
        }
    }
    
    func performLogin() {
        
        if self.email.lowercased() == "me@tohacks.edu" && self.password.lowercased() == "12345" {
            self.isLoggedin = true
        } else {
            self.showCantLogInAlert = true
        }
        
    }
    
    func performAccCreation() {
        if self.email != "" && self.password != "" {
            self.isLoggedin = true
        } else {
            self.showCantCreateAccAlert = true
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedin: .constant(false))
    }
}
