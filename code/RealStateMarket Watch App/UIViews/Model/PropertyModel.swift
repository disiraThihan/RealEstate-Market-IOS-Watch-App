//
//  PropertyModel.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import Foundation

struct RealEstate: Identifiable {
    let id: String
    let idUser: String
    let contact: Int
    let title: String
    let description: String
    let imageURL: String
    let price: Int
    let location: String
    let rating: Int
    let type: String
    let isFavorite: Bool
    let size: Int // Size in square feet
    let bedrooms: Int
    let bathrooms: Int
    let yearBuilt: Int
}


extension RealEstate {

    static func all() -> [RealEstate] {
        return [
            RealEstate(id: UUID().uuidString, idUser: "", contact: 0717235799, title: "Modern Family Home", description: "A beautiful family home located in the suburbs with a large backyard and modern amenities.", imageURL: "https://beta.edificecms.com/builder/elements/images/uploads/project418/16987817762446.jpg", price: 450000, location: "Suburbs", rating: 4, type: "sale", isFavorite: false, size: 2500, bedrooms: 4, bathrooms: 3, yearBuilt: 2015),
            RealEstate(id: UUID().uuidString, idUser: "", contact: 0717235799,title: "Luxury Downtown Apartment", description: "A spacious luxury apartment in the heart of downtown with stunning city views.", imageURL: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/107662360.jpg?k=ccd1287dd46a01688c7ac218edf9572ab671bec96907659e6789784f880732a4&o=&hp=1", price: 950000, location: "Downtown", rating: 5, type: "sale", isFavorite: true, size: 1500, bedrooms: 2, bathrooms: 2, yearBuilt: 2020),
            RealEstate(id: UUID().uuidString, idUser: "",contact: 0717235799, title: "Cozy Cottage", description: "A charming cottage located in the countryside, perfect for a weekend getaway.", imageURL: "https://i.ytimg.com/vi/_P0lsZIGoeE/maxresdefault.jpg", price: 300000, location: "Countryside", rating: 3, type: "sale", isFavorite: false, size: 1200, bedrooms: 2, bathrooms: 1, yearBuilt: 1995),
            RealEstate(id: UUID().uuidString, idUser: "",contact: 0717235799, title: "Modern Office Space", description: "A modern office space located in the business district, equipped with all necessary facilities.", imageURL: "https://www.decorilla.com/online-decorating/wp-content/uploads/2022/03/Modern-Office-Interior-with-Open-Floor-Plan-scaled.jpeg", price: 750000, location: "Business District", rating: 4, type: "sale", isFavorite: true, size: 2000, bedrooms: 0, bathrooms: 2, yearBuilt: 2018),
            RealEstate(id: UUID().uuidString, idUser: "", contact: 0717235799,title: "Beachfront Villa", description: "A luxurious villa with private beach access and stunning ocean views.", imageURL: "https://samui-island-realty.com/wp-content/uploads/2021/11/Absolute-Beachfront-Villa-For-Sale-Ko-Samui.jpg", price: 1200000, location: "Beachfront", rating: 5, type: "new", isFavorite: true, size: 3500, bedrooms: 5, bathrooms: 4, yearBuilt: 2022),
            RealEstate(id: UUID().uuidString, idUser: "",contact: 0717235799, title: "Urban Loft", description: "A stylish urban loft with open floor plan and modern industrial design.", imageURL: "https://st.hzcdn.com/simgs/pictures/dining-rooms/urban-loft-ck-interior-design-img~6d61140b0b5b9446_4-9783-1-62c3119.jpg", price: 500000, location: "City Center", rating: 4, type: "new", isFavorite: false, size: 1300, bedrooms: 1, bathrooms: 1, yearBuilt: 2021),
            RealEstate(id: UUID().uuidString, idUser: "", contact: 0717235799,title: "Historic Townhouse", description: "A beautifully restored townhouse with original features and modern updates.", imageURL: "https://cdn10.phillymag.com/wp-content/uploads/sites/3/2022/08/house-for-sale-society-hill-historic-townhouse-exterior-front-brightmls-fb.jpeg", price: 650000, location: "Old Town", rating: 4, type: "new", isFavorite: true, size: 2200, bedrooms: 3, bathrooms: 2, yearBuilt: 1900)
        ]
    }
}

