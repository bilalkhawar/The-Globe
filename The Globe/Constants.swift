//
//  Constants.swift
//  The Globe
//
//  Created by Bilal Khawar on 2024-10-15.
//

import Foundation

struct CustomText {
    static let isProtectedValue = "red"
    
    struct Error {
        static let invalidServerResponseTitle = "Invalid Server Response"
        static let invalidServerResponseMessage = "The server returned an invalid response."
        
        static let decodingErrorTitle = "Decoding Error"
        static let decodingErrorMessage = "There was an issue reading the server response."
    }
    
    struct Alert {
        static let okAction = "OK"
    }
}
