//
//  MovieQuizViewControllerMock.swift
//  MovieQuizViewControllerMock
//
//  Created by Сёма Шибаев on 12.03.2025.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
   
    func show(step: QuizStepViewModel) {
        <#code#>
    }
    
    func showAlert(results: QuizResultsViewModel) {
        <#code#>
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        <#code#>
    }
    
    func showLoadingIndicator() {
        <#code#>
    }
    
    func hideLoadingIndicator() {
        <#code#>
    }
    
    func showNetworkError(message: String) {
        <#code#>
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
