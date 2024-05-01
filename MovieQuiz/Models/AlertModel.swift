//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Anna on 01.05.2024.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
