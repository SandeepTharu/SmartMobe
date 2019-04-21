//
//  ViewControllerInjector.swift
//  SmartMobeImages
//
//  Created by Avikishor khadka on 4/21/19.
//  Copyright © 2019 Avikishor khadka. All rights reserved.
//

import SwinjectStoryboard

protocol ViewControllerInjecting {
    func inject(viewController identifier: String, in storyboard: String) -> UIViewController
}

struct ViewControllerInjector: ViewControllerInjecting {
    func inject(viewController identifier: String, in storyboard: String) -> UIViewController {
        let viewController = SwinjectStoryboard.create(
            name: storyboard,
            bundle: nil,
            container: SwinjectStoryboard.defaultContainer
            ).instantiateViewController(withIdentifier: identifier)
        
        return viewController
    }
}
