//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 15.01.2025.
//

import Foundation

final class StatisticService: StatisticServiceProtocol{
    
    
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case gamesCount
        case totalAccuracy
        case totalCorrect
        case totalQuestions
    }
    
    
    // Количество сыгранных игр
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        } set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    // Лучший результат игры
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect
                .rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let dateString = storage.string(forKey: Keys.bestGameDate.rawValue) ?? Date().dateTimeString
            let date = DateFormatter.defaultDateTime.date(from: dateString) ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date.dateTimeString, forKey: Keys.bestGameDate.rawValue)
        }
    }
    // Общая точность
    var totalAccuracy: Double {
        guard gamesCount > 0,
              let totalCorrect  = storage.object(forKey: Keys.totalCorrect.rawValue) as? Int,
              let totalQuestions = storage.object(forKey: Keys.totalQuestions.rawValue) as? Int,
              totalQuestions > 0 else {
            return 0.0
        }
        return Double(totalCorrect) / Double(totalQuestions) * 100.0
    }
    
    // Метод для записи новой статистики
    func store(correct count: Int, total amount: Int) {
            // Обновляем количество игр
            gamesCount += 1
            
            
            let totalCorrect = storage.integer(forKey: Keys.totalCorrect.rawValue) + count
            let totalQuestions = storage.integer(forKey: Keys.totalQuestions.rawValue) + amount
            storage.set(totalCorrect, forKey: Keys.totalCorrect.rawValue)
            storage.set(totalQuestions, forKey: Keys.totalQuestions.rawValue)
            
            // Рассчитываем новую точность
            let newTotalAccuracy = Double(totalCorrect) / Double(totalQuestions) * 100.0
            storage.set(newTotalAccuracy, forKey: Keys.totalAccuracy.rawValue)
            
            // Проверяем, является ли текущая игра лучшей
            let newGame = GameResult(correct: count, total: amount, date: Date())
            if newGame.isBetterThan(bestGame) {
                bestGame = newGame
            }
        }
}


