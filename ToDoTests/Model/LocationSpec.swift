//
//  LocationSpec.swift
//  TDDiOSSwift
//
//  Created by Raamot, Andrew on 10/15/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//
import Quick
import Nimble
import CoreLocation

@testable import ToDo

class LocationSpec: QuickSpec {
    override func spec() {
        describe("LocationSpec") {
            it("sets the name") {
                let location = Location(name: "Foo")
                expect(location.name).to(equal("Foo"))
            }
            it("when given coordiates, sets coordinates") {
                let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
                let location = Location(name: "", coordinate: coordinate)
                expect(location.coordinate?.latitude).to(equal(coordinate.latitude))
                expect(location.coordinate?.longitude).to(equal(coordinate.longitude))
            }
            it("equal locations have the same name") {
                let first = Location(name: "Foo")
                let second = Location(name: "Foo")
                expect(first).to(equal(second))
            }
            it("when latitudes are different, are not equal") {
                let firstCoordinate = CLLocationCoordinate2D(latitude: 1.0, longitude: 0.0)
                let first = Location(name: "Foo", coordinate: firstCoordinate)
                    
                let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
                let second = Location(name: "Foo", coordinate: secondCoordinate)
                
                expect(first).notTo(equal(second))
            }
            it("when longitudes are different, are not equal") {
                let firstCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
                let first = Location(name: "Foo", coordinate: firstCoordinate)
                
                let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 1.0)
                let second = Location(name: "Foo", coordinate: secondCoordinate)
                
                expect(first).notTo(equal(second))
            }
            it("when names are different, are not equal") {
                let firstCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
                let first = Location(name: "Foo", coordinate: firstCoordinate)
                
                let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
                let second = Location(name: "Bar", coordinate: secondCoordinate)
                
                expect(first).notTo(equal(second))
            }

            it("tests equality using refactored testNotEqual") {
                testNotEqual(firstName: "Foo",
                             secondName: "Foo",
                             firstLatLong: (1.0, 0.0),
                             secondLatLong: (0.0, 0.0))
            }
            func testNotEqual(firstName: String, secondName: String, firstLatLong: (Double, Double)?, secondLatLong: (Double, Double)?) {
                var firstCoord: CLLocationCoordinate2D? = nil
                if let firstLatLong = firstLatLong {
                    firstCoord = CLLocationCoordinate2D(latitude: firstLatLong.0,
                                                        longitude: firstLatLong.1)
                }
                let firstLocation = Location(name: firstName,
                                             coordinate: firstCoord)
                var secondCoord: CLLocationCoordinate2D? = nil
                if let secondLatLong = secondLatLong {
                    secondCoord = CLLocationCoordinate2D(latitude: secondLatLong.0,
                                                         longitude: secondLatLong.1)
                }
                let secondLocation = Location(name: secondName,
                                              coordinate: secondCoord)
                expect(firstLocation).notTo(equal(secondLocation))
            }
        }
    }
}
