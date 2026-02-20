//
//  ErrorMessage.swift
//  GHFollowersV3
//
//  Created by Владилсав on 20/2/26.
//

import Foundation

enum GFError: String, Error {
    case invalidUserName =
        "This username created an invalid request. Please try again later"
    case unableToComplete =
        "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response. Please try again"
    case invalidData = "No data returned. Please try again"

}
