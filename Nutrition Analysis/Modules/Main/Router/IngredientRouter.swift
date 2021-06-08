//
//  IngredientRouter.swift
//  NutritionAnalysis
//
//  Created by MacBook Pro on 05/06/2021.
//

import UIKit

class IngredientRouter {
    class var loginStoryboard: UIStoryboard {
        return UIStoryboard(name: "LoginAndRegist", bundle: Bundle.main)
    }
//
////    LoginVC // RegistVC // VerifyEmailVC // ForgetPassVC // VerifyEmailToResetPassVC // RestPass
//
//    class func createSignInVC() -> UIViewController {
//        guard let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else { return UITabBarController() }
//        let nav = CNavigation(rootViewController: loginVC)
////        loginVC.viewModel = LoginViewModel() // Here send whatever u want.
//        nav.modalPresentationStyle = .fullScreen
//        return nav
//    }
//
//    class func createRegistVC() -> UIViewController {
//        guard let registVC = loginStoryboard.instantiateViewController(withIdentifier: "RegistVC") as? RegistVC else { return UITabBarController() }
//        let nav = CNavigation(rootViewController: registVC)
////        loginVC.viewModel = LoginViewModel() // Here send whatever u want.
//        nav.modalPresentationStyle = .fullScreen
//        return nav
//    }
//
//    func navigateToLogin(from view: ViewControllerType) {
//        UIApplication.shared.keyWindowInConnectedScenes?.rootViewController = AuthRouter.createSignInVC()
//    }
//
//    func navigateToRegist(from view: ViewControllerType) {
//        UIApplication.shared.keyWindowInConnectedScenes?.rootViewController = AuthRouter.createRegistVC()
//    }
//
//    func navigateToVerifyEmail(from view: ViewControllerType, email: String) {
//        let vc = AuthRouter.loginStoryboard.instantiateViewController(withIdentifier: "VerifyEmailVC") as? VerifyEmailVC
//        vc?.viewModel = VerifyEmailVM(email: email)
//        if let viewController = view as? UIViewController {
//            viewController.present(vc!, animated: true, completion: nil)
//        }
//    }
//
//    func navigateToForgetPass(from view: ViewControllerType) {
//        let vc = AuthRouter.loginStoryboard.instantiateViewController(withIdentifier: "ForgetPassVC") as? ForgetPassVC
//        if let viewController = view as? UIViewController {
//            viewController.present(vc!, animated: true, completion: nil)
//        }
//    }
//
//    func navigateToVerifyReset(from view: ViewControllerType, email: String) {
//        let vc = AuthRouter.loginStoryboard.instantiateViewController(withIdentifier: "VerifyEmailToResetPassVC") as? VerifyEmailToResetPassVC
//        vc?.viewModel.email = email
//        if let viewController = view as? UIViewController {
//            viewController.present(vc!, animated: true, completion: nil)
//        }
//    }
//
//    func navigateToResetPass(from view: ViewControllerType, code: String, email: String) {
//        let vc = AuthRouter.loginStoryboard.instantiateViewController(withIdentifier: "RestPassVC") as? RestPassVC
//        vc?.viewModel.code = code
//        vc?.viewModel.email = email
//        if let viewController = view as? UIViewController {
//            viewController.present(vc!, animated: true, completion: nil)
//        }
//    }
//
//    func navigateToMainScreen(from view: ViewControllerType) {
//        UIApplication.shared.keyWindowInConnectedScenes?.rootViewController = HomeRouter.createBaseVC()
//    }
//
//    func navigateToTermsOrPrivacy(from view: ViewControllerType, type: String) {
//        let vc = AuthRouter.loginStoryboard.instantiateViewController(withIdentifier: "TermsOrPrivacyVC") as? TermsOrPrivacyVC
//        vc?.policyType = type
//        if let viewController = view as? UIViewController {
//            viewController.present(vc!, animated: true, completion: nil)
//        }
//    }
}
