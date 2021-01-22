
let _ = require( 'wequaler' );

var map1 = { a : 0, e : { c : 2, d : 3 } };
var map2 = { a : 0, e : { c : 2, d : 3 } };
var map3 = { a : 0, e : { d : 4 } };

console.log( 'map1 ~ map2 :', _.entityIdentical( map1, map1 ) );
console.log( 'map1 ~ map2 :', _.entityIdentical( map1, map2 ) );
console.log( 'map1 ~ map3 :', _.entityIdentical( map1, map3 ) );

/*
map1 ~ map1 : true
map1 ~ map2 : true
map1 ~ map3 : false
*/
