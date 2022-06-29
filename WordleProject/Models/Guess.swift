//
//  Guess.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import SwiftUI

struct Guess{
    let index : Int
    var word = "     "
    var bgColors = [Color] (repeating: .wrong, count: 5)
    var cardFlipped = [Bool] (repeating: false, count: 5)
    var guessLetters: [String]{
        word.map{ String($0) }
    }

}
