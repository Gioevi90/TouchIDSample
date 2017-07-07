import UIKit

class MainPresenter: MainPresenterProtocol, MainInteractorOutputProtocol {

    weak private var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    private let router: MainWireframeProtocol

    init(interface: MainViewProtocol, interactor: MainInteractorInputProtocol?, router: MainWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func presentSensibleDataView() {
        self.router.presentSensibleDataView(fromView: self.view)
    }
}
