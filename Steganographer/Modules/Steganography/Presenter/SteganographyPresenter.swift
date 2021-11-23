//
//  SteganographyPresenter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit

enum StegoError: Error {
    case failedEncoding
    case failedDecdoing
}

extension StegoError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedEncoding:
            return NSLocalizedString("Encountered error on encoding text in Image", comment: "Encoding Failure")
        case .failedDecdoing:
            return NSLocalizedString("Encountered error on decoding text from Image", comment: "Decoding Failure")
        }
    }
}

protocol SteganographyPresenter {

    var router: SteganographyRouter? { get set }
    var interactor: StanographyInteractor? { get set }
    var view: SteganographyView? { get set }

    func showLoader()
    func dismissLoader()
    func interactorDidFinishEndcoding(with result: Result<UIImage, Error>)
    func interactorDidFinishDecoding(with result: Result<String, Error>)
}

final class SteganographyPresenterImpl: NSObject, SteganographyPresenter {

    var router: SteganographyRouter?

    var interactor: StanographyInteractor?

    var view: SteganographyView?

    func interactorDidFinishEndcoding(with result: Result<UIImage, Error>) {
        switch result {
        case .success(let image):
            let url = try? exportImageAsPNG(image, filename: "image_enc_\(Int.random(in: 1..<99999))")
            guard let url = url else { return }

            view?.updateImage(with: image, and: url)
        case .failure(let error):
            view?.updateImage(with: error.localizedDescription)
        }
    }

    func interactorDidFinishDecoding(with result: Result<String, Error>) {
        switch result {
        case .success(let text):
            view?.updateText(with: text)
        case .failure(let error):
            view?.updateText(with: error.localizedDescription)
        }
    }

    func showLoader() {
        view?.showSpinner()
    }

    func dismissLoader() {
        view?.dismissSpinner()
    }
}

// MARK: Image saving helpers
extension SteganographyPresenterImpl {

    enum ImageProcessingError: Error {
        case couldNotCreatePNGData
    }

    private func exportImageAsPNG(_ image: UIImage, filename: String) throws -> URL {
        guard let pngData = image.pngData() else { throw ImageProcessingError.couldNotCreatePNGData }
        let temporaryURL = FileManager.default.temporaryDirectory
            .appendingPathComponent(filename)
            .appendingPathExtension("png")
        try pngData.write(to: temporaryURL, options: [])
        return temporaryURL
    }
}