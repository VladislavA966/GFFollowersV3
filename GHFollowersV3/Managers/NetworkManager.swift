import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private let baseUrl = "https://api.github.com/users/"

    private init() {}

    func fetchFollowers(
        for userName: String,
        page: Int,
        completed: @escaping ([Follower]?, String?) -> Void
    ) {
        let endpoint =
            "\(baseUrl)\(userName)/followers?/per_page=100&page=\(page)"

        guard let url = URL(string: endpoint) else {
            completed(
                nil,
                "This username created an invalid request. Please try again later"
            )
            return
        }

        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            print(error.flatMap(\.localizedDescription) ?? "No error")
            if error != nil {
                completed(
                    nil,
                    error?.localizedDescription
                )
                return
            }

            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                completed(nil, error?.localizedDescription)
                return
            }

            guard let data = data else {
                completed(nil, error?.localizedDescription)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, error.localizedDescription)
            }

        }

        task.resume()

    }

}
