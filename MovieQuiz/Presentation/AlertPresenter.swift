//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 22.12.2024.
//

import Foundation
import UIKit

class AlertPresenter {
    private weak var viewController: UIViewController?
       
       init(viewController: UIViewController) {
           self.viewController = viewController
       }
       
       func present(alertModel: AlertModel) {
           let alert = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
           
           let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
               alertModel.completion?()
           }
           
           alert.addAction(action)
           
           viewController?.present(alert, animated: true, completion: nil)
       }
   
    
    
    weak var delegate: AlertPresenterDelegate?
    
    func setup(delegate: AlertPresenterDelegate) {
        self.delegate = delegate
    }
}
