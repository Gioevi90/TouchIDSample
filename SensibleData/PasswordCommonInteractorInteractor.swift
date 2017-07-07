import UIKit
import LocalAuthentication

private let hardCodedpassword = "test"

class PasswordCommonInteractor: SensibleDataInteractorInputProtocol {

    weak var presenter: PasswordOutputCommonProtocol?
    
    func authenticateWithTouchID() {
        guard let _ = self.obtainUserName() else {
            return
        }
        guard canAuthenticateWithTouchID() else {
            if let presenter = presenter as? SensibleDataInteractorOutputProtocol {
                presenter.showPasswordView()
            }
            return
        }
        
        let context = LAContext()
        context.localizedFallbackTitle = ""
        let reason = NSLocalizedString("The application requires authentication to access sensible data", comment: "Reason for using Owner Biometrics")
        
        let password = self.obtainPassword(reason: reason)
        
        if let password = password {
            checkPassword(password: password)
        } else if let presenter = presenter as? SensibleDataInteractorOutputProtocol {
            presenter.showPasswordView()
        }
    }
    
    func checkPassword(password: String) {
        presenter?.passwordMatched(succeeded: password == hardCodedpassword)
    }
    
    private func isCredentialSet() -> Bool {
        let context = LAContext()
        
        return context.isCredentialSet(.applicationPassword)
    }
    
    private func canAuthenticateWithTouchID() -> Bool {
        let context = LAContext()
        
        return context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    private func obtainPassword(reason: String) -> String? {
        let query: NSMutableDictionary = NSMutableDictionary(
            objects: [  kSecClassGenericPassword,
                        "it.catania.SampleTouchID.authentication",
                        kCFBooleanTrue,
                        kSecMatchLimitOne,
                        reason],
            forKeys: [  kSecClass as! NSCopying,
                        kSecAttrService as! NSCopying,
                        kSecReturnData as! NSCopying,
                        kSecMatchLimit as! NSCopying,
                        kSecUseOperationPrompt as! NSCopying])
        
        var dataTypeRef: CFTypeRef?
        
        let status: OSStatus = SecItemCopyMatching(query, &dataTypeRef)
        
        if let resultData = dataTypeRef as? Data, let password = String(data: resultData, encoding: String.Encoding.utf8), status == errSecSuccess
        {
            print("Keychain entry: " + password)
            return password
        } else {
            print("Something went wrong")
            return nil
        }
    }
    
    private func obtainUserName() -> String? {
        return UserDefaults.standard.string(forKey: "username")
    }
}
