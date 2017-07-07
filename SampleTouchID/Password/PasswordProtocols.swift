import Foundation

//MARK: Wireframe -
protocol PasswordWireframeProtocol: class {
    func dismiss(view: PasswordViewProtocol)
    func presentAuthenticationErrorMessage(fromView view: PasswordViewProtocol)
}

//MARK: Common Interactor
protocol PasswordOutputCommonProtocol: class {
    func passwordMatched(succeeded: Bool)
}

//MARK: Interactor -
protocol PasswordInteractorOutputProtocol: PasswordOutputCommonProtocol {
    
    /* Interactor -> Presenter */
}


//MARK: Presenter -
protocol PasswordPresenterProtocol: class {

    var interactor: SensibleDataInteractorInputProtocol? { get set }
    
    func performValidatePassword(password: String)
    func dismissView()
}

protocol PasswordInteractorInputProtocol: class {

    var presenter: PasswordInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol PasswordViewProtocol: class {

    var presenter: PasswordPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
