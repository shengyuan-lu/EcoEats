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
        IntroPage(introText: "Find stores that offer contactless services (1/3)", introImageStr: "intro1", tag: 0),
        
        IntroPage(introText: "Choose from sustainably sourced options (2/3)", introImageStr: "intro2", tag: 1),
        
        IntroPage(introText: "Fill out feedback surveys & earn points (3/3)", introImageStr: "intro3", tag: 2)
    ]
    
    
    @State private var selectedTab:Int = 0
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack(alignment: .center) {
                    
                    TabView(selection: $selectedTab) {
                        
                        ForEach(introList, id: \.self) { introPage in
                            introPagedView(introPage: introPage)
                                .tag(introPage.tag)
                        }
                        .padding(.horizontal, 16)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .navigationBarTitle(Text("EcoEats"))
                    .navigationBarTitleDisplayMode(.large)
                    .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Skip")
                            .padding(10)
                            .background(Color.init(hex: "54925A"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }))
                    .onAppear(perform: {
                        setUpAppearance()
                    })
                    
                    
                    VStack(spacing: 10) {
                        
                        Button(action: {
                            
                        }, label: {
                            
                            Text("Create an account")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(10)
                                .padding(.horizontal, 40)
                                .background(Color.init(hex: "54925A"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            
                            Text("Login")
                                .font(.title2)
                                .fontWeight(.regular)
                                .padding(10)
                                .foregroundColor(Color.init(hex: "54925A"))
                        })
                        
                        
                    }
                    .padding(.top, 40)
                    
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
        IntroductionView()
    }
}
