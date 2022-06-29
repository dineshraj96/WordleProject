//
//  WordleDataModel.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import SwiftUI

class WorldDataModel: ObservableObject{
    @Published var guesses : [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    var keyColors = [String : Color] ()
    
    let answers = ["after", "later", "beast", "check", "block"]
    
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false;
    
    var gameOver = false;
    
    
    var gameStarted: Bool{
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disableKeys: Bool{
        !inPlay || currentWord.count == 5
    }
    init ()
    {
        newgame()
    }
    func newgame()
    {
        populateDefaults()
        selectedWord  = answers.randomElement() ?? "block"
        currentWord = ""
        inPlay = true
        tryIndex = 0
        gameOver = false
    }
    
    func populateDefaults()
    {
        guesses = []
        
        for index in 0...5{
            guesses.append(Guess(index: index))
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        for char in letters{
            keyColors[String(char)] = .unused
        }
        
    }
    
    func addToCurrentWord(_ letter: String)
    {
        currentWord += letter;
        updateRow()
    }
    
    func removeLetterFromCurrentWord()
    {
        currentWord.removeLast()
        updateRow()
    }
    func enterWord()
    {
        
        if(currentWord == selectedWord)
        {
            gameOver = true
            setCurrentGuessColors()
            inPlay = false
            
        }
        else
        {
            tryIndex += 1
            if(tryIndex == 6)
            {
                gameOver = true
                inPlay = false
            }
        }
        
    }
    
    func updateRow()
    {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord()
    {
        
    }
    
    func setCurrentGuessColors()
    {
        print(selectedWord)
        let correctLetters = selectedWord.map{ String($0) }
        
        var frequency = [String: Int]()
        
        for letter in correctLetters{
            frequency[letter, default: 0] += 1
        }
        
        for index in 0...4
        {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if guessLetter == correctLetter{
                guesses[tryIndex].bgColors[index] = .correct
                frequency[guessLetter]! = -1
            }
        }
        
        
        for index in 0...4
        {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if correctLetters.contains(guessLetter) && guesses[tryIndex].bgColors[index] != .correct &&
                frequency[guessLetter]! > 0{
                guesses[tryIndex].bgColors[index] = .misplaced
            }
        }
        
        flipCards(for: tryIndex)
        
    }
    
    func flipCards(for row: Int)
    {
        for col in 0...4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(col) * 0.2){
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
}
