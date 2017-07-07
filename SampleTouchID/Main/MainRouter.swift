import UIKit

class MainRouter: MainWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MainViewController(nibName: nil, bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func presentSensibleDataView(fromView: MainViewProtocol?) {
        let destinationVC = SensibleDataRouter.createModule()
        if let sourceVC = fromView as? UIViewController {
            sourceVC.present(destinationVC, animated: true, completion: nil)
        }
    }
}
