//
//  SteganographyRouter.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 04/11/2021.
//

import Foundation
import UIKit
import DisguisedSwiftly



class SteganographyRouter: PresenterToRouterSteganographyProtocol {
    var entry: EntryPoint?

    static func start() -> StegoRouter {

        let router = SteganographyRouter()
        var view: SteganographyView = SteganographyViewController()
        var interactor: StegoInteractor = SteganographyInteractor(stego: Stego())
        let presenter: StegoPresenter = SteganographyPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter

        router.entry = view as? EntryPoint

        return router
    }
    
    func showEncoding() {
            
    }
    

}
