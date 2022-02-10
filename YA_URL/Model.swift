
import Foundation

struct WsbElement: Decodable {

    let no_of_comments:  Int
    let sentiment: String
    let ticker: String

}

typealias Wsb = [WsbElement]

//
//// MARK: - WelcomeElement
//struct WsbElement: Codable {
//    let noOfComments: Int
//    let sentiment: Sentiment
//    let sentimentScore: Double
//    let ticker: String
//
//    enum CodingKeys: String, CodingKey {
//        case noOfComments = "no_of_comments"
//        case sentiment
//        case sentimentScore = "sentiment_score"
//        case ticker
//    }
//}
//
//enum Sentiment: String, Codable {
//    case bearish = "Bearish"
//    case bullish = "Bullish"
//}
//
//typealias Wsb = [WsbElement]
//
//


