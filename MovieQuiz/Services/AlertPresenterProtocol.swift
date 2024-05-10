//
//  AlertPresenterProtocol.swift
//  MovieQuiz
//
//  Created by Anna on 02.05.2024.
//

import Foundation

protocol AlertPresenterProtocol: AnyObject {
    
    func showAlert(model result : AlertModel)
}
