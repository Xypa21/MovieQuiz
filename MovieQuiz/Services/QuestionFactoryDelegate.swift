//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 21.12.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?) 
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
