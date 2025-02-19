//
//  ContentView.swift
//  WuTang
//
//  Created by Oleh on 17.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredName = ""
    @State private var staticCoderNameIs = ""
    @State private var wuTangName = ""
    @State private var imageName = "wu-tang"
    @FocusState private var isFocused: Bool
    
    private let firstColumn = ["Algorithmic",
                               "Byte",
                               "Cache",
                               "Debug",
                               "Echo",
                               "Function",
                               "Git",
                               "Hex",
                               "Infinite",
                               "Java",
                               "Kernel",
                               "Logic",
                               "Module",
                               "Node",
                               "Object",
                               "Pixel",
                               "Query",
                               "Runtime",
                               "Script",
                               "Token",
                               "Undefined",
                               "Virtual",
                               "Web",
                               "Xcode",
                               "Yota",
                               "Zero"]
    private let secondColumn = ["$tack",
                                "Processor",
                                "Cipher",
                                "Daemon",
                                "EndPoint",
                                "Framework",
                                "Gateway",
                                "Hub",
                                "Interrupt",
                                "Crash",
                                "Loop",
                                "Module",
                                "Nexus",
                                "Optimizer",
                                "Protocol",
                                "Queue",
                                "Router",
                                "Stack",
                                "Thread",
                                "Update",
                                "Variable",
                                "Widget",
                                "Terminal",
                                "Yield",
                                "Zen",
                                "Ace",
                                "Breakpoint",
                                "Root",
                                "Instance",
                                "Access",
                                "Archive",
                                "Control",
                                "Justice"]
    
    var body: some View {
        VStack {
            Text("Wu-Tang\nCoder Name Generator")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .padding(.horizontal)
                .background(.black)
            
            Spacer()
            
            TextField("Enter name here", text: $enteredName)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding()
                .focused($isFocused)
                .onChange(of: isFocused) { oldValue, newValue in
                    if isFocused == true {
                        imageName = ""
                        enteredName = ""
                        staticCoderNameIs = ""
                        wuTangName = ""
                    }
                }
            
            Button(action: {
                wuTangName = getWuTangName(name: enteredName)
                isFocused = false
                staticCoderNameIs = "Your Wu-Tang Coder Name Is:"
                imageName = "wu-tang"
            }, label: {
                Image("wu-tang-button")
                Text("Get It!")
            })
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.yellow)
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .disabled(enteredName.isEmpty)
            
            
            VStack{
                Text(staticCoderNameIs)
                Text(wuTangName)
                    .fontWeight(.black)
            }
            .font(.largeTitle)
            .frame(height: 130)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
    }
    
    func getWuTangName(name: String) -> String {
        var localName = name
        let firstLetter = localName.removeFirst()
        var firstColumnIndex = 0
        for i in 0..<firstColumn.count{
            if firstColumn[i].first == firstLetter {
                firstColumnIndex = i == 0 ? 25 : i-1
            }
        }
        return "\(firstColumn[firstColumnIndex]) \(secondColumn.randomElement()!)"
    }
}

#Preview {
    ContentView()
}
