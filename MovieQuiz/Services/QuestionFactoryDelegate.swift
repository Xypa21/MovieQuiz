//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 21.12.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
}
