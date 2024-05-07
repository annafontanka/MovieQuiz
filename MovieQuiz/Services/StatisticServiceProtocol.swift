//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Anna on 05.05.2024.
//

import Foundation

protocol StatisticServiceProtocol {
    
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    
    func store(correct count: Int, total amount: Int)
}

