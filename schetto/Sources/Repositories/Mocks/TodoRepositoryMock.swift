//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class TodoRepositoryMock: TodoInteractorInput {

    weak var output: TodoInteractorOutput!
        
    func createTodo() {
        let todo = TodoModel()
        output.created(todo: todo)
    }
    
    func copy(_ todo: TodoModel) {
        
    }
    
    func fetchTodoList(sortType: TodoSortType) {
        if sortType == .limit {
            let todoListModels = TodoRepositoryMock.todoListModels()
            output.fetched(list: todoListModels)
        } else {
            output.fetched(list: [])
        }
    }
    
    func register(_ todo: TodoModel) {
        output.registered(todo: todo)
    }
    
    func registerNotify(before minutes: Int, to id: String) {
        
    }
    
    func remove(_ todo: TodoModel) {
        
    }
}

extension TodoRepositoryMock {
    
    class func todoListModels() -> [TodoListModel] {
        var ret = [TodoListModel]()
        ret.append(todoListModel0())
        ret.append(todoListModel1())
        return ret
    }
    
    class func todoListModel0() -> TodoListModel {
        let ret = TodoListModel()
        ret.title = "リスト0"
        ret.todos.append(todoModel0())
        ret.todos.append(todoModel1())
        return ret
    }
    
    class func todoListModel1() -> TodoListModel {
        let ret = TodoListModel()
        ret.title = "リスト1"
        ret.todos.append(todoModel0())
        return ret
    }
    
    class func todoModel0() -> TodoModel {
        let ret = TodoModel()
        ret.id = "0_0"
        ret.title = """
        車は日常の移動手段として、また趣味やレジャーなどの道具として、今や人々の生活に無くてはならない物になっています。
        """
        ret.limit = nil
        ret.priority = .normal
        ret.summery = """
        車は日常の移動手段として、また趣味やレジャーなどの道具として、今や人々の生活に無くてはならない物になっています。
        免許があれば誰でも気軽に乗ることが出来る便利で身近な乗り物です。しかし、車に関する知識や情報をあまり持たないドライバーが多いのも事実です。
        車の知識や情報がないために困ったり、思わぬトラブルに巻き込まれてしまうこともあります。
        そのような観点から、このサイトでは車に関する基本的なことをもっと多くの方に学んで頂こうと、幅広い視点から初心者にも分かりやすく解説しています。
        そして車のことを少しでも多く理解して頂ければ、今よりもずっと車を身近に感じることができ、より快適なカーライフを送ることが出来ると確信しております。
        そうすることで当サイトが皆様に少しでもお役に立てれば幸甚です。
        尚、ここでいう車とは一般的な乗用車タイプを指し、トラック・バスなどの商用系は除外しておりますのでご了承ください。
        """
        ret.completed = false
        ret.notify = 0
        ret.status = .published
        ret.stickers = []
        ret.assets = []
        return ret
    }
    
    class func todoModel1() -> TodoModel {
        let ret = TodoModel()
        ret.id = "0_1"
        ret.title = """
        車は日常の移動手段として、また趣味やレジャーなどの道具として、今や人々の生活に無くてはならない物になっています。
        """
        ret.limit = Date(year: 2018, month: 12, day: 24, hour: 20, minute: 0)
        ret.priority = .required
        ret.summery = """
        車は日常の移動手段として、また趣味やレジャーなどの道具として、今や人々の生活に無くてはならない物になっています。
        免許があれば誰でも気軽に乗ることが出来る便利で身近な乗り物です。しかし、車に関する知識や情報をあまり持たないドライバーが多いのも事実です。
        車の知識や情報がないために困ったり、思わぬトラブルに巻き込まれてしまうこともあります。
        そのような観点から、このサイトでは車に関する基本的なことをもっと多くの方に学んで頂こうと、幅広い視点から初心者にも分かりやすく解説しています。
        そして車のことを少しでも多く理解して頂ければ、今よりもずっと車を身近に感じることができ、より快適なカーライフを送ることが出来ると確信しております。
        そうすることで当サイトが皆様に少しでもお役に立てれば幸甚です。
        尚、ここでいう車とは一般的な乗用車タイプを指し、トラック・バスなどの商用系は除外しておりますのでご了承ください。
        """
        ret.completed = true
        ret.notify = 30
        ret.status = .published
        ret.stickers = []
        ret.assets = []
        return ret
    }
}
