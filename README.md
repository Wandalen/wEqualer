
# module::Equaler [![status](https://github.com/Wandalen/wEqualer/workflows/publish/badge.svg)](https://github.com/Wandalen/wEqualer/actions?query=workflow%3Apublish) [![stable](https://img.shields.io/badge/stability-stable-green.svg)](https://github.com/emersion/stability-badges#stable)

Collection of cross-platform routines to compare two complex structures. The module can answer questions: are two structures equivalent? are them identical? what is the difference between each other? Use the module avoid manually work and cherry picking.

## Sample
```js

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

```

## Try out from the repository
```
git clone https://github.com/Wandalen/wEqualer
cd wEqualer
npm install
node sample/Sample.s
```

## To add to your project
```
npm add 'wequaler@alpha'
```
