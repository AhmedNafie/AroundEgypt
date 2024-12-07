//
//  HomeViewModelTests.swift
//  AroundEgyptTests
//
//  Created by Ahmed Nafie on 08/12/2024.
//

import XCTest
@testable import AroundEgypt

final class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!

    override func setUpWithError() throws {
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_viewDidLoad_dataLoadedSuccessfully() async throws {
        // When
        await sut.viewDidLoad()

        // Then
        let actualExperince = sut.recommendedExperiences.first
        let expectedExperince = Experience(
            id: "7f209d18-36a1-44d5-a0ed-b7eddfad48d6",
            imagePath: "",
            title: "Abu Simbel Temples",
            views: 30291,
            likes: 1909,
            isRecommended: true
        )

        XCTAssertEqual(actualExperince?.id, expectedExperince.id)
        XCTAssertEqual(actualExperince?.title, expectedExperince.title)
        XCTAssertEqual(actualExperince?.views, expectedExperince.views)
        XCTAssertEqual(actualExperince?.likes, expectedExperince.likes)
        XCTAssertEqual(actualExperince?.isRecommended, expectedExperince.isRecommended)
    }

}
