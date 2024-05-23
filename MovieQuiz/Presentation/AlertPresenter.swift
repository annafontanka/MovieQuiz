//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Anna on 01.05.2024.
//
import Foundation
import UIKit

final class AlertPresenter {
    func showAlert (view controller: UIViewController, alert result: AlertModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert
        )
        alert.view.accessibilityIdentifier = "Game results"
        
        let action = UIAlertAction(
            title: result.buttonText,
            style: .default) { _ in
                result.completion()
            }
        
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
        
    }
}

