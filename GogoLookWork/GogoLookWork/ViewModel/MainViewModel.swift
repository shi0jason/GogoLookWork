//
//  MainViewModel.swift
//  GogoLookWork
//
//  Created byJason on 2021/1/3.
//  Copyright © 2021Jason. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private var responseBody: ResponseBody?
    
    let mainDataSource: MainDataSource
    
    init(dataSource: MainDataSource) {
        mainDataSource = dataSource
    }

    func fetchRequest(handler: @escaping(ResponseBody?, Error?) -> ()) {
        mainDataSource.fetchRequest { (ResponseBody, Error) in
            if let body = ResponseBody {
                self.responseBody = body
            }
            handler(ResponseBody, Error)
        }
    }
    
    var numberOfSections: Int {
        if let count = responseBody?.top?.count  {
            return count
        }
        return 0
    }

    func cellViewModel(at indexPath: IndexPath) -> TopObject? {
        if let tops = responseBody?.top,
            let count = responseBody?.top?.count,
            indexPath.item < count {
            return tops[indexPath.item]
        }
        return nil
    }
}

