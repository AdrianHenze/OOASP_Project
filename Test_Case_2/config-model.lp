% modules airplane kb "v2"

% classes
ooasp_class("v2", "Aircraft").
ooasp_class("v2", "Airframe").
ooasp_class("v2", "Engine").
ooasp_class("v2", "Wing").

% class inheritance
ooasp_subclass("v2", "Airframe", "Aircraft").
ooasp_subclass("v2", "Engine", "Aircraft").
ooasp_subclass("v2", "Wing", "Airframe").

% attributes and associations

% class Airframe
ooasp_assoc("v2", "Airframe_engines", "Airframe", 1, 2, "Engine", 2, 4).
ooasp_assoc("v2", "Airframe_wings", "Airframe", 2, 2, "Wing", 2, 2).

% class Engine
ooasp_attribute("v2", "Engine", "fuel_capacity", "integer").
ooasp_attribute_minInclusive("v2", "Engine", "fuel_capacity", 1000).
ooasp_attribute_maxInclusive("v2", "Engine", "fuel_capacity", 10000).

% class Wing
ooasp_attribute("v2", "Wing", "wing_span", "integer").
ooasp_attribute_minInclusive("v2", "Wing", "wing_span", 10).
ooasp_attribute_maxInclusive("v2", "Wing", "wing_span", 50).