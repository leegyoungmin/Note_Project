
import Foundation

//class Sandwich {
//    let bread: String
//    let cheese: String
//    let primaryIngredient: String
//    let subIngredients: [String]
//    let vegetables: [String]
//    let sources: [String]
//
//    init(
//        bread: String,
//        cheese: String,
//        primaryIngredient: String,
//        subIngredients: [String],
//        vegetables: [String],
//        sources: [String]
//    ) {
//        self.bread = bread
//        self.cheese = cheese
//        self.primaryIngredient = primaryIngredient
//        self.subIngredients = subIngredients
//        self.vegetables = vegetables
//        self.sources = sources
//    }
//}
//
//class SandwichBuilder {
//    private(set) var bread: String = ""
//    private(set) var cheese: String = ""
//    private(set) var primaryIngredient: String = ""
//    private(set) var subIngredients: [String] = []
//    private(set) var vegetables: [String] = []
//    private(set) var sources: [String] = []
//
//    func addBread(_ bread: String) -> Self {
//        self.bread = bread
//        return self
//    }
//
//    func addCheese(_ cheese: String) -> Self {
//        self.cheese = cheese
//        return self
//    }
//
//    func addPrimaryIngredient(_ ingredient: String) -> Self {
//        self.primaryIngredient = ingredient
//        return self
//    }
//
//    func addSubIngredients(_ ingredients: [String]) -> Self {
//        self.subIngredients = ingredients
//        return self
//    }
//
//    func addVegetables(_ vegetables: [String]) -> Self {
//        self.vegetables = vegetables
//        return self
//    }
//
//    func addSources(_ sources: [String]) -> Self {
//        self.sources = sources
//        return self
//    }
//
//    func build() -> Sandwich {
//        return Sandwich(
//            bread: bread, cheese: cheese, primaryIngredient: primaryIngredient,
//            subIngredients: subIngredients, vegetables: vegetables, sources: sources
//        )
//    }
//}
//
//class SubwayDirector {
//    private let sandwichBuilder: SandwichBuilder
//
//    init(builder: SandwichBuilder) {
//        self.sandwichBuilder = builder
//    }
//
//    func generateEggmayo() -> Sandwich {
//        let builder = self.sandwichBuilder
//            .addBread("플랫브레드")
//            .addCheese("아메리칸")
//            .addPrimaryIngredient("에그마요")
//            .addSubIngredients(["베이컨"])
//            .addSources([
//                "스위트 어니언",
//                "스위트 칠리"
//            ])
//            .addVegetables(["피망"])
//
//        return builder.build()
//    }
//}
//
//let eggSandwich = SubwayDirector(builder: SandwichBuilder())
//    .generateEggmayo()
//dump(eggSandwich)

struct Request {
    let baseURL: String?
    let path: String?
    let method: String?
    let headers: [String : Any]?
    let body: Data?
}

class NetworkRequestBuilder {
    private var baseURL: String? = nil
    private var path: String? = nil
    private var method: String? = nil
    private var headers: [String: Any]? = nil
    private var body: Data? = nil
    
    func baseURL(_ url: String) -> Self {
        self.baseURL = url
        return self
    }
    
    func path(_ path: String) -> Self {
        self.path = path
        return self
    }
    
    func method(_ method: String) -> Self {
        self.method = method
        return self
    }
    
    func headers(_ header: [String: Any]) -> Self {
        self.headers = header
        return self
    }
    
    func body(_ data: Data?) -> Self {
        self.body = data
        return self
    }
    
    func build() -> Request {
        return Request(
            baseURL: self.baseURL,
            path: self.path,
            method: self.method,
            headers: self.headers,
            body: self.body
        )
    }
}

let chatRequest = NetworkRequestBuilder()
    .baseURL("www.example.com")
    .path("/chat")
    .method("GET")
    .headers([
        "accessToken": "TOKEN"
    ])
    .build()
