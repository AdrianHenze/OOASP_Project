% modules car kb "v3"

% classes
ooasp_class("v3", "Vehicle").
ooasp_class("v3", "Car").
ooasp_class("v3", "Engine").
ooasp_class("v3", "Wheel").

% class inheritance
ooasp_subclass("v3", "Car", "Vehicle").
ooasp_subclass("v3", "Engine", "Vehicle").
ooasp_subclass("v3", "Wheel", "Vehicle").

% attributes and associations

% class Car
ooasp_assoc("v3", "Car_engine", "Car", 1, 1, "Engine", 1, 1).
ooasp_assoc("v3", "Car_wheels", "Car", 1, 1, "Wheel", 4, 4).

% class Engine
ooasp_attribute("v3", "Engine", "horsepower", "integer").
ooasp_attribute_minInclusive("v3", "Engine", "horsepower", 100).
ooasp_attribute_maxInclusive("v3", "Engine", "horsepower", 1000).

% class Wheel
ooasp_attribute("v3", "Wheel", "size", "integer").
ooasp_attribute_minInclusive("v3", "Wheel", "size", 15).
ooasp_attribute_maxInclusive("v3", "Wheel", "size", 20).