//
//  ContentView.swift
//  demircilogin
//
//  Created by John Demirci on 11/6/19.
//  Copyright © 2019 John Demirci. All rights reserved.
//

import SwiftUI
import Foundation
var userinfo = linkedList()

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


struct user {
    let username: String
    let password: String
}



class Node  {
    let value: user
    var next: Node?
    
    
    init(value: user, next: Node?) {
        self.value = value
        self.next = next
    }
}

class linkedList  {
    var head: Node?
    
    func contains (value: String) -> Bool {
        if head == nil {
            return false
        }
        
        
        
        var temp = head
        
        
        while temp != nil {
            if (temp!.value.username == value) {
                return true
            }
            temp = temp!.next
        }
        return false
    }
    
    public func search (value: user) -> Node? {
        if (!contains(value: value.username)) {
            return nil
        }
        
        
        var temp = head
        while temp != nil {
            if ((temp?.value.username == value.username) && (temp?.value.password == value.password)) {
                return temp
            }
            temp = temp!.next
        }
        return nil
    }
    
    
    
    public func insert (value: user) {
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
            var temp = head
            while (temp?.next != nil) {
                temp = temp?.next
            }
            temp?.next = Node(value: value, next: nil)
    }
    
    public func deleteValue (value: user) {
        if head?.value.username == value.username {
            head = head?.next
        }
        var prev: Node?
        var current = head
        while current != nil && current?.value.username == value.username {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }
    public func displayList () {
        var current = head
        while (current != nil) {
            print(current?.value ?? "")
            current = current?.next
        }
    }
}

 

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isModal: Bool = false
    @State var failedLogIn: Bool = false
    @State var showAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
                
                Image("asdfghj")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 150, height: 150)
                           .clipped()
                           .cornerRadius(150)
                           .padding(.bottom, 75)
                
                TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
                SecureField("password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
                
                
                
                // check if the username and password mathes
                
                
                Button(action: {
                    self.failedLogIn = false
                    let x  = userinfo.search(value: user(username: self.username, password: self.password))
                    
                    if (x != nil) {
                        self.isModal = true
                    } else {
                        self.showAlert = true
                    }
                    
                }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .sheet(isPresented: $isModal, content: {
                    loginScreen()
                }
                
                    )}.alert(isPresented: $showAlert) {
                return  Alert(title: Text("Failed to log in"), message: Text("Unfortunately the username or password is wrong"), dismissButton: .default(Text("OK")))
            }
                
                /*
                 
                 Text("LOGIN")
                 .font(.headline)
                 .foregroundColor(.white)
                 .padding()
                 .frame(width: 220, height: 60)
                 .background(Color.green)
                 .cornerRadius(15.0)
                 */
                
                    
                
                Spacer()
                NavigationLink(destination: registerScreen()) {
                            Text("register")
                           .font(.headline)
                           .foregroundColor(.white)
                           .padding()
                           .frame(width: 120, height: 40)
                           .background(Color.green)
                           .cornerRadius(15.0)
                }
                
            }
            
        }
    }
}

struct registerScreen: View {
@State var username: String = ""
@State var password : String = ""
@State private var sucessfulRegister = false
@State private var failedRegister = false
@State private var showAlert = false




var body: some View {
    VStack {
        TextField("Username", text: $username)
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
        SecureField("password", text: $password)
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
        
        Button(action: {
            self.failedRegister = false
            if (userinfo.contains(value: self.username)){
                // self.failedRegister = true
                self.failedRegister.toggle()
                // show alert that it failed
            } else {
                userinfo.insert(value: user(username: self.username, password: self.password))
            }
            self.showAlert.toggle()
        })
         {
        Text("Register")
       .font(.headline)
       .foregroundColor(.white)
       .padding()
       .frame(width: 220, height: 60)
       .background(Color.green)
       .cornerRadius(15.0)
            }
    }.alert(isPresented: $showAlert) {
        // it would be nice to set failedRegister back to false in this function but you cannot modify state here.
            if self.failedRegister {
                return  Alert(title: Text("Failed to register"), message: Text("Unfortunately that username is taken"), dismissButton: .default(Text("OK")))
            } else {
                return  Alert(title: Text("Welcome"), message: Text("You have registered"), dismissButton: .default(Text("OK")))
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
