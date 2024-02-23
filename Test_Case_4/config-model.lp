% modules gardening kb "v4"

% classes
ooasp_class("v4", "Item").
ooasp_class("v4", "Plant").
ooasp_class("v4", "Tool").
ooasp_class("v4", "Fertilizer").

% class inheritance
ooasp_subclass("v4", "Plant", "Item").
ooasp_subclass("v4", "Tool", "Item").
ooasp_subclass("v4", "Fertilizer", "Item").

% attributes and associations

% class Plant
ooasp_attribute("v4", "Plant", "type", "string").
ooasp_attribute("v4", "Plant", "growth_period", "integer").
ooasp_attribute_minInclusive("v4", "Plant", "growth_period", 1).
ooasp_attribute_maxInclusive("v4", "Plant", "growth_period", 365).

% class Tool
ooasp_attribute("v4", "Tool", "usage", "string").

% class Fertilizer
ooasp_attribute("v4", "Fertilizer", "type", "string").
ooasp_attribute("v4", "Fertilizer", "application_period", "string").