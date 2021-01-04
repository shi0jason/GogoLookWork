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
    
    private var isLoading: Bool = false
    
    private let defaultLimit: Int = 50

    private var LoadCount: Int = 1

    private var loadMoreResultsCount: Int = 0

    private var topList: [TopObject] = []

    init(dataSource: MainDataSource) {
        mainDataSource = dataSource
    }

    func fetchRequest(handler: @escaping(ResponseBody?, Error?) -> ()) {
        self.isLoading = true
        mainDataSource.fetchRequest(loadCount: LoadCount, handler: { [weak self] (ResponseBody, Error) in
            if let body = ResponseBody {
                self?.responseBody = body
                self?.topList = body.top ?? []
            }
            self?.loadMoreResultsCount = self?.responseBody?.top?.count ?? 0
            self?.isLoading = false
            handler(ResponseBody, Error)
        })
    }
    
    var numberOfResults: Int {
        return self.topList.count
    }
    
    private var shouldLoadMoreSearchResults: Bool {
        return loadMoreResultsCount == defaultLimit
    }

    func cellViewModel(at indexPath: IndexPath) -> TopObject? {
        if indexPath.item < numberOfResults {
            return topList[indexPath.item]
        }
        return nil
    }
}

extension MainViewModel {
    func shouldLoadMore(at currentRow: Int) -> Bool {
        return (currentRow == self.numberOfResults - 20) && !isLoading
    }

    func loadMore(handler: ((ResponseBody?, Error?) -> ())? = nil) {
        if self.shouldLoadMoreSearchResults {
            self.isLoading = true
            LoadCount += 1
            mainDataSource.fetchRequest(loadCount: LoadCount, handler: { [weak self] (ResponseBody, Error) in
                if let body = ResponseBody {
                    self?.responseBody = body
                    self?.topList.append(contentsOf: body.top ?? [])
                }
                self?.loadMoreResultsCount = self?.responseBody?.top?.count ?? 0
                self?.isLoading = false
                handler?(ResponseBody, Error)
            })
        }
    }
}
