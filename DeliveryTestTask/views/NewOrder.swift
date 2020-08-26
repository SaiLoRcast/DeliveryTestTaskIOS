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

//    @ObservedObject var newOrderViewModel = NewOrderViewModel()
//    @ObservedObject var mainViewModel = MainViewModel()
    
    let data: UserInfo
    let dataDeliveryTo: UserInfo
    var addressDeliveryFrom: String = ""
    var addressDeliveryTo: String = ""
    var dateDeliveryFrom: String = ""
    var dateDeliveryTo: String = ""

    let today = Date()
    
    init(data:UserInfo, dataDeliveryTo: UserInfo) {
        self.data = data
        self.dataDeliveryTo = dataDeliveryTo
    
        addressDeliveryFrom = "\(data.location.country), \(data.location.state), \(data.location.city), \(data.location.street)"
        addressDeliveryTo = "\(dataDeliveryTo.location.country), \(dataDeliveryTo.location.state), \(dataDeliveryTo.location.city), \(dataDeliveryTo.location.street)"
        dateDeliveryFrom = "\(dateFormatTime(date: today))"
        dateDeliveryTo = "\(dateFormatTime(date: today.addingTimeInterval(100000)))"
    }
    
    let items: [Weight] = [
        Weight(position: 1, baseCost: 100, weight: "До 1 кг"),
        Weight(position: 2, baseCost: 200, weight: "До 5 кг"),
        Weight(position: 3, baseCost: 300, weight: "До 10 кг"),
        Weight(position: 4, baseCost: 400, weight: "До 15 кг")]
    
    @State var baseCost: Int = 100
    @State var additionalCost: Int = 0
    @State var selectedBtn: Int = 1
    @State private var isExpressCost = false
    @State private var commentFrom = ""

    func dateFormatTime(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }

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
                                Text(addressDeliveryFrom)
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
                            .padding(.top, 26)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                        
                        HStack{
                            
                            Spacer()
                                .frame(width: 16)
                            
                            Button(action: {
                                print("!")
                            }) {
                                Image("calendar")
                                    .padding(12)
                                    .foregroundColor(Color("button"))
                                
                                Text(dateDeliveryFrom)
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    
                                Spacer()
                            }
                            .background(Color("address_background"))
                            .cornerRadius(10)
                            
                            Spacer()
                                .frame(width: 16)
                            
                            Button(action: {
                                print("!")
                            }) {
                                Image("clock")
                                    .padding(12)
                                    .foregroundColor(Color("button"))
                                
                                Text("В любое время")
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
//                                    .frame(maxWidth: .infinity)
//                                    .padding(8)
                                    .foregroundColor(.black)
                                  
                                Spacer()
                                
                            }
                            .background(Color("address_background"))
                            .cornerRadius(10)
                            
                            Spacer()
                                .frame(width: 16)
                        }
                        
                        Text("Комментарий курьеру")
                            .fontWeight(.regular)
                            .font(.system(size: 14))
                            .padding(.top, 26)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                        
                        HStack{
                            Spacer()
                                .frame(width: 16)
                            
                            TextField("Например: звоните в домофон", text: $commentFrom)
                                .font(.none)
                                .padding(12)
                                .background(Color("address_background"))
                                .cornerRadius(10)
                            Spacer()
                                .frame(width: 16)
                            
                        }
                        
                        Spacer()
                            .frame(height: 21)
                        
                }
                .background(Color.white)
                .cornerRadius(20)
                    
                    VStack(alignment: HorizontalAlignment.leading) {
                        
                        HStack{
                            
                            Image("2")
                                .padding(.top, 20)
                                .padding(.leading, 16)
                            
                            Text("Куда доставить")
                                .padding(.top, 20)
                            
                            Spacer()
                            
                        }
                        
                        Text("Адрес доставки")
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
                                Text(addressDeliveryTo)
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
                            .padding(.top, 26)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                        
                        HStack{
                            
                            Spacer()
                                .frame(width: 16)
                            
                            Button(action: {
                                print("!")
                            }) {
                                Image("calendar")
                                    .padding(12)
                                    .foregroundColor(Color("button"))
                                
                                Text(dateDeliveryTo)
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .background(Color("address_background"))
                            .cornerRadius(10)
                            
                            Spacer()
                                .frame(width: 16)
                            
                            Button(action: {
                                print("!")
                            }) {
                                Image("clock")
                                    .padding(12)
                                    .foregroundColor(Color("button"))
                                
                                Text("В любое время")
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
                                    //                                    .frame(maxWidth: .infinity)
                                    //                                    .padding(8)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .background(Color("address_background"))
                            .cornerRadius(10)
                            
                            Spacer()
                                .frame(width: 16)
                        }
                        
                        Text("Комментарий курьеру")
                            .fontWeight(.regular)
                            .font(.system(size: 14))
                            .padding(.top, 26)
                            .padding(.leading, 16)
                            .padding(.bottom, 8)
                        
                        HStack{
                            Spacer()
                                .frame(width: 16)
                            
                            TextField("Например: звоните в домофон", text: $commentFrom)
                                .font(.none)
                                .padding(12)
                                .background(Color("address_background"))
                                .cornerRadius(10)
                            Spacer()
                                .frame(width: 16)
                            
                        }
                        
                        Spacer()
                            .frame(height: 21)
                        
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    
                }
            }
            VStack{
                
                Spacer()
                    .frame(height: 10)
                
                HStack(){
                    Text("\(baseCost + additionalCost) ₽")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.leading, 16)
                        .foregroundColor(Color("button"))
                    
                    
                    Spacer()
                    
                    Button(action: {
                        print("")
                    }) {
                        NavigationLink(destination: ConfirmNewOrder(addressDeliveryFrom:addressDeliveryFrom,dateDeliveryFrom: dateDeliveryFrom,  addressDeliveryTo:addressDeliveryTo, dateDeliveryTo:dateDeliveryTo, finalCost: baseCost + additionalCost)) {
                            Text("Далее")
                                .fontWeight(.regular)
                                .font(.system(size: 17))
                                .padding(8)
                                .frame(width: 208,height: 62)
                                .background(Color("next_button_color"))
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                        }
                    }
                    
                    Spacer()
                        .frame(width: 16)
                }

                Spacer()
                    .frame(height: 50)
            }
            .background(Color.white)

        
        }
        .background(Color("background"))
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
        

    }
    
    func updateBaseCost()  {
        if (isExpressCost){
            additionalCost = 0
        }else{
            additionalCost = 50
        }
    }
    
}
