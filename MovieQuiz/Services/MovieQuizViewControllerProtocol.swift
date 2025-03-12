//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 12.03.2025.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(step: QuizStepViewModel)
    func showAlert(results: QuizResultsViewModel)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
}
