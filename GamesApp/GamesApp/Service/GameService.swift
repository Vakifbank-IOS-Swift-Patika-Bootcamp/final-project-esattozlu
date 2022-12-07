//
//  GameService.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

final class GameService {
    
    enum Endpoints {
        static let baseUrl = "https://api.rawg.io/api/games"
        static let apiKey = "7ed17e23f7984afdb6f574e67473c540"
        static let pageSize = 20
        
        case allGames(page: Int)
        case topRated(page: Int)
        case newlyReleased(page: Int)
        case searchByName(query: String, page: Int)
        case searchById(id: Int)
        
        var urlString: String {
            switch self {
            case .allGames(let page):
                return getAllGamesUrlString(page: page)
            case .topRated(let page):
                return getAllGamesUrlString(page: page) + "&ordering=-rating"
            case .newlyReleased(let page):
                return getAllGamesUrlString(page: page) + "&ordering=-released" + "&dates=1900-01-01,\(Date.convertNowToShortFormat())"
            case .searchByName(let query, let page):
                return getAllGamesUrlString(page: page) + "&search=\(query.trimmingCharacters(in: .whitespacesAndNewlines))"
            case .searchById(let id):
                return Endpoints.baseUrl + "/\(id)" + "?key=\(Endpoints.apiKey)"
            }
        }
        
        var url: URL {
            return URL(string: urlString)!
        }
        
        private func getAllGamesUrlString(page: Int) -> String {
            let allGamesUrlString = Endpoints.baseUrl + "?key=\(Endpoints.apiKey)" + "&page=\(page)" + "&page_size=\(Endpoints.pageSize)"
            return allGamesUrlString
        }
    }
    
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (Result<ResponseType, Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            let statusCode = response.statusCode
            
            if let data = data {
                if statusCode == 200 {
                    let decoder = JSONDecoder()
                    
                    do {
                        let games = try decoder.decode(ResponseType.self, from: data)
                        completion(.success(games))
                    } catch {
                        completion(.failure(DataError.decodingFail(code: -5, message: "Failure when attempting to decode the data.")))
                    }
                    
                } else if statusCode >= 300 && statusCode < 400 {
                    completion(.failure(HttpError.redirection(code: statusCode, message: response.description)))
                } else if statusCode < 500 {
                    completion(.failure(HttpError.clientError(code: statusCode, message: response.description)))
                } else if statusCode > 500 && statusCode < 600 {
                    completion(.failure(HttpError.serverError(code: statusCode, message: response.description)))
                } else {
                    completion(.failure(HttpError.custom(code: statusCode, message: "Unknown status code.")))
                }
            } else {
                completion(.failure(DataError.custom(code: -1, message: "Unknown error, the data is nil.")))
            }
        }
        task.resume()
    }
    
    class func allGames(page:Int, completion: @escaping (Result<GamesResponse, Error>) -> Void) {
        taskForGETRequest(url: Endpoints.allGames(page: page).url, responseType: GamesResponse.self) { status in
            switch status {
            case .success(let games):
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    class func newRelease(page:Int, completion: @escaping (Result<GamesResponse, Error>) -> Void) {
        taskForGETRequest(url: Endpoints.newlyReleased(page: page).url, responseType: GamesResponse.self) { status in
            switch status {
            case .success(let games):
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    class func topRated(page:Int, completion: @escaping (Result<GamesResponse, Error>) -> Void) {
        taskForGETRequest(url: Endpoints.topRated(page: page).url, responseType: GamesResponse.self) { status in
            switch status {
            case .success(let games):
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    class func searchByName(page:Int, query: String, completion: @escaping (Result<GamesResponse, Error>) -> Void) {
        let query = query.withoutSpecials
        let nonDiacriticsQuery = query.replacingOccurrences(of: " ", with: "%20")
        taskForGETRequest(url: Endpoints.searchByName(query: nonDiacriticsQuery, page: page).url, responseType: GamesResponse.self) { status in
            switch status {
            case .success(let games):
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    class func searchById(id:Int, completion: @escaping (Result<GameDetail, Error>) -> Void) {
        taskForGETRequest(url: Endpoints.searchById(id: id).url, responseType: GameDetail.self) { status in
            switch status {
            case .success(let games):
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
