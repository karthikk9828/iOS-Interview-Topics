import Foundation

/*
    make this code simple to understand by using property wrapper

    func shouldShowOnboardingUI() {
        if UserDefaults.standard.bool(forKey: "hasShownOnboardingUI") {
            // show app
        } else {
            // show onboarding
        }
    }
*/

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    let container: UserDefaults = .standard

    var wrappedValue: T {
        get { 
            container.object(forKey: key) as? T ?? defaultValue
        }
        set { 
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    enum Keys {
        static let hasOnboarded = "hasOnboarded"
    }

    @UserDefault(key: Keys.hasOnboarded, defaultValue: false)
    static var hasOnboarded: Bool
}

func shouldShowOnboardingUI() {
    if UserDefaults.hasOnboarded {
        print("show app")
    } else {
        print("show onboarding")
        UserDefaults.hasOnboarded = true // set to true
    }
}

shouldShowOnboardingUI()

// ------------------------------- Example 2 (to trim whitespaces) -------------------------------

struct API {
    var url: String
}

let api = API(url: "https://myapi.com ") // extra space at the end

let url = URL(string: api.url) // error / nil
print(url)

// remove whitespaces in string using property wrapper

@propertyWrapper
struct Trimmed {
    var string: String

    init(wrappedValue: String) {
        self.string = wrappedValue
    }

    var wrappedValue: String {
        get {
            string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        set {
            string = newValue
        }
    }
}

struct API2 {
    @Trimmed var url: String
}

let api2 = API2(url: "https://myapi.com ") // extra space at the end

let url2 = URL(string: api2.url)
print(url2?.absoluteString)