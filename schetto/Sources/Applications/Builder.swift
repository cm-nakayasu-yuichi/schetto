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
    
    func mainMonthly() -> MainMonthlyViewController {
        let view = instantiate(MainMonthlyViewController.self, storyboardName: "MainMonthly")
        
        let presenter: MainMonthlyPresenterProtocol = MainMonthlyPresenter()
        presenter.view = view
        
        let interactor: MainMonthlyInteractorInput = MainMonthlyRepository()
        interactor.output = presenter as! MainMonthlyInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
    func event() -> EventViewController {
        let view = instantiate(EventViewController.self, storyboardName: "Event")
        
        let presenter: EventPresenterProtocol = EventPresenter()
        presenter.view = view
        
        let interactor: EventInteractorInput = EventRepository()
        interactor.output = presenter as! EventInteractorOutput
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
    
    func todoList() -> TodoListViewController {
        let view = instantiate(TodoListViewController.self, storyboardName: "TodoList")
        
        let presenter: TodoListPresenterProtocol = TodoListPresenter()
        presenter.view = view
        
        let interactor: TodoInteractorInput = TodoRepositoryMock()//TodoRepository()
        interactor.output = presenter as? TodoInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
        
    func todoDetail(todo: TodoModel?) -> TodoDetailViewController {
        let view = instantiate(TodoDetailViewController.self, storyboardName: "TodoDetail")
        view.todo = todo
        
        let presenter: TodoDetailPresenterProtocol = TodoDetailPresenter()
        presenter.view = view
        
        let interactor: TodoInteractorInput = TodoRepositoryMock()//TodoRepository()
        interactor.output = presenter as? TodoInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
	func web(urlString: String) -> WebViewController {
        let view = instantiate(WebViewController.self, storyboardName: "Web")
		view.initialUrlString = urlString
		
		let presenter: WebPresenterProtocol = WebPresenter()
        presenter.view = view
        view.presenter = presenter
		
		return view
    }
    
    func datePicker(dateTime: Date, title: String, commitHandler: @escaping DatePickerViewController.CommitHandler) -> DatePickerViewController {
        let view = instantiate(DatePickerViewController.self, storyboardName: "DatePicker")
        view.title = title
        view.dateTime = dateTime.fixed(second: 0) // 秒は不要
        view.commitHandler = commitHandler
        
        let presenter: DatePickerPresenterProtocol = DatePickerPresenter()
        presenter.view = view
        
        let interactor: DatePickerInteractorInput = DatePickerRepository()
        interactor.output = presenter as? DatePickerInteractorOutput
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
    func colorPicker(color: UIColor?, title: String, commitHandler: @escaping ColorPickerViewController.CommitHandler) -> ColorPickerViewController {
        let view = instantiate(ColorPickerViewController.self, storyboardName: "ColorPicker")
        view.title = title
        view.color = color
        view.commitHandler = commitHandler
        return view
    }
    
    func locationSearch(location: String, title: String, commitHandler: @escaping LocationSearchViewController.CommitHandler) -> LocationSearchViewController {
        let view = instantiate(LocationSearchViewController.self, storyboardName: "LocationSearch")
        view.title = title
        view.initialText = location
        view.commitHandler = commitHandler
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
