// Model
public struct Product: Codable, Identifiable, Hashable {
    public let id: String
    public let name: String
    //let data: ProductData
}

//struct ProductData: Codable {
//    let color: String?
//    let capacityGB: Int?
//    let capacity: String?
//    let price: Double?
//    let screenSize: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case color
//        case capacityGB = "capacity GB"
//        case capacity = "Capacity"
//        case price
//        case screenSize = "Screen size"
//    }
//}
