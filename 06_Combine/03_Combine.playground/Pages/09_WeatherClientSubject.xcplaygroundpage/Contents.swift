import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

class WeatherClient {
    
    let updates = PassthroughSubject<Int, Never>()
    
    func fetchWeather() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            self.updates.send(Int.random(in: 32 ... 100))
        }
    }
    
}

let client = WeatherClient()

client.updates.sink { weather in
    print("Weather is \(weather) degrees")
}
.store(in: &subscriptions)

client.fetchWeather()
