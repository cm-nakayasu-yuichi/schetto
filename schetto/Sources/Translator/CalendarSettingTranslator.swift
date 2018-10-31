//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class CalendarSettingTranslator: Translator {
    typealias Input = CalendarSetting
    typealias Output = CalendarSettingModel
    
    func translate(_ input: CalendarSetting) -> CalendarSettingModel {
        let model = CalendarSettingModel()
        model.themes = translateThemes(input)
        return model
    }
    
    private func translateThemes(_ input: CalendarSetting) -> CalendarSettingModel.Themes {
        
        
        
        
        
        let themes = CalendarSettingModel.Themes()
        themes.event = CalendarThemeModel(entity: input.eventTheme) ?? defaultEventTheme
        
        
        return themes
    }
    
    private func loadDefaultEntity() -> CalendarTheme {
        let file = File.mainBundle + "default_calendar_setting.json"
        
        
        
        /*
        let f = File.mainBundle + "default_calendar_setting.json"
        if let entity = Json().decode(path: f.path, to: CalendarSetting.self) {
            let translator = CalendarSettingTranslator()
            let model = translator.translate(entity)
            print(Json().encode(entity))
            
        }
        */
    }
}

extension CalendarSettingTranslator {
    
    var defaultEventTheme: CalendarThemeModel {
        let model = CalendarThemeModel()
        model.textColor = .gray
        model.textColor = .gray
        model.textColor = .gray
        return model
    }
}
