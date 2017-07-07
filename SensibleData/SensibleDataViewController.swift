import UIKit

class SensibleDataViewController: UIViewController, SensibleDataViewProtocol {
    @IBOutlet weak var sensibleLabel: UILabel!

	var presenter: SensibleDataPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sensibleLabel.text = "*********"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.presentTouchIDIfNeeded()
    }
    
    func showSecret() {
        sensibleLabel.text = "Ciao a tutti!"
    }
    
    func showPasswordView() {
        presenter?.presentPasswordView()
    }
}
