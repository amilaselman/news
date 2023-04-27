//
//  DetailsView.swift
//  News2
//
//  Created by MacBook on 4/12/23.
//

import SwiftUI

struct DetailsView: View {
//    @StateObject var viewModel = NewsViewModel()
    @State var article : ArticleDB
    @State var viewActive = false
    let backgroundColor = CGColor(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 0.9486688273))
    let fontColor = CGColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    var body: some View {
        NavigationView {
            viewContent
                .navigationTitle("")
                .padding(.all, 10)
                .toolbar {
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        ShareLink(item: article.urlDB ?? String()){
                            Image(systemName: "arrowshape.turn.up.right")
                                .foregroundColor(.gray)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark")
                             .foregroundColor(.gray)
                        }
                    }
                    
                }
        }
    
    }
    var viewContent: some View {
        ScrollView{
        VStack(alignment: .leading) {
            Image(systemName: "photo")
                .data(url: article.urlToImage ?? URL(fileURLWithPath: ""))
                .resizable()
                .scaledToFill()
                .frame(width: 350.0, height: 150.0)
                .cornerRadius(20.0)
                .padding(.all)
            Spacer()
            Text(article.nameSourceDB ?? String())
                .foregroundColor(.white)
                .font(.caption)
                .bold()
                .frame(width: 100, height: 40)
                .background(Color(backgroundColor)).cornerRadius(15.0)
            Text(article.titleDB ?? String())
                .font(.system(size: 30))
                .lineLimit(9)
                .bold()
            Spacer()
            Text(article.authorDB ?? "")
                .font(.title2)
            Spacer()
            Text("Results")
                .font(.title3)
                .fontWeight(.bold)
            if let url = article.url {
                Link(destination: url) {
                    Text(article.contentDB ?? "")
                        .foregroundColor(Color(fontColor))
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                }
            }
            
            
        }
    }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        let  source = Source(id: nil, name: "Yahoo Entertainment")
//        let item = Article(source: source, author: "Ryan Young", title: "Masters 2023 live: Follow Brooks Koepka, Jon Rahm and others as they battle for the green jacket - Yahoo Sports", description:"The final round of the Masters is underway." , url: URL(string: "https://sports.yahoo.com/masters-2023-live-follow-brooks-koepka-jon-rahm-and-others-as-they-battle-for-the-green-jacket-110042679.html")! , urlToImage: URL(string: "https://s.yimg.com/ny/api/res/1.2/n47WshrwZ4Q8wEYd.A8ViA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2023-03/1dd31de0-d6f5-11ed-bdff-8bf5c17e3329") , publishedAt: "2023-04-09T20:29:35Z", content: "Jon Rahm (left) and Brooks Koepka are going head-to-head in the final round of the 2023 Masters. Will one of them walk away with the green jacket? (Photo by Andrew Redington/Getty Images) The final … [+472 chars]")
//        //DetailsView(article: item)
//    }
//}
