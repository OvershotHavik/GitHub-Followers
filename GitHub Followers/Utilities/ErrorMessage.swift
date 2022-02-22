//
//  ErrorMessages.swift
//  GitHub Followers
//
//  Created by Steve Plavetzky on 2/22/22.
//

import Foundation

enum GFError: String, Error{
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. PLease try again"
}