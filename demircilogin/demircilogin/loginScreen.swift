//
//  loginScreen.swift
//  demircilogin
//
//  Created by John Demirci on 11/6/19.
//  Copyright © 2019 John Demirci. All rights reserved.
//

import SwiftUI
import UIKit

struct loginScreen: View {
    
    
    
    
    var body: some View {
        ZStack {
            Color.black
            ScrollView {
                VStack(spacing: 50) {
                    Spacer()
                    Text("Welcome")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    Text("Your Weekly memes")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                    
                    
                    Button(action: {
                        if let url = URL(string: "https://www.reddit.com/r/dankchristianmemes/comments/dtebjr/gen_z_jesus_zesus/") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                    Image("3")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 350, height: 400, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    }
                    
                    
                    Button(action: {
                        if let url = URL(string: "https://www.reddit.com/r/dankmemes/comments/dtg51u/in_the_lawds_house_naw/") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                    Image("5")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 350, height: 400, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    }
                    
                    /*
                     Image("1").resizable()
                        .frame(width: 350, height: 400, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Image("2").resizable()
                        .frame(width: 350, height: 400, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Image("3").resizable()
                        .frame(width: 350, height: 400, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Image("4").resizable()
                        .frame(width: 350, height: 400, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Image("5").resizable()
                        .frame(width: 350, height: 400, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                     */
                    
                    
                   
                    
                    
                    Spacer()
                    
                        
                }
            }
        }
    }
}

struct loginScreen_Previews: PreviewProvider {
    static var previews: some View {
        loginScreen()
    }
}
