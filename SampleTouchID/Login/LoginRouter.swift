import UIKit

class LoginRouter: LoginWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = LoginViewController(nibName: nil, bundle: nil)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func presentMainView(fromView: LoginViewProtocol) {
        let destinationVC = MainRouter.createModule()
        if let sourceVC = fromView as? UIViewController {
            sourceVC.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    func presentWrongUserAndPasswordError(fromView view: LoginViewProtocol) {
        guard let view = view as? UIViewController else { return }
        
        let alertController = UIAlertController.init(title: "Authentication", message: "Wrong username or password", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        view.present(alertController, animated: true, completion: nil)
    }
}
