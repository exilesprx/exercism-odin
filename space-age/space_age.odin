package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	earthYears := f64(seconds) / 31557600

	switch planet {
	case .Mercury:
		return earthYears / 0.2408467
	case .Venus:
		return earthYears / 0.61519726
	case .Earth:
		return earthYears
	case .Mars:
		return earthYears / 1.8808158
	case .Jupiter:
		return earthYears / 11.862615
	case .Saturn:
		return earthYears / 29.447498
	case .Uranus:
		return earthYears / 84.016846
	case .Neptune:
		return earthYears / 164.79132
	}
	return 0.0
}
