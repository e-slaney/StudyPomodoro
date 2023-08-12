//
//  Quotes.swift
//  StudyPomodoro
//
//  Created by Evan Slaney on 8/12/23.
//

import Foundation

struct Quote: Decodable {
    let author: String
    let text: String
}

func getQuote() -> Quote {
    /*
    let headers = [
        "X-RapidAPI-Key": "e746244d1bmsh9903ab1d1b89591p100087jsnbaa1b3fed8ae",
        "X-RapidAPI-Host": "quotes-inspirational-quotes-motivational-quotes.p.rapidapi.com"
    ]
    

    let request = NSMutableURLRequest(url: NSURL(string: "https://quotes-inspirational-quotes-motivational-quotes.p.rapidapi.com/quote?token=ipworld.info")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    */
    let result: Quote? = nil
    /*
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error as Any)
        } else {
            guard let data = data else {
                return
            }
                        
            guard let quote = try? JSONDecoder().decode(Quote.self, from: data) else {
                return
            }
            result = quote
        }
    })

    dataTask.resume()
     */
    if let result = result {
        return result
    } else {
        return Quote(author: "Nelson Mandela", text: "It always seems impossible until it's done.")
    }
}

