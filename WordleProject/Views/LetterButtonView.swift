//
//  LetterButtonView.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import SwiftUI

struct LetterButtonView: View{
    @EnvironmentObject var dm : WorldDataModel
    var letter: String
    var body: some View{
    Button {
        dm.addToCurrentWord(letter)
    }label:
        {
            Text(letter).font(.system(size:20)).frame(width: 35, height: 50).background(dm.keyColors[letter]).foregroundColor(.primary)
        }.buttonStyle(.plain)
    }
}

struct LetterButtonView_Previews :PreviewProvider{
    static var previews: some View{
        LetterButtonView(letter:"L").environmentObject(WorldDataModel())
    }
}
