import UIKit

class SensibleDataRouter: SensibleDataWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SensibleDataViewController(nibName: nil, bundle: nil)
        let interactor = PasswordCommonInteractor()
        let router = SensibleDataRouter()
        let presenter = SensibleDataPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func presentPasswordView(fromView: SensibleDataViewProtocol?) {
        let destinationVC = PasswordRouter.createModule(sensibleDataView: fromView)
        if let sourceVC = fromView as? UIViewController {
            sourceVC.present(destinationVC, animated: true, completion: nil)
        }
    }
}
