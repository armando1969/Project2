//
//  ContentView.swift
//  Flags
//
//  Created by Consultant on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", " Ireland", "Italy", "Nigeria", " Poland", " Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer =  Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the Flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            correctFlag(number)
                        } label: {
                            Image(countries[number]).shadow(radius: 5)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical,20)
                    .background(.regularMaterial)
                
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }.padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is: \(score)" )
            }
    }
    
    func correctFlag(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 1
        } else {
            scoreTitle = "Worng"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
