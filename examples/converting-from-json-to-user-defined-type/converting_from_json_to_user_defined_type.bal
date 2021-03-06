import ballerina/io;

type Coord record {
    float x;
    float y;
};

public function main() {
    json j = {x: 1.0, y: 2.0};

    // With mutable values, would not be type-safe to allow a cast.
    // Cast to T will work on mutable structure s only if inherent type 
    // of s is subtype of T.
    // Casting of immutable value will work.
    json k = j.cloneReadOnly();
    Coord c = <Coord> k;

    io:println(c.x);
    io:println(c.y);
}
