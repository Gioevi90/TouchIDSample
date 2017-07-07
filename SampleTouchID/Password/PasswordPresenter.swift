import UIKit

class PasswordPresenter: PasswordPresenterProtocol, PasswordInteractorOutputProtocol {

    weak private var view: PasswordViewProtocol?
    var interactor: SensibleDataInteractorInputProtocol?
    private let router: PasswordWireframeProtocol

    init(interface: PasswordViewProtocol, interactor: SensibleDataInteractorInputProtocol?, router: PasswordWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func performValidatePassword(password: String) {
        interactor?.checkPassword(password: password)
    }
    
    func dismissView() {
        guard let view = view else { return }
        
        router.dismiss(view: view)
    }
    
    func presentAuthenticationErrorMessage() {
        guard let view = view else { return }
        router.presentAuthenticationErrorMessage(fromView: view)
    }
    
    // MARK: Password Interactor Output Protocol
    func passwordMatched(succeeded: Bool) {
        if succeeded {
           dismissView()
        } else {
           presentAuthenticationErrorMessage()
        }
    }
}
