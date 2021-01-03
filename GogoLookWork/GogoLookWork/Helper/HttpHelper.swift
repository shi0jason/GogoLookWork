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
    
    func httpAction(request: RequestSet, handler: @escaping(ResponseBody?, Error?) -> ()) {
        Alamofire.request(request.url,
                          method: request.method,
                          parameters: request.parameters,
                          encoding: URLEncoding.default,
                          headers: request.headers).responseJSON { response in
                            guard let data = response.data else {return}
                            do {
                                let json = try JSONDecoder().decode(ResponseBody.self, from: data)
                                handler(json, nil)
                            } catch let jsonErr {
                                handler(nil, jsonErr)
                            }
        }
    }
}
