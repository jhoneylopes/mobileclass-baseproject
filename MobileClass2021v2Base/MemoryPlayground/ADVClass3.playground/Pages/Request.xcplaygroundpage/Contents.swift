//: [Previous](@previous)

import Foundation

do {
    // Criando uma Request
    let baseURL = URL(string: "https://serpapi.com")!

    var urlComponents = URLComponents(
        url: baseURL,
        resolvingAgainstBaseURL: true
    )!

    urlComponents.path = "/search"

    let searchWord = "coffee"
    let queryItems = [URLQueryItem(name: "q", value: searchWord)]

    urlComponents.queryItems = queryItems
 
    let url = urlComponents.url!

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    print(request.cURL())

    //---------------- End Make Request

    let session = URLSession.shared

    let task = session.dataTask(with: request) { data, response, error in
//        print(String(data: data!, encoding: .utf8))
    }

    task.resume()
}

//: [Next](@next)
