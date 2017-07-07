import UIKit

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {

    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginWireframeProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: Login Presenter
    
    func performLogin(username: String, password: String) {
        self.interactor?.performLogin(username: username, password: password)
    }
    
    func presentMainView() {
        if let view = view {
            router.presentMainView(fromView: view)
        }
    }
    
    func presentWrongUserAndPasswordError() {
        guard let view = view else {
            return
        }
        
        router.presentWrongUserAndPasswordError(fromView: view)
    }
    
    // MARK: Login Interactor Output
    
    func loginSucceeded() {
        view?.loginSucceeded()
    }
    
    func loginFailed() {
        view?.loginFailed()
    }
}
