//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

enum ColorSet {
    case `default`
    case text
    case event
    
    var colors: [UIColor] {
        switch self {
        case .default:
            return [
                #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                #colorLiteral(red: 0.9019607843, green: 0, blue: 0.07058823529, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5960784314, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9450980392, blue: 0, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7647058824, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0, green: 0.6, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0, green: 0.6196078431, blue: 0.5882352941, alpha: 1),
                #colorLiteral(red: 0.9019607843, green: 0, blue: 0.07058823529, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5960784314, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9450980392, blue: 0, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7647058824, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0, green: 0.6, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0, green: 0.6196078431, blue: 0.5882352941, alpha: 1),
                #colorLiteral(red: 0.9019911024, green: 0, blue: 0.07059060801, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5960784314, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9450980392, blue: 0, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7647058824, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0, green: 0.6, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0, green: 0.6196078431, blue: 0.5882352941, alpha: 1),
                #colorLiteral(red: 0.9019607843, green: 0, blue: 0.07058823529, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5960784314, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9450980392, blue: 0, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7647058824, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0, green: 0.6, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0, green: 0.6196078431, blue: 0.5882352941, alpha: 1),
                #colorLiteral(red: 0.6533171211, green: 0, blue: 0.051129166, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5960784314, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9450980392, blue: 0, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7647058824, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0, green: 0.6, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0, green: 0.6196078431, blue: 0.5882352941, alpha: 1),
                #colorLiteral(red: 0.4021235447, green: 0, blue: 0.03147053828, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5960784314, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9450980392, blue: 0, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7647058824, blue: 0.1215686275, alpha: 1), #colorLiteral(red: 0, green: 0.6, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0, green: 0.6196078431, blue: 0.5882352941, alpha: 1),
                #colorLiteral(red: 0, green: 0.6274509804, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0, green: 0.4078431373, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1254901961, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.02745098039, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 0.8941176471, green: 0, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0, blue: 0.3098039216, alpha: 1),
                #colorLiteral(red: 0, green: 0.6274509804, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0, green: 0.4078431373, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1254901961, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.02745098039, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 0.8941176471, green: 0, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0, blue: 0.3098039216, alpha: 1),
                #colorLiteral(red: 0, green: 0.6274509804, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0, green: 0.4078431373, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1254901961, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.02745098039, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 0.8941176471, green: 0, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0, blue: 0.3098039216, alpha: 1),
                #colorLiteral(red: 0, green: 0.6274509804, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0, green: 0.4078431373, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1254901961, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.02745098039, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 0.8941176471, green: 0, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0, blue: 0.3098039216, alpha: 1),
                #colorLiteral(red: 0, green: 0.6274509804, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0, green: 0.4078431373, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1254901961, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.02745098039, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 0.8941176471, green: 0, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0, blue: 0.3098039216, alpha: 1),
                #colorLiteral(red: 0, green: 0.6274509804, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0, green: 0.4078431373, blue: 0.7176470588, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1254901961, blue: 0.5333333333, alpha: 1), #colorLiteral(red: 0.5725490196, green: 0.02745098039, blue: 0.5137254902, alpha: 1), #colorLiteral(red: 0.8941176471, green: 0, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0, blue: 0.3098039216, alpha: 1),
            ]
        case .text:
            return []
        case .event:
            return []
        }
    }
}
