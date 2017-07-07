import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: class {
    func presentMainView(fromView: LoginViewProtocol)
    func presentWrongUserAndPasswordError(fromView view: LoginViewProtocol)
}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol? { get set }
    
    func performLogin(username: String, password: String)
    func presentWrongUserAndPasswordError()
    func presentMainView()
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func loginSucceeded()
    func loginFailed()
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func performLogin(username: String, password: String)
}

//MARK: View -
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func loginSucceeded()
    func loginFailed()
}
