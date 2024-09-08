
import Foundation
import Combine

class MovieListViewModel {
    
    @Published private(set) var movies: [Movie] = []
    @Published var isLoadingCompleted: Bool = false
    
    private var searchSubject = CurrentValueSubject<String, Never>("")
    
    private var subscriptions: Set<AnyCancellable> = []
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
        setupSearchPublisher()
    }
    
    func fetchMovies(query: String) {
        httpClient.fetchMovies(query)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingCompleted = true
                    
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] movies in
                self?.movies = movies
            }
            .store(in: &subscriptions)

    }
    
    private func setupSearchPublisher() {
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
            self?.fetchMovies(query: searchText)
        }
        .store(in: &subscriptions)
    }
    
    func setSearchText(_ text: String) {
        searchSubject.send(text)
    }
}
