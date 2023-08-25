//
//  ContentView.swift
//  SymbolsGridHeroAnimation
//
//  Created by Eduard Kanevskii on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State private var selectedSymbol: String?
    
    let symbols = ["square.and.arrow.up", "pencil.circle", "pencil.slash", "pencil.line", "folder.fill", "lasso", "eraser.fill", "pencil.and.outline", "trash"]
    var body: some View {
        VStack {
           
            if let selectedSymbol {
                Image(systemName: selectedSymbol)
                    .font(.system(size: 70))
                    .matchedGeometryEffect(id: selectedSymbol, in: namespace)
                    .onTapGesture {
                        withAnimation {
                            self.selectedSymbol = nil
                        }
                    }
                    .animation(.spring())
                
                Spacer()
            } else {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(symbols, id: \.self) { symbol in
                        Image(systemName: symbol)
                            .font(.system(size: 40))
                            .padding()
                            .matchedGeometryEffect(id: symbol, in: namespace)
                            .onTapGesture {
                                selectedSymbol = symbol
                            }
                    }
                }
                .animation(.spring())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
