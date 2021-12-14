//
//  StegoEncodingWorker.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 14/12/2021.
//  Copyright (c) 2021. All rights reserved.

import Foundation

protocol StegoEncodingWorker {
    typealias StegoEncodingResult = Result<Void, Error>
    typealias StegoEncodingCompletion = Completion<StegoEncodingResult>

    // TODO: Fill this with public worker methods
    func fetchStegoEncoding(completion: @escaping StegoEncodingCompletion)
}

final class StegoEncodingWorkerImpl {

    init () {

    }
}

extension StegoEncodingWorkerImpl: StegoEncodingWorker {

    // TODO: Fill this with public worker methods
    func fetchStegoEncoding(completion: @escaping StegoEncodingCompletion) {
        completion(.success(()))
    }
}

private extension StegoEncodingWorkerImpl {
    // TODO: Fill this with private worker methods
}
