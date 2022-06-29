//
//  ContentView.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WorldDataModel
    var body: some View {
        NavigationView{
            VStack{
            VStack(spacing: 3)
            {
                GuessView(guess: $dm.guesses[0])
                GuessView(guess: $dm.guesses[1])
                GuessView(guess: $dm.guesses[2])
                GuessView(guess: $dm.guesses[3])
                GuessView(guess: $dm.guesses[4])
                GuessView(guess: $dm.guesses[5])
            }
            .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
            Spacer()
            Keyboard()
                .scaleEffect(Global.keyboardScale)
                .padding(.top)
                Spacer()
        }
                .padding().navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal)
                    {
                        Text("WORDLE").font(.largeTitle).fontWeight(.heavy).foregroundColor(.primary)
                    }
                }
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(WorldDataModel())
    }
}
