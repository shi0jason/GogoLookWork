//
//  MainViewModelTests.swift
//  GogoLookWorkTests
//
//  Created by Jason on 2021/1/3.
//  Copyright © 2021 Jason. All rights reserved.
//

import XCTest

class MainViewModelTests: XCTestCase {
    
    let viewModel = MainViewModel(dataSource: MockMainDataSource())
    
    func testNumberOfSections() throws {
        viewModel.fetchRequest { (ResponseBody, Error) in
            XCTAssertEqual(
                self.viewModel.numberOfResults,
                DummyData.responseBody.top?.count
            )
        }
    }

    func testGetTitle() throws {
        if let topObject = viewModel.cellViewModel(at: IndexPath(item: 0, section: 0)) {
            XCTAssertEqual(
                topObject,
                DummyData.responseBody.top?[0] ?? TopObject(id: 39617,
                                                            rank: 1,
                                                            title: "Yakusoku no Neverland 2nd Season",
                                                            url: "https://myanimelist.net/anime/39617/Yakusoku_no_Neverland_2nd_Season",
                                                            imageUrl: "https://cdn.myanimelist.net/images/anime/1815/110626.jpg?s=1485b2d6d4bd31622917e954db1dc9f2",
                                                            type: "TV",
                                                            episodes: nil,
                                                            startDate: "Jan 2021",
                                                            endDate: nil,
                                                            members: 270366,
                                                            score: 0)
            )
        }
    }
}
