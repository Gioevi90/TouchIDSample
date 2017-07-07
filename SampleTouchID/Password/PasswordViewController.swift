import UIKit

class PasswordViewController: UIViewController, PasswordViewProtocol {
    @IBOutlet weak var textfield: UITextField!
    
	var presenter: PasswordPresenterProtocol?
    var sensibleDataView: SensibleDataViewProtocol?
    
	override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func dismissKeyboard() {
        textfield.resignFirstResponder()
    }
    
    @IBAction func sendAction(_ sender: AnyObject) {
        guard let password = textfield.text else { return }
        presenter?.performValidatePassword(password: password)
    }
    
    @IBAction func closeAction(_ sender: AnyObject) {
        presenter?.dismissView()
    }
    
    func passwordCheckSucceeded() {
        if let sensibleDataView = sensibleDataView {
            sensibleDataView.showSecret()
        }
        presenter?.dismissView()
    }
}
