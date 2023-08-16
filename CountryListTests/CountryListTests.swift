//Created for CountryList in 2023
// Using Swift 5.0

import XCTest
@testable import CountryList

final class CountryListTests: XCTestCase {

    var sut: CountriesViewModel!

    
    override func setUpWithError() throws {
        super.setUp()
        sut = CountriesViewModel()
        
    }

    func testFetchCountries_getsCountries() {
        let exp = expectation(for: NSPredicate(format: "countries.isEmpty == FALSE"), evaluatedWith: sut)
      sut.fetchCountries()
      wait(for: [exp], timeout: 5)
      XCTAssertFalse(sut.countries.isEmpty)
    }

    func testFetchCountries_mapsToViewModels() {
        let exp = expectation(for: NSPredicate(format: "countries.isEmpty == FALSE"), evaluatedWith: sut)

      sut.fetchCountries()
        wait(for: [exp], timeout: 2)

      XCTAssertTrue(sut.countries[0] is CountryViewModel)
    }
    
    func testSearchCountries_withQuery() {
      let query = "Canada"
      sut.searchCountries(query: query)
      XCTAssertEqual(sut.countries.first?.name, "Canada")
    }

    func testSearchCountries_noResults() {
      let query = "XYZ"
      sut.searchCountries(query: query)
      XCTAssertTrue(sut.countries.isEmpty)
    }
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
