//
//  ContentView.swift
//  RollDice
//
//  Created by 郭冠杰 on 2020/4/22.
//  Copyright © 2020 郭冠杰. All rights reserved.
//

import SwiftUI

struct Dice: Identifiable {
    let id: UUID
    let diceColor: Color
    let max: Int
    var number: Int
    
    init(max: Int, diceColor: Color){
        self.id = UUID()
        self.diceColor = diceColor
        self.max = max
        self.number = Int.random(in: 1...max)
    }
    
}

struct ContentView: View {
    
    @State var dices = [[Dice]]()
    @State var dices_temp = [Dice]()
    
    var body: some View {
        
        VStack{
            
            
            
            
            
            
            
            ForEach(0..<dices.count, id: \.self) { n in
                
                HStack{
                    ForEach(self.dices[n]){ dice in
                        Text("\(dice.number)")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 70, height: 70)
                            .background(dice.diceColor)
                            .padding()
                            
                            .onTapGesture {
                                
                                let index = self.dices_temp.firstIndex { item in
                                    item.id == dice.id
                                }
                                
                                if index != nil {
                                    self.dices_temp.remove(at: index!)
                                }
                                
                                var diceNum = self.dices_temp.count
                                let loopNum = (diceNum - 1) / 3
                                let rest = diceNum % 3
                                
                                self.dices = [[Dice]]()
                                
                                for i in 0...loopNum{
                                    
                                    if diceNum >= 3{
                                        self.dices.append(Array(self.dices_temp[3*i...3*i+2]))
                                        diceNum -= 3
                                    }
                                    else if diceNum > 0 {
                                        self.dices.append(Array(self.dices_temp[3*i...3*i+rest-1]))
                                        diceNum -= rest
                                    }
                                    
                                }
                                
                                
                                
                                
                        }
                    }
                }
                
            }
            
            
            
            
            //            if dices.count > 0 {
            //
            //                HStack{
            //
            //                    ForEach(dices[0]){ dice in
            //                        Text("\(dice.number)")
            //                    }
            //
            //                }
            //            }
            //
            //            if dices.count > 1 {
            //
            //                HStack{
            //
            //                    ForEach(dices[1]){ dice in
            //                        Text("\(dice.number)")
            //                    }
            //
            //                }
            //            }
            
            Spacer()
            
            HStack{
                Button("4"){
                    
                    if self.dices_temp.count < 12 {
                        
                        self.dices_temp.append(Dice(max: 4, diceColor: Color.blue))
                        
                        var diceNum = self.dices_temp.count
                        let loopNum = (diceNum - 1) / 3
                        let rest = diceNum % 3
                        
                        self.dices = [[Dice]]()
                        
                        for i in 0...loopNum{
                            
                            if diceNum >= 3{
                                self.dices.append(Array(self.dices_temp[3*i...3*i+2]))
                                diceNum -= 3
                            }
                            else if diceNum > 0 {
                                self.dices.append(Array(self.dices_temp[3*i...3*i+rest-1]))
                                diceNum -= rest
                            }
                            
                        }
                        
                        //                self.dices.append(self.dices_temp)
                    }
                }
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .padding()
                
                
                Button("6"){
                    
                    if self.dices_temp.count < 12 {
                        self.dices_temp.append(Dice(max: 6, diceColor: Color.red))
                        
                        var diceNum = self.dices_temp.count
                        let loopNum = (diceNum - 1) / 3
                        let rest = diceNum % 3
                        
                        self.dices = [[Dice]]()
                        
                        for i in 0...loopNum{
                            
                            if diceNum >= 3{
                                self.dices.append(Array(self.dices_temp[3*i...3*i+2]))
                                diceNum -= 3
                            }
                            else if diceNum > 0 {
                                self.dices.append(Array(self.dices_temp[3*i...3*i+rest-1]))
                                diceNum -= rest
                            }
                            
                        }
                        
                        //                self.dices.append(self.dices_temp)
                    }
                }
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.red)
                .padding()
                
                
                
                Button("8"){
                    
                    if self.dices_temp.count < 12 {
                        self.dices_temp.append(Dice(max: 8, diceColor: Color.yellow))
                        
                        var diceNum = self.dices_temp.count
                        let loopNum = (diceNum - 1) / 3
                        let rest = diceNum % 3
                        
                        self.dices = [[Dice]]()
                        
                        for i in 0...loopNum{
                            
                            if diceNum >= 3{
                                self.dices.append(Array(self.dices_temp[3*i...3*i+2]))
                                diceNum -= 3
                            }
                            else if diceNum > 0 {
                                self.dices.append(Array(self.dices_temp[3*i...3*i+rest-1]))
                                diceNum -= rest
                            }
                            
                        }
                        
                        //                self.dices.append(self.dices_temp)
                    }
                }
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.yellow)
                .padding()
            }
            
            
            
            
            
            ZStack{
                
                Circle()
                    .fill(Color.green)
                
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
                    .padding(4)
                
                Button("Roll"){
                    //                    self.dices[0].number = Int.random(in: 1...self.dices[0].max)
                    
                    //                for i in 0..<self.dices.count{
                    //                    self.dices[i].number = Int.random(in: 1...self.dices[i].max)
                    //                }
                    
                    
                    for i in 0..<self.dices.count {
                        
                        for j in 0..<self.dices[i].count {
                            self.dices[i][j].number = Int.random(in: 1...self.dices[i][j].max)
                        }
                        
                    }
                    
                    
                }
                .foregroundColor(.white)
                
            } // ZStack
                .frame(width: 75, height: 75)
                .padding()
            
        }
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
