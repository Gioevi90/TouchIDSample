import Foundation

//MARK: Wireframe -
protocol SensibleDataWireframeProtocol: class {
    func presentPasswordView(fromView: SensibleDataViewProtocol?)
}
//MARK: Presenter -
protocol SensibleDataPresenterProtocol: class {

    var interactor: SensibleDataInteractorInputProtocol? { get set }
    
    func presentTouchIDIfNeeded()
    func presentPasswordView()
}

//MARK: Interactor -
protocol SensibleDataInteractorOutputProtocol: PasswordOutputCommonProtocol {

    /* Interactor -> Presenter */
    func showPasswordView()
}

protocol SensibleDataInteractorInputProtocol: class {

    var presenter: PasswordOutputCommonProtocol?  { get set }

    /* Presenter -> Interactor */
    func authenticateWithTouchID()
    func checkPassword(password: String)
}

//MARK: View -
protocol SensibleDataViewProtocol: class {

    var presenter: SensibleDataPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func showPasswordView()
    func showSecret()
}
