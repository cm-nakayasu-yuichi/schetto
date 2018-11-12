//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class Builder {
    
    func main() -> MainViewController {
        let view = instantiate(MainViewController.self, storyboardName: "Main")
        
        let presenter: MainPresenterProtocol = MainPresenter()
        presenter.view = view
        
        let interactor: MainInteractorInput = MainRepository()
        interactor.output = presenter as? MainInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
    func eventEdit() -> EventEditViewController {
        let view = instantiate(EventEditViewController.self, storyboardName: "EventEdit")
        
        let presenter: EventEditPresenterProtocol = EventEditPresenter()
        presenter.view = view
        
        let interactor: EventEditInteractorInput = EventEditRepository()
        interactor.output = presenter as? EventEditInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
    func drawerMenu() -> DrawerMenuViewController {
        let view = instantiate(DrawerMenuViewController.self, storyboardName: "DrawerMenu")
        return view
    }
    
    func launch() -> LaunchViewController {
        let view = instantiate(LaunchViewController.self, storyboardName: "Launch")
        
        let presenter: LaunchPresenterProtocol = LaunchPresenter()
        presenter.view = view
        
        let interactor: LaunchInteractorInput = LaunchRepository()
        interactor.output = presenter as? LaunchInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
    func tutorial() -> TutorialViewController {
        let view = instantiate(TutorialViewController.self, storyboardName: "Tutorial")        
        return view
    }
    
    func terms() -> TermsViewController {
        let view = instantiate(TermsViewController.self, storyboardName: "Terms")
        
        let presenter: TermsPresenterProtocol = TermsPresenter()
        presenter.view = view        
        view.presenter = presenter
        
        return view
    }
    
    func designFontSetting() -> DesignFontSettingViewController {
        let view = instantiate(DesignFontSettingViewController.self, storyboardName: "DesignFontSetting")
        
        let presenter: DesignFontSettingPresenterProtocol = DesignFontSettingPresenter()
        presenter.view = view
        
        let interactor: DesignFontSettingInteractorInput = DesignFontSettingRepository()
        interactor.output = presenter as? DesignFontSettingInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
    func web() -> WebViewController {
        let view = instantiate(WebViewController.self, storyboardName: "Web")
        let presenter: WebPresenterProtocol = WebPresenter()
        presenter.view = view
        view.presenter = presenter
        return view
    }
    
    func text(options: TextViewControllerOptions, handler: @escaping (String) -> ()) -> TextViewController {
        let view = instantiate(TextViewController.self, storyboardName: "Text")
        view.options = options
        view.handler = handler
        return view
    }
    
    func test() -> TestViewController {
        let view = instantiate(TestViewController.self, storyboardName: "Test")
        return view
    }
}

extension Builder {
    
    private func instantiate<T>(_ type: T.Type, storyboardName: String, identifier: String? = nil) -> T where T : UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let id = identifier {
            guard let viewController = storyboard.instantiateViewController(withIdentifier: id) as? T else {
                fatalError("failed instantiate viewController")
            }
            return viewController
        } else {
            guard let viewController = storyboard.instantiateInitialViewController() as? T else {
                fatalError("failed instantiate viewController")
            }
            return viewController
        }
    }
}
