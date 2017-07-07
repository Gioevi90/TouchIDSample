import UIKit

class MainViewController: UIViewController, MainViewProtocol {
	var presenter: MainPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openSensibleDataView() {
        presenter?.presentSensibleDataView()
    }
}
