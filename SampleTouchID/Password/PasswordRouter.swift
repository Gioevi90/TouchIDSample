import UIKit

class PasswordRouter: PasswordWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(sensibleDataView: SensibleDataViewProtocol?) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = PasswordViewController(nibName: nil, bundle: nil)
        let interactor = PasswordCommonInteractor()
        let router = PasswordRouter()
        let presenter = PasswordPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        view.sensibleDataView = sensibleDataView
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    // MARK: PasswordWireframeProtocol
    
    func dismiss(view: PasswordViewProtocol) {
        if let view = view as? UIViewController {
            view.dismiss(animated: true, completion: nil)
        }
    }
    
    func presentAuthenticationErrorMessage(fromView view: PasswordViewProtocol) {
        guard let view = view as? UIViewController else { return }
        
        let alertController = UIAlertController.init(title: "Authentication", message: "AuthenticationFailed", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        view.present(alertController, animated: true, completion: nil)
    }
}
