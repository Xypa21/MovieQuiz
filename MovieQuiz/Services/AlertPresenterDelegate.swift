//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 22.12.2024.
//

import Foundation
protocol AlertPresenterDelegate: AnyObject {
    func didShowAlert(model: AlertModel?)
}
