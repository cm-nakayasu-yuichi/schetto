//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class StickerTranslator: MultiTranslator, MultiDetranslator {
    
    typealias Input = DBSticker
    typealias Output = StickerModel
    
    func translate(_ input: DBSticker) -> StickerModel {
        let model = StickerModel()
        model.id = input.id
        model.sort = input.sort
        return model
    }
    
    func detranslate(_ output: StickerModel) -> DBSticker {
        let db = DBSticker()
        db.id = output.id
        db.sort = output.sort
        return db
    }
    
    func translate(_ inputs: [DBSticker]) -> [StickerModel] {
        return inputs.map { input -> Output in
            return translate(input)
        }
    }
    
    func detranslate(_ outputs: [StickerModel]) -> [DBSticker] {
        return outputs.map { output -> Input in
            return detranslate(output)
        }
    }
}
