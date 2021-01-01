//
//  HttpHelper.swift
//  GogoLookWork
//
//  Created by Jason on 2021/1/1.
//  Copyright © 2021 Jason. All rights reserved.
//

import Alamofire

class HttpHelper {
    static let sharedInstance = HttpHelper()
    
    func httpAction() {
        let targetUrl = "https://api.jikan.moe/v3/top/anime/1/upcoming"
        Alamofire.request(targetUrl,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let json = try JSONDecoder().decode(ResponseBody.self, from: data)
                print(json)
            } catch let jsonErr{
                print(jsonErr)
            }
        }
    }
}
