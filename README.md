
# module::Equaler [![Status](https://github.com/Wandalen/wEqualer/workflows/Publish/badge.svg)](https://github.com/Wandalen/wEqualer/actions?query=workflow%3APublish) [![experimental](https://img.shields.io/badge/stability-experimental-orange.svg)](https://github.com/emersion/stability-badges#experimental)

Collection of routines to compare two complex structures. The module can answer questions: are two structures equivalent? are them identical? what is the difference between each other? Use the module avoid manually work and cherry picking.

## Sample
```js

var _ = require( 'wequaler' );

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

```

## Try out
```
npm install
node sample/Sample.s
```




