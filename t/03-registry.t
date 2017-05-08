package main;

use Test::More tests => 5;
use PGObject::Type::Registry;
use Test::Exception;

lives_ok {PGObject::Type::Registry->register_type(
        registry => 'default', dbtype => 'foo', apptype => 'PGObject') },
        "Basic type registration";
lives_ok {PGObject::Type::Registry->register_type(
        registry => 'default', dbtype => 'foo', apptype => 'PGObject') },
        "Repeat type registration";

throws_ok { PGObject::Type::Registry->register_type(
        registry => 'default', dbtype => 'foo', apptype => 'main') }
    qr/different target/,
    "Repeat type registration, different type, fails";

throws_ok {PGObject::Type::Registry->register_type(
        registry => 'default', dbtype => 'foo2', apptype => 'Foobar') }
    qr/not yet loaded/,
    "Cannot register undefined type";


throws_ok{PGObject::Type::Registry->register_type(
        registry => 'foo', dbtype => 'foo', apptype => 'PGObject') }
 qr/Registry.*exist/, 
'Correction exception thrown, reregistering in nonexistent registry.';

