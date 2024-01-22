

// Consider the following structure that models a thermometer:

public struct Thermometer {
  public var temperature: Double
  public init(temperature: Double) {
    self.temperature = temperature
  }
}

// To create an instance, you can use this code:

var t: Thermometer = Thermometer(temperature:56.8)

// But it would be nicer to initialize it this way:

var thermometer: Thermometer = 56.8

// We can use ExpressibleByFloatLiteral

public struct Thermometer1: ExpressibleByFloatLiteral {
  public var temperature: Double

  public init(floatLiteral value: FloatLiteralType) {
      self.temperature = value
  }
}

var thermometer1: Thermometer1 = 56.8
print(thermometer1.temperature)
