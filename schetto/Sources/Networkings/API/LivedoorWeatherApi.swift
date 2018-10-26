//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

// http://weather.livedoor.com/weather_hacks/webservice
struct LivedoorWeatherApi: WebApiRequest {
    
    typealias Response = Weather
    
    let cityId: String
    
    let urlString = "http://weather.livedoor.com/forecast/webservice/json/v1"
    
    let method = WebApiRequestMethod.get
    
    var parameters: [String : Any]? { return [
        "city" : cityId,
        ]}
    
    func parse(_ data: Data) throws -> Weather? {
        return try JSONDecoder().decode(Weather.self, from: data)
    }
}
