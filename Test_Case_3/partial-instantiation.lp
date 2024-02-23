% Partial instantiation
ooasp_instantiation("v3", "c1").
ooasp_isa("c1", "Car", 2).
ooasp_isa("c1", "Engine", 3).
ooasp_isa("c1", "Wheel", 4).

ooasp_attribute_value("v3", "c1", "horsepower", 1500).
ooasp_attribute_value("v3", "c1", "size", 18).