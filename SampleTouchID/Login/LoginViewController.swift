import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
	var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            presenter?.presentWrongUserAndPasswordError()
            return
        }
        presenter?.performLogin(username: username, password: password)
    }
    
    @IBAction func resignKeyboard(_ sender: AnyObject) {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
        
    func loginSucceeded() {
        presenter?.presentMainView()
    }
    
    func loginFailed() {
        presenter?.presentWrongUserAndPasswordError()
    }
}
