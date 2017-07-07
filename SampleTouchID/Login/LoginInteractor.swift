import UIKit
import LocalAuthentication

private let hardcodedUser = "test@test.it"
private let hardCodedpassword = "test"

class LoginInteractor: LoginInteractorInputProtocol {

    weak var presenter: LoginInteractorOutputProtocol?
    
    func performLogin(username: String, password: String) {
        if username == hardcodedUser && password == hardCodedpassword {
            self.storeUsername(username: username)
            self.storePassword(password: password)
            
            presenter?.loginSucceeded()
            return
        }
        presenter?.loginFailed()
    }
    
    private func storeUsername(username: String) {
        UserDefaults.standard.set(username, forKey: "username")
    }
    
    private func storePassword(password: String) {
        if let data = password.data(using: String.Encoding.utf8),
           let secAccessControl = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                                                  kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
                                                                  .touchIDAny,
                                                                  nil) {
            
//            let query: NSMutableDictionary = NSMutableDictionary(
//                objects: [  kSecClassGenericPassword,
//                            "it.catania.SampleTouchID.authentication",
//                            kCFBooleanTrue,
//                            kSecMatchLimitOne],
//                forKeys: [  kSecClass as! NSCopying,
//                            kSecAttrService as! NSCopying,
//                            kSecReturnData as! NSCopying,
//                            kSecMatchLimit as! NSCopying])
            
            let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                        kSecAttrService as String: "it.catania.SampleTouchID.authentication"
                                        
            ]
            
//            let attributes: NSMutableDictionary = NSMutableDictionary(
//                objects: [kSecClassGenericPassword,
//                          "it.catania.SampleTouchID.authentication",
//                          data,
//                          kSecUseAuthenticationUIAllow,
//                          secAccessControl],
//                forKeys: [kSecClass as! NSCopying,
//                          kSecAttrService as! NSCopying,
//                          kSecValueData as! NSCopying,
//                          kSecUseAuthenticationUI as! NSCopying,
//                          kSecAttrAccessControl as! NSCopying])
            
            let attributesToUpdate: [String: Any] = [kSecValueData as String: data]
            
            let update_status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            
            assert(update_status != errSecParam, "parameters must be correct")
            
//            let delete_query: NSDictionary = [
//                kSecClass: kSecClassGenericPassword,
//                kSecAttrService: "it.catania.SampleTouchID.authentication",
//                kSecReturnData: false
//            ]
//
//            let delete_status = SecItemDelete(delete_query)
//            
//            if delete_status != errSecSuccess && delete_status != errSecItemNotFound  {
//                print("DELETE Error: \(delete_status).")
//            }
//            SecItemAdd(attributes, nil)
        }
    }
}
