//
//  Keyboard.swift
//  WordleProject
//
//  Created by Dinesh Kumar Raj Kumar on 2022-06-29.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WorldDataModel
    var topRowArray = "QWERTYUIOP".map{ String($0)}
    var secondRowArray = "ASDFGHJKL".map{ String($0)}
    var thirdRowArray = "ZXCVBNM".map{ String($0)}
    var body: some View {
        VStack{
            HStack(spacing:2)
            {
                ForEach(topRowArray, id: \.self){
                    letter in LetterButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.5 : 1)
            }
            HStack(spacing:2)
            {
                ForEach(secondRowArray, id: \.self){
                    letter in LetterButtonView(letter: letter)
                }
                .disabled(dm.disableKeys)
                .opacity(dm.disableKeys ? 0.5 : 1)
            }
            HStack(spacing:2)
            {
                ForEach(thirdRowArray, id: \.self){
                    letter in LetterButtonView(letter: letter)
                }.disabled(dm.disableKeys)
                    .opacity(dm.disableKeys ? 0.5 : 1)
                
                Button{
                    dm.removeLetterFromCurrentWord()
                }label:{
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50).foregroundColor(.primary).background(Color.unused)
                }
                .disabled(dm.currentWord.count == 0 || !dm.inPlay)
                .opacity((dm.currentWord.count == 0 || !dm.inPlay) ? 0.5 : 1.0)
                }
                HStack{
                    Button{
                        dm.enterWord()
                        
                    } label:{
                        Text("Submit")
                    }
                    .disabled(dm.currentWord.count < 5 || !dm.inPlay)
                    .opacity((dm.currentWord.count < 5 || !dm.inPlay) ? 0.5 : 1.0)
                
                }
            }
        }
    }

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard().environmentObject(WorldDataModel()).scaleEffect(Global.keyboardScale)
    }
}
