//
//  NewOrder.swift
//  DeliveryTestTask
//
//  Created by Admin on 25.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation
import SwiftUI

struct NewOrder: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedObject var newOrderViewModel = NewOrderViewModel()
    @ObservedObject var mainViewModel = MainViewModel()

    let items: [Weight] = [
        Weight(position: 1, baseCost: 100, weight: "До 1 кг"),
        Weight(position: 2, baseCost: 200, weight: "До 5 кг"),
        Weight(position: 3, baseCost: 300, weight: "До 10 кг"),
        Weight(position: 4, baseCost: 400, weight: "До 15 кг")]
    
    @State var baseCost: Int = 100
    @State var additionalCost: Int = 0
    @State var selectedBtn: Int = 1
    @State private var isExpressCost = false
    
    var body: some View {

        VStack{
            ScrollView{
                VStack {
                    HStack{
                        
                        Button(action: {
                            print("!")
                        }) {
                            Text("Очистить")
                                .fontWeight(.regular)
                                .font(.none)
                                .padding(8)
                                .foregroundColor(Color("clear_button_color"))
                        }
                        
                        Text("Новый заказ")
                            .padding(.leading,50)
                        
                        Spacer()
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("close_new_order")
                                .padding(14)
                                .foregroundColor(Color.black)
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(items) { weight in
                                Button(action: {
                                    self.baseCost = weight.baseCost
                                    self.updateBaseCost()
                                    self.selectedBtn = weight.position
                                }) {
                                    Text("\(weight.weight)")
                                        .fontWeight(.regular)
                                        .font(.none)
                                        .frame(width: 85, height: 38)
                                        .background(self.selectedBtn == weight.position ? Color("button") : Color("background"))
                                        .foregroundColor(self.selectedBtn == weight.position ? Color.white : Color.black)
                                        .cornerRadius(60)
                                }
                                
                            }
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    }
                    
                    Spacer()
                        .frame(height: 16)
                    
                    HStack{
                        
                        Image("express_delivery")
                            .padding(.top, 22)
                            .padding(.leading, 16)
                            .padding(.bottom, 22)
                        
                        Toggle(isOn: $isExpressCost) {
                             Text("")
                            
                        }
                        .padding()
                        .onTapGesture {
                            self.updateBaseCost()
                        }
                                              
                    }
                    .background(Color("express_delivery_background"))
                    .cornerRadius(20)
                    
                    Spacer()
                        .frame(height: 16)
                    
                    VStack(alignment: HorizontalAlignment.leading) {
                        
                        HStack{
                            
                            Image("1")
                                .padding(.top, 20)
                                .padding(.leading, 16)
                            
                            Text("Откуда забрать")
                                .padding(.top, 20)
                            
                            Spacer()
                            
                        }
                        
                        Text("Адрес отправки")
                            .fontWeight(.regular)
                            .font(.system(size: 14))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                        
                        HStack{
                            
                            Spacer()
                                .frame(width: 16)
                            
                            Button(action: {
                                print("!")
                            }) {
                                Text("\(mainViewModel.currentUser.location.country), \(mainViewModel.currentUser.location.state), \(mainViewModel.currentUser.location.city), \(mainViewModel.currentUser.location.street)")
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding(8)
                                    .foregroundColor(.black)
                                    .background(Color("address_background"))
                                    .cornerRadius(10)
                                    
                                }
                        
                            Spacer()
                                .frame(width: 16)
                            
                        }
                        
                        Text("Когда приехать на этот адрес")
                            .fontWeight(.regular)
                            .font(.system(size: 14))
                            .padding(.top, 20)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                        
                        HStack{
                            
                            Spacer()
                                .frame(width: 16)
                            
                            Button(action: {
                                print("!")
                            }) {
                                Text("\(mainViewModel.currentUser.location.country), \(mainViewModel.currentUser.location.state), \(mainViewModel.currentUser.location.city), \(mainViewModel.currentUser.location.street)")
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity)
                                    .padding(8)
                                    .foregroundColor(.black)
                                    .background(Color("address_background"))
                                    .cornerRadius(10)
                                
                            }
                            
                            Spacer()
                                .frame(width: 16)
                            
                        }
                        
                }
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    Text("asd")
                    
                }
            }
            
            HStack(){
                Text("\(baseCost) ₽")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.leading, 16)
                    .foregroundColor(Color("button"))
                
                
                Spacer()
                
                Button(action: {
                    print("")
                }) {
                    Text("Далее")
                        .fontWeight(.regular)
                        .font(.system(size: 17))
                        .padding(8)
                        .frame(width: 208,height: 62)
                        .background(Color("next_button_color"))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                
                Spacer()
                    .frame(width: 16)
            }
        
        }
        .background(Color("background"))
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
        

    }
    
    func updateBaseCost()  {
        if (isExpressCost){
            additionalCost = -50
        }else{
            additionalCost = 50
        }
        self.baseCost += additionalCost
    }
    
}
