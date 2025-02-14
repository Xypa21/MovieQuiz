//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Сёма Шибаев on 22.12.2024.
//

import Foundation
import UIKit
internal struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    var completion: (() -> Void)?
    }

