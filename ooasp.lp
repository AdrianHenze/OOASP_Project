% Upper bound on the number of object identifiers
upper_bound(22).


% Generate all missing components
{ ooasp_isa(I,C,G) : G = 1..N } N :- ooasp_instantiation(M,I), ooasp_class(M,C) ,not ooasp_subclass(M,_,C), upper_bound(N).
% ID uniqueness
:- ooasp_isa(I,C1,ID), ooasp_isa(I,C2,ID), C1!=C2.


% Create associations
{ooasp_associated(I,A,ID1,ID2) : ooasp_isa(I,SC2,ID2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_subclass(M,SC1,C1), ooasp_subclass(M,SC2,C2).
{ooasp_associated(I,A,ID1,ID2) : ooasp_isa(I,C2,ID2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1).
{ooasp_associated(I,A,ID1,ID2) : ooasp_isa(I,SC2,ID2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), ooasp_subclass(M,SC2,C2).
{ooasp_associated(I,A,ID1,ID2) : ooasp_isa(I,C2,ID2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_subclass(M,SC1,C1).


% Amount of ID:ID1 in associations
numAssoc(I,A,ID1,C) :- C = #count{ ID2 : ooasp_associated(I,A,ID1,ID2)}, ooasp_associated(I,A,ID1,_).
% Amount of ID:ID2 in associations
numAssoc(I,A,ID2,C) :- C = #count{ ID1 : ooasp_associated(I,A,ID1,ID2)}, ooasp_associated(I,A,_,ID2).


% Association check
:- ooasp_isa(I,SC1,ID1), not ooasp_associated(I,A,ID1,_), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_subclass(M,SC1,C1), C2MIN!=0.
:- ooasp_isa(I,C1,ID1), not ooasp_associated(I,A,ID1,_), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), C2MIN!=0.
:- ooasp_isa(I,SC2,ID2), not ooasp_associated(I,A,_,ID2), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_subclass(M,SC2,C2), C1MIN!=0.
:- ooasp_isa(I,C2,ID2), not ooasp_associated(I,A,_,ID2), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), C1MIN!=0.

% Connections: right to left side check
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_isa(I,SC2,ID2), ooasp_subclass(M,SC1,C1), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,_,ID2).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), ooasp_isa(I,SC2,ID2), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,_,ID2).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_isa(I,C2,ID2), ooasp_subclass(M,SC1,C1), not ooasp_associated(I,A,_,ID2).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), ooasp_isa(I,C2,ID2), not ooasp_associated(I,A,_,ID2).
% Connections: left to right side check
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_isa(I,SC2,ID2), ooasp_subclass(M,SC1,C1), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,ID1,_).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), ooasp_isa(I,SC2,ID2), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,ID1,_).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_isa(I,C2,ID2), ooasp_subclass(M,SC1,C1), not ooasp_associated(I,A,ID1,_).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), ooasp_isa(I,C2,ID2), not ooasp_associated(I,A,ID1,_).


% Class check: Minimum & Maximum
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C2,ID2), numAssoc(I,A,ID2,C), C<C1MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), numAssoc(I,A,ID1,C), C<C2MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C2,ID2), numAssoc(I,A,ID2,C), C>C1MAX.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,ID1), numAssoc(I,A,ID1,C), C>C2MAX.
% Subclass check: Minimum & Maximum
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC2,ID2), ooasp_subclass(M,SC2,C2), numAssoc(I,A,ID2,C), C<C1MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_subclass(M,SC1,C1), numAssoc(I,A,ID1,C), C<C2MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC2,ID2), ooasp_subclass(M,SC2,C2), numAssoc(I,A,ID2,C), C>C1MAX.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,ID1), ooasp_subclass(M,SC1,C1), numAssoc(I,A,ID1,C), C>C2MAX.

% Class attribute check
allowed_value(AT,ID,V) :- ooasp_instantiation(M,I), ooasp_attribute_enum(M,C,AT,V), ooasp_isa(I,C,ID), ooasp_attribute_value(I,AT,ID,V).
:- ooasp_attribute_value(I,AT,ID,V), ooasp_isa(I,C,ID), ooasp_attribute_minInclusive(I,C,AT,MIN), ooasp_attribute_maxInclusive(I,C,AT,MAX), V<MIN.
:- ooasp_attribute_value(I,AT,ID,V), ooasp_isa(I,C,ID), ooasp_attribute_minInclusive(I,C,AT,MIN), ooasp_attribute_maxInclusive(I,C,AT,MAX), V>MAX.
% Subclass attribute check
allowed_value(AT,ID,V) :- ooasp_instantiation(M,I), ooasp_attribute_enum(M,C,AT,V), ooasp_subclass(M,SC,C), ooasp_isa(I,SC,ID), ooasp_attribute_value(I,AT,ID,V).
:- ooasp_attribute_value(I,AT,ID,V), ooasp_subclass(M,SC,C), ooasp_isa(I,SC,ID), ooasp_attribute_minInclusive(M,C,AT,MIN), ooasp_attribute_maxInclusive(M,C,AT,MAX), V<MIN.
:- ooasp_attribute_value(I,AT,ID,V), ooasp_subclass(M,SC,C), ooasp_isa(I,SC,ID), ooasp_attribute_minInclusive(M,C,AT,MIN), ooasp_attribute_maxInclusive(M,C,AT,MAX), V>MAX.
% Allowed string check
:- ooasp_attribute_enum(M,C,AT,_), ooasp_attribute_value(I,AT,ID,V), not allowed_value(AT,ID,V).


% Minimal set of components
#minimize {1, ID : ooasp_isa(I,C,ID)}.

% IDutput
#show ooasp_instantiation/2.
#show ooasp_isa/3.
#show ooasp_associated/4.
#show ooasp_attribute_value/4.
