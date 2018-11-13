//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class StickerGroupTranslator: MultiTranslator {
    
    typealias Input = DBStickerGroup
    typealias Output = StickerGroupModel
    
    func translate(_ inputs: [DBStickerGroup]) -> [StickerGroupModel] {
        return inputs.map { input -> StickerGroupModel in
            return translate(input)
        }
    }
    
    func translate(_ input: DBStickerGroup) -> StickerGroupModel {
        let model = StickerGroupModel()
        
        return model
    }
}
