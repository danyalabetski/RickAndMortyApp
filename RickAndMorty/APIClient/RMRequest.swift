import Foundation

final class RMRequest {

    private enum Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    private let endpoint: RMEndpoint

    private let pathComponents: [String]

    private let queryParametrs: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParametrs.isEmpty {
            string += "?"
            
            let argumentString = queryParametrs.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMrthod = "GET"
    
    // MARK: - Public

    init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParametrs: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParametrs = queryParametrs
    }
}
