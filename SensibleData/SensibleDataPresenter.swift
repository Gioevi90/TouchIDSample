import UIKit

class SensibleDataPresenter: SensibleDataPresenterProtocol, SensibleDataInteractorOutputProtocol {

    weak private var view: SensibleDataViewProtocol?
    var interactor: SensibleDataInteractorInputProtocol?
    private let router: SensibleDataWireframeProtocol

    init(interface: SensibleDataViewProtocol, interactor: SensibleDataInteractorInputProtocol?, router: SensibleDataWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func presentTouchIDIfNeeded() {
        self.interactor?.authenticateWithTouchID()
    }
    
    func presentPasswordView() {
        router.presentPasswordView(fromView: view)
    }
    
    // MARK: SensibleDataInteractorOutputProtocol
    
    func showPasswordView() {
        view?.showPasswordView()
    }
    
    func passwordMatched(succeeded: Bool) {
        if succeeded {
            view?.showSecret()
        }
    }
}
