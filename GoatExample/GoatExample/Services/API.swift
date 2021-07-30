//
//  APIService.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import Foundation
import Combine
import SwiftUI

struct API {
    
    /// API Errors.
    enum Error: LocalizedError, Identifiable {
        var id: String { localizedDescription }
        
        case addressUnreachable(URL)
        case invalidResponse
        
        var errorDescription: String? {
            switch self {
            case .invalidResponse: return "The server responded with garbage."
            case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
            }
        }
    }
    
    /// API endpoints.
    enum EndPoint {
        static let baseURL = URL(string: "https://the-sneaker-database.p.rapidapi.com")!
        
        case results
        case nextPage(String, String)
        case shoeID(String)
        
        var url: URLRequest {
            switch self {
            case .results:
                let endPoint = EndPoint.baseURL.appendingPathComponent("sneakers")
                var urlCompenents = URLComponents(url: endPoint, resolvingAgainstBaseURL: true)
                
                let limitQuery = URLQueryItem(name: "limit", value: "100")
                urlCompenents?.queryItems = [limitQuery]
                
                guard let componentsUrl = urlCompenents?.url else { return URLRequest(url: URL(string: "")!) }
                var request = URLRequest(url: componentsUrl)
                
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = [
                    "x-rapidapi-key": APIConstants.key,
                    "x-rapidapi-host": APIConstants.host
                ]
                return request
                
            case .nextPage(let page, let brand):
                let endPoint = EndPoint.baseURL.appendingPathComponent("sneakers")
                var urlCompenents = URLComponents(url: endPoint, resolvingAgainstBaseURL: true)
                
                let limitQuery = URLQueryItem(name: "limit", value: "100")
                let pageQuery = URLQueryItem(name: "page", value: "\(page)".lowercased())
                let brandQuery = URLQueryItem(name: "brand", value:"\(brand)".lowercased())
                urlCompenents?.queryItems = [limitQuery, pageQuery, brandQuery]
                
                guard let componentsUrl = urlCompenents?.url else { return URLRequest(url: URL(string: "")!) }
                var request = URLRequest(url: componentsUrl)
                
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = [
                    "x-rapidapi-key": APIConstants.key,
                    "x-rapidapi-host": APIConstants.host
                ]
                return request
                
            case .shoeID(let id):
                let endPoint = EndPoint.baseURL.appendingPathComponent("sneakers/\(id)")
                let urlCompenents = URLComponents(url: endPoint, resolvingAgainstBaseURL: true)
                guard let componentsUrl = urlCompenents?.url else { return URLRequest(url: URL(string: "")!) }
                var request = URLRequest(url: componentsUrl)
                
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = [
                    "x-rapidapi-key": APIConstants.key,
                    "x-rapidapi-host": APIConstants.host
                ]
                return request
            }
        }
    }
    
    private let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)
    
    // Add your API code here.
    func getTopLevelJSON() -> AnyPublisher<TopLevelJSON, Error> {
        URLSession.shared.dataTaskPublisher(for: EndPoint.results.url)
            .print()
            .receive(on: apiQueue)
            .map { $0.data }
            .decode(type: TopLevelJSON.self, decoder: JSONDecoder())
            .catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
    
    //    // Add your API code here.
    func nextPage(page: String, brand: String) -> AnyPublisher<TopLevelJSON, Error> {
        URLSession.shared.dataTaskPublisher(for: EndPoint.nextPage(page, brand).url)
            .receive(on: apiQueue)
            .map { $0.data }
            .decode(type: TopLevelJSON.self, decoder: JSONDecoder())
            .catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
}

