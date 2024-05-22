//
//  NoItemsView.swift
//  TodoList
//
//  Created by PC-Ali on 5/22/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate : Bool = false
    
    let secondaryColor : Color = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack(spacing : 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive persone? I think you should click the add button and add button and add a bunch of items to your todo list!").padding(.bottom , 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animate ? secondaryColor: Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(maxWidth: 400 )
                .padding(.horizontal , animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                     x: 0,
                    y:animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0 )
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform:addAnimation)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity)
    }
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever()
            ){
                animate.toggle()
            }
        })
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("Title")
    }
}
