//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Anna on 01.05.2024.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    let completion: () -> Void
}
