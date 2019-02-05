@testable import NewsCore

import PlaygroundSupport

let assembly = CoreAssembly(navigationController: UINavigationController())

let todayViewController = assembly.todayAssembly.viewController()

todayViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)

PlaygroundPage.current.liveView = todayViewController
