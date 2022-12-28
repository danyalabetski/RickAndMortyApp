import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character,
                                queryParametrs: [URLQueryItem(name: "name", value: "rick")
                                                URLQueryItem(name: "status", value: "alive")
                                                ])
        print(request.url)
        
        RMService.shared.execute(request, expecting: String.self) { result in
            
        }
    }
}
