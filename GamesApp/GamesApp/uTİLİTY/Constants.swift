//
//  Constants.swift
//  GamesApp
//
//  Created by Hasan Esat Tozlu on 6.12.2022.
//

import Foundation

enum HttpError: Error {
    case redirection(code: Int, message: String)
    case clientError(code: Int, message: String)
    case serverError(code: Int, message: String)
    case custom(code: Int, message: String)
}

enum DataError: Error {
    case decodingFail(code: Int, message: String)
    case encodingFail(code: Int, message: String)
    case localStorageFail(code: Int, message: String)
    case custom(code: Int, message: String)
}
