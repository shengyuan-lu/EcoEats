//
//  IntroductionView.swift
//  EcoEats
//
//  Created by Shengyuan Lu on 5/8/21.
//

import SwiftUI
import UIKit


struct IntroductionView: View {
    
    @State private var introList = [
        IntroPage(introText: "Support local businesses that offer contactless services (1/3).", introImageStr: "intro1", tag: 0),
        
        IntroPage(introText: "Choose from sustainably sourced goodies (2/3).", introImageStr: "intro2", tag: 1),
        
        IntroPage(introText: "Earn points by purchasing and redeem gift cards (3/3).", introImageStr: "intro3", tag: 2)
    ]
    
    
    @Binding var selectedTab: Int
    
    @Binding var isLoggedin: Bool

    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack(alignment: .leading) {
                    
                    Text(self.selectedTab == introList.count ? "Enter your details to start ordering food." : "An introduction and guided tour to EcoEats.")
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 16)
                    
                    Divider()
                    
                    TabView(selection: $selectedTab) {
                        
                        ForEach(introList, id: \.self) { introPage in
                            introPagedView(introPage: introPage)
                                .tag(introPage.tag)
                        }
                        .padding(.horizontal, 16)
                        
                        LoginView(isLoggedin: $isLoggedin)
                            .tag(introList.count)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .navigationBarTitle(Text(self.selectedTab == introList.count ? "Sign up or Log in" : "Welcome"))
                    .navigationBarTitleDisplayMode(.large)
                    .navigationBarItems(trailing:
                                            
                                            Button(action: {
                                                
                                                self.selectedTab = introList.count
                                                
                                                
                                            }, label: {
                                                
                                                HStack {
                                                    
                                                    Text("Skip")
                                                    
                                                    Image(systemName: "arrow.forward.circle.fill")
                                                    
                                                }
                                                .padding(10)
                                                .background(Color.init(hex: "54925A"))
                                                .foregroundColor(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                
                                            })
                                            .opacity(self.selectedTab == introList.count ? 0.0 : 1.0)
                                            .disabled(self.selectedTab == introList.count)
                    
                    )
                    .onAppear(perform: {
                        setUpAppearance()
                    })
                    
                }
                
            }
            
        }
        
    }
    
    func setUpAppearance() {
        UIScrollView.appearance().bounces = false
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}



struct introPagedView: View {
    
    let introPage: IntroPage
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text(introPage.introText)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.init(hex: "54925A"))
            
            
            ZStack {
                Color.init(hex: "EDFFF3")
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Image(introPage.introImageStr)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            
        }
    }
}


struct IntroPage: Hashable {
    let introText: String
    let introImageStr: String
    let tag:Int
}


struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(selectedTab: .constant(0), isLoggedin: .constant(true))
    }
}
