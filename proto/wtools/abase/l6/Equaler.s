( function _Equaler_s_() {

'use strict';

/**
 * Collection of routines to compare two complex structures. The module can answer questions: are two structures equivalent? are them identical? what is the difference between each other? Use the module avoid manually work and cherry picking.
  @module Tools/base/Equaler
  @extends Tools
*/

/**
 * Collection of light-weight routines to traverse complex data structure.
 * @namespace Tools.Equaler
 * @module Tools/base/Looker
 */

/**
 * Collection of light-weight routines to traverse complex data structure.
 * @namespace Tools.equaler
 * @module Tools/base/Looker
 */

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../wtools/Tools.s' );

  _.include( 'wLooker' );
  _.include( 'wSelector' );

}

let _global = _global_;
let _ = _global_.wTools;
let Parent = _.Looker;
let _ObjectToString = Object.prototype.toString;

_.equaler = _.equaler || Object.create( null );

_.assert( !!_realGlobal_ );
_.assert( !!_.look );
_.assert( !!_.select );

// --
// routines
// --

function _equal_pre( routine, args )
{

  _.assert( args.length === 2 || args.length === 3 );
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  let o = args[ 2 ] || Object.create( null );

  if( _.lookIterationIs( o ) )
  {
    let it = o;
    _.assert( it.src === args[ 1 ] );
    _.assert( it.src2 === args[ 0 ] );
    return it;
  }

  o = _.routineOptionsPreservingUndefines( routine, args[ 2 ] || Object.create( null ) );
  _.assert( 0 <= o.revisiting && o.revisiting <= 2 );

  let accuracy = o.accuracy;

  /*
    second argument should goes first to make contain work properly
  */

  o.src = args[ 1 ];
  o.src2 = args[ 0 ];

  if( o.strictTyping === null )
  o.strictTyping = o.strict;
  if( o.strictNumbering === null )
  o.strictNumbering = o.strict;
  if( o.strictCycling === null )
  o.strictCycling = o.strict;
  if( o.strictString === null )
  o.strictString = o.strict;
  if( o.strictContainer === null )
  o.strictContainer = o.strict;

  if( o.onNumbersAreEqual === null )
  if( o.strictNumbering && o.strictTyping )
  o.onNumbersAreEqual = _.numbersAreIdentical;
  else if( o.strictNumbering && !o.strictTyping )
  o.onNumbersAreEqual = _.numbersAreIdenticalNotStrictly;
  else
  o.onNumbersAreEqual = ( a, b, acc ) =>
  {
    return _.numbersAreEquivalent( a, b, ( acc === undefined || acc === null ) ? accuracy : acc );
  }

  if( o.onStringsAreEqual === null )
  o.onStringsAreEqual = stringsAreIdentical;

  if( o.onStringPreprocess === null )
  if( o.strictString )
  o.onStringPreprocess = stringsPreprocessNo;
  else
  o.onStringPreprocess = stringsPreprocessLose;

  let it = _.look.pre( _.equaler._equal, [ optionsFor( o ) ] );

  _.assert( it.iterator.visitedContainer2 === null );

  if( it.iterator.revisiting < 2 )
  {
    if( it.iterator.revisiting === 0 )
    it.iterator.visitedContainer2 = _.containerAdapter.from( new Set );
    else
    it.iterator.visitedContainer2 = _.containerAdapter.from( new Array );
  }

  _.assert( Object.is( it.src2, o.src2 ) );
  _.assert( Object.is( it.src, o.src ) );
  _.assert( it.result === true );

  return it;

  /* */

  function stringsAreIdentical( a, b )
  {
    if( !_.strIs( a ) )
    return false;
    if( !_.strIs( b ) )
    return false;
    return a === b;
  }

  /* */

  function stringsPreprocessLose( str )
  {
    return _.strLinesStrip( str );
  }

  /* */

  function stringsPreprocessNo( str )
  {
    return str;
  }

  /* */

  // function numbersAreIdentical( a, b )
  // {
  //   return Object.is( a, b );
  // }
  //
  // function numbersAreIdenticalNotStrictly( a, b )
  // {
  //   /*
  //   it takes into account -0 === +0 case
  //   */
  //   return Object.is( a, b ) || a === b;
  // }
  //
  // function numbersAreEquivalent( a, b )
  // {
  //   if( Object.is( a, b ) )
  //   return true;
  //   return Math.abs( a-b ) <= accuracy;
  // }

  /* */

  function optionsFor( o )
  {
    let o2 = o;
    if( o2.Looker === null )
    o2.Looker = Self;
    return o2;
  }

}

//

function _equalIt_body( it )
{
  let it2 = _.look.body( it );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( it2 === it );
  _.assert( it.result === _.dont || _.boolIs( it.result ) );

  return it;
}

var defaults = _equalIt_body.defaults = Object.create( _.look.defaults );

defaults.Looker = null;
defaults.src = null;
defaults.src2 = null;
defaults.containing = 0;
defaults.strict = 1;
defaults.revisiting = 1;
defaults.strictTyping = null;
defaults.strictNumbering = null;
defaults.strictCycling = null;
defaults.strictString = null;
defaults.strictContainer = null;
defaults.accuracy = 1e-7;
defaults.recursive = Infinity;
defaults.onNumbersAreEqual = null;
defaults.onStringsAreEqual = null;
defaults.onStringPreprocess = null;

let _equalIt = _.routineFromPreAndBody( _equal_pre, _equalIt_body );

//

function _equal_body( it )
{
  it = _.equaler._equalIt.body( it );
  return it.result === _.dont ? false : it.result;
}

_.routineExtend( _equal_body, _equalIt.body );

let _equal = _.routineFromPreAndBody( _equal_pre, _equal_body );

//

/**
 * Deep strict comparsion of two entities. Uses recursive comparsion for objects, arrays and array-like objects.
 * Returns true if entities are identical.
 *
 * @param {*} src - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} options - Comparsion options {@link wTools~entityEqualOptions}.
 * @param {boolean} [ options.strictTyping = true ] - Method uses strict equality mode( '===' ).
 * @returns {boolean} result - Returns true for identical entities.
 *
 * @example
 * //returns true
 * let src1 = { a : 1, b : { a : 1, b : 2 } };
 * let src2 = { a : 1, b : { a : 1, b : 2 } };
 * _.entityIdentical( src1, src2 ) ;
 *
 * @example
 * //returns false
 * let src1 = { a : '1', b : { a : 1, b : '2' } };
 * let src2 = { a : 1, b : { a : 1, b : 2 } };
 * _.entityIdentical( src1, src2 ) ;
 *
 * @function entityIdentical
 * @function identical
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( options ) is extended by unknown property.
 * @namespace Tools
 * @module Tools/base/Equaler
*/

let entityIdentical = _.routineFromPreAndBody( _equal_pre, _equal_body );

var defaults = entityIdentical.defaults;

defaults.strict = 1;

//

/**
 * Deep soft comparsion of two entities. Uses recursive comparsion for objects, arrays and array-like objects.
 * By default uses own( onNumbersAreEqual ) routine to compare numbers using( options.accuracy ). Returns true if two numbers are NaN, strict equal or
 * ( a - b ) <= ( options.accuracy ). For example: '_.entityEquivalent( 1, 1.5, { accuracy : .5 } )' returns true.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} options - Comparsion options {@link wTools~entityEqualOptions}.
 * @param {boolean} [ options.strict = false ] - Method uses( '==' ) equality mode .
 * @param {number} [ options.accuracy = 1e-7 ] - Maximal distance between two numbers.
 * Example: If( options.accuracy ) is '1e-7' then 0.99999 and 1.0 are equivalent.
 * @returns {boolean} Returns true if entities are equivalent.
 *
 * @example
 * //returns true
 * _.entityEquivalent( 2, 2.1, { accuracy : .2 } );
 *
 * @example
 * //returns true
 * _.entityEquivalent( [ 1, 2, 3 ], [ 1.9, 2.9, 3.9 ], { accuracy : 0.9 } );
 *
 * @function entityEquivalent
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( options ) is extended by unknown property.
 * @namespace Tools
 * @module Tools/base/Equaler
*/

let entityEquivalent = _.routineFromPreAndBody( _equal_pre, _equal_body );

var defaults = entityEquivalent.defaults;

defaults.strict = 0;

//

/**
 * Deep contain comparsion of two entities. Uses recursive comparsion for objects, arrays and array-like objects.
 * Returns true if entity( src1 ) contains keys/values from entity( src2 ) or they are indentical.
 *
 * @param {*} src1 - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} opts - Comparsion options {@link wTools~entityEqualOptions}.
 * @param {boolean} [ opts.strict = true ] - Method uses strict( '===' ) equality mode .
 * @param {boolean} [ opts.containing = true ] - Check if( src1 ) contains  keys/indexes and same appropriates values from( src2 ).
 * @returns {boolean} Returns boolean result of comparison.
 *
 * @example
 * //returns true
 * _.entityContains( [ 1, 2, 3 ], [ 1 ] );
 *
 * @example
 * //returns false
 * _.entityContains( [ 1, 2, 3 ], [ 1, 4 ] );
 *
 * @example
 * //returns true
 * _.entityContains( { a : 1, b : 2 }, { a : 1 , b : 2 }  );
 *
 * @function entityContains
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( opts ) is extended by unknown property.
 * @namespace Tools
 * @module Tools/base/Equaler
*/

function entityContains( src, src2, opts )
{
  let it = _equal.pre.call( this, entityContains, arguments );
  let result = _equal.body.call( this, it );
  return result;
}

_.routineExtend( entityContains, _equal );

var defaults = entityContains.defaults;

defaults.containing = 1;
defaults.strict = 1;
defaults.strictTyping = 0;
defaults.strictNumbering = 0;
defaults.strictString = 0;
// defaults.strictNumbering = 1;
defaults.strictCycling = 1;
defaults.strictContainer = 0; /* qqq : cover option strictContainer */

//

 /**
  * Deep comparsion of two entities. Uses recursive comparsion for objects, arrays and array-like objects.
  * Returns string refering to first found difference or false if entities are sames.
  *
  * @param {*} src - Entity for comparison.
  * @param {*} src2 - Entity for comparison.
  * @param {wTools~entityEqualOptions} o - Comparsion options {@link wTools~entityEqualOptions}.
  * @returns {boolean} result - Returns false for same entities or difference as a string.
  *
  * @example
  * //returns
  * //"at :
  * //src1 :
  * //1
  * //src2 :
  * //1 "
  * _.entityDiff( '1', 1 );
  *
  * @example
  * //returns
  * //"at : .2
  * //src1 :
  * //3
  * //src2 :
  * //4
  * //difference :
  * //*"
  * _.entityDiff( [ 1, 2, 3 ], [ 1, 2, 4 ] );
  *
  * @function entityDiff
  * @throws {exception} If( arguments.length ) is not equal 2 or 3.
  * @throws {exception} If( o ) is not a Object.
  * @throws {exception} If( o ) is extended by unknown property.
  * @namespace Tools
 * @module Tools/base/Equaler
  */

function entityDiff( src, src2, opts )
{

  opts = opts || Object.create( null );
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  let equal = _.equaler._equal( src, src2, opts );

  if( equal )
  return false;

  _.assert( !!opts.it );
  _.assert( opts.it.lastPath !== undefined );

  let result = _.entityDiffExplanation
  ({
    srcs : [ src, src2 ],
    path : opts.it.lastPath,
  });

  return result;
}

//

function entityDiffExplanation( o )
{
  let result = '';

  o = _.routineOptions( entityDiffExplanation, arguments );
  _.assert( _.arrayIs( o.srcs ) );
  _.assert( o.srcs.length === 2 );
  _.assert( arguments.length === 1 );

  if( o.onStringPreprocess === null )
  if( o.strictString )
  o.onStringPreprocess = stringsPreprocessNo;
  else
  o.onStringPreprocess = stringsPreprocessLose;

  if( o.path )
  {

    let src0 = _.select( o.srcs[ 0 ], o.path );
    let src1 = _.select( o.srcs[ 1 ], o.path );

    if( _.mapIs( src0 ) && _.mapIs( src1 ) )
    {
      o.srcs[ 0 ] = src0;
      o.srcs[ 1 ] = src1;
    }
    else
    {
      let dir = _.strSplit( o.path, '/' ).slice( 0, -1 ).join( '' );
      if( !dir )
      dir = '/';
      o.srcs[ 0 ] = _.select( o.srcs[ 0 ], dir );
      o.srcs[ 1 ] = _.select( o.srcs[ 1 ], dir );
    }

    if( o.path !== '/' )
    result += 'at ' + o.path + '\n';

  }

  if( _.strIs( o.srcs[ 0 ] ) )
  o.srcs[ 0 ] = o.onStringPreprocess( o.srcs[ 0 ] );
  if( _.strIs( o.srcs[ 1 ] ) )
  o.srcs[ 1 ] = o.onStringPreprocess( o.srcs[ 1 ] );

  if( _.mapIs( o.srcs[ 0 ] ) && _.mapIs( o.srcs[ 1 ] ) )
  {
    let common = _.filter( _.mapFields( o.srcs[ 0 ] ), ( e, k ) => _.entityIdentical( e, o.srcs[ 1 ][ k ] ) ? e : undefined );
    o.srcs[ 0 ] = _.mapBut( o.srcs[ 0 ], common );
    o.srcs[ 1 ] = _.mapBut( o.srcs[ 1 ], common );
  }

  o.srcs[ 0 ] = _.toStr( o.srcs[ 0 ], { levels : o.levels, keyWrapper : '\'' } );
  o.srcs[ 1 ] = _.toStr( o.srcs[ 1 ], { levels : o.levels, keyWrapper : '\'' } );

  o.srcs[ 0 ] = '  ' + _.strLinesIndentation( o.srcs[ 0 ], '  ' );
  o.srcs[ 1 ] = '  ' + _.strLinesIndentation( o.srcs[ 1 ], '  ' );

  result += _.toStrSimple( o.name1 + ' :\n' + o.srcs[ 0 ] + '\n' + o.name2 + ' :\n' + o.srcs[ 1 ] );

  /* */

  let strDiff = _.strDifference( o.srcs[ 0 ], o.srcs[ 1 ] );
  if( strDiff !== false )
  {
    result += ( '\n' + o.differenceName + ' :\n' + strDiff );
  }

  /* */

  if( o.accuracy !== null )
  result += '\n' + o.accuracyName + ' ' + o.accuracy + '\n';

  return result;

  /* */

  function stringsPreprocessLose( str )
  {
    return _.strLinesStrip( str );
  }

  /* */

  function stringsPreprocessNo( str )
  {
    return str;
  }

}

var defaults = entityDiffExplanation.defaults = Object.create( null );

defaults.name1 = '- src1';
defaults.name2 = '- src2';
defaults.differenceName = '- difference';
defaults.accuracyName = 'with accuracy';
defaults.srcs = null;
defaults.path = null;
defaults.accuracy = null;
defaults.levels = 3;
defaults.strictString = 1; /* qqq : cover option strictString */
defaults.onStringPreprocess = null

// --
// looker routines
// --

function choose( e, k )
{
  let it = this;

  Parent.choose.apply( it, arguments );

  _.assert( arguments.length === 2 );
  _.assert( it.level >= 0 );
  _.assert( _.objectIs( it.down ) );

  it.src2 = _.container.elementGet( it.src2, it.key );

  return it;
}

//

function iterableEval()
{
  let it = this;
  // it.iterable = null;

  _.assert( arguments.length === 0, 'Expects no arguments' );

  it._iterableEval();
  if( it.secondCoerce() )
  it._iterableEval();

  _.assert( it.iterable >= 0 );
}

//

function _iterableEval()
{
  let it = this;
  it.iterable = null;

  _.assert( arguments.length === 0, 'Expects no arguments' );

  let containerType1 = _.container.typeOf( it.src );
  if( containerType1 )
  {
    it.type1 = _.equaler.containerNameToIdMap.custom;
    it.containerType = containerType1;
    it.iterable = _.equaler.containerNameToIdMap.custom;
  }
  else if( _.mapLike( it.src ) )
  {
    it.type1 = _.equaler.containerNameToIdMap.map;
    it.iterable = _.equaler.containerNameToIdMap.map;
  }
  else if( _.longLike( it.src ) )
  {
    it.type1 = _.equaler.containerNameToIdMap.long;
    it.iterable = _.equaler.containerNameToIdMap.long;
  }
  else if( _.hashMapLike( it.src ) )
  {
    it.type1 = _.equaler.containerNameToIdMap.hashMap;
    it.iterable = _.equaler.containerNameToIdMap.hashMap
  }
  else if( _.setLike( it.src ) )
  {
    it.type1 = _.equaler.containerNameToIdMap.set;
    it.iterable = _.equaler.containerNameToIdMap.set;
  }
  // else if( !_.primitiveIs( it.src ) || !_.primitiveIs( it.src2 ) )
  else if( !_.primitiveIs( it.src ) )
  {
    it.type1 = _.equaler.containerNameToIdMap.object;
    it.iterable = _.equaler.containerNameToIdMap.object;
  }
  else
  {
    it.type1 = 0;
    it.iterable = 0;
  }

  let containerType2 = _.container.typeOf( it.src2 );
  if( containerType2 )
  {
    it.containerType = it.containerType || containerType2;
    it.type2 = _.equaler.containerNameToIdMap.custom;
    it.iterable = _.equaler.containerNameToIdMap.custom;
  }
  else if( _.mapLike( it.src2 ) )
  {
    it.type2 = _.equaler.containerNameToIdMap.map;
  }
  else if( _.longLike( it.src2 ) )
  {
    it.type2 = _.equaler.containerNameToIdMap.long;
  }
  else if( _.hashMapLike( it.src2 ) )
  {
    it.type2 = _.equaler.containerNameToIdMap.hashMap;
  }
  else if( _.setLike( it.src2 ) )
  {
    it.type2 = _.equaler.containerNameToIdMap.set;
  }
  else if( !_.primitiveIs( it.src2 ) )
  {
    it.type2 = _.equaler.containerNameToIdMap.object;
    if( it.iterable !== _.equaler.containerNameToIdMap.custom )
    if( !it.containing )
    it.iterable = _.equaler.containerNameToIdMap.object;
  }
  else
  {
    it.type2 = 0;
  }

}

//

function ascendEval()
{
  let it = this;

  _.assert( arguments.length === 0, 'Expects no arguments' );

  it.ascendAct = _.equaler.containerIdToAscendMap[ it.iterable ];

  _.assert( _.routineIs( it.ascendAct ) );

}

//

function visitPush()
{
  let it = this;

  if( it.iterator.visitedContainer2 )
  if( it.visitCounting && it.type2 )
  {
    it.iterator.visitedContainer2.push( it.src2 );
  }

  Parent.visitPush.apply( it, arguments );
}

//

function visitPop()
{
  let it = this;

  if( it.iterator.visitedContainer2 && it.iterator.revisiting !== 0 )
  if( it.visitCounting && it.type2 )
  if( _.arrayIs( it.iterator.visitedContainer2.original ) || !it.revisited )
  {
    if( _.arrayIs( it.iterator.visitedContainer2.original ) )
    _.assert
    (
      Object.is( it.iterator.visitedContainer2.original[ it.iterator.visitedContainer2.original.length-1 ], it.src2 ),
      () => `Top-most visit ${it.path} does not match ${_.strShort( it.src2 )} <> ${_.strShort( it.iterator.visitedContainer2.original[ it.iterator.visitedContainer2.original.length-1 ] )}`
    );
    it.iterator.visitedContainer2.pop( it.src2 );
  }

  Parent.visitPop.apply( it, arguments );
}

//

function visitUp()
{
  let it = this;
  it.visitUpBegin();

  _.assert( _.routineIs( it.onUp ) );
  let r = it.onUp.call( it, it.src, it.key, it );
  _.assert( r === undefined );

  it.equalUp();

  it.visitUpEnd()
}

//

function visitDown()
{
  let it = this;
  it.visitDownBegin();

  _.assert( it.visiting );
  if( it.visiting )
  if( it.onDown )
  {
    let r = it.onDown.call( it, it.src, it.key, it );
    _.assert( r === undefined );
  }

  it.equalDown();

  it.visitDownEnd();
  return it;
}

//

function stop( result )
{
  let it = this;

  _.assert( arguments.length === 1 );
  _.assert( _.boolLike( result ) );

  it.result = it.result && result;
  if( !it.result )
  it.iterator.continue = false;
  it.continue = false;

  return result;
}

//

function equalUp()
{
  let it = this;

  _.assert( it.ascending === true );
  _.assert( arguments.length === 0, 'Expects no arguments' );

  /* if containing mode then src2 could even don't have such entry */

  if( it.containing )
  if( it.down && it.down.iterable === _.equaler.containerNameToIdMap.map )
  if( !( it.key in it.down.src2 ) )
  return it.stop( false );

  /* */

  if( Object.is( it.src, it.src2 ) )
  {
    return it.stop( true );
  }

  /* fast comparison if possible */

  if( it.strictTyping )
  {

    if( _ObjectToString.call( it.src ) !== _ObjectToString.call( it.src2 ) )
    return it.stop( false );

    if( it.containerType && it.containerType._identicalTypes )
    if( !it.containerType._identicalTypes( it.src, it.src2 ) )
    return it.stop( false );

  }
  else
  {
    if( !it.type1 || !it.type2 )
    if( _ObjectToString.call( it.src ) !== _ObjectToString.call( it.src2 ) )
    {
      if( it.src === null || it.src === undefined || it.src2 === null || it.src2 === undefined )
      return it.stop( it.src === it.src2 );
    }
  }

  /* */

  _.equaler.containerIdToEqual[ it.iterable ].call( it );

  it.equalCycle();

}

//

function equalDown()
{
  let it = this;

  _.assert( it.ascending === false );
  _.assert( arguments.length === 0, 'Expects no arguments' );

  /* if element is not equal then descend result down */

  if( !it.result )
  {
    if( it.down )
    it.down.result = it.result;
    it.iterator.continue = false;
    it.continue = false;
  }

}

//

function equalCycle()
{
  let it = this;

  _.assert( arguments.length === 0, 'Expects no arguments' );

  if( !it.revisited )
  return;
  if( !it.result )
  return;

  /* if cycled and strict cycling */
  if( it.strictCycling )
  {
    /* if opposite branch was cycled earlier */
    if( it.down.src2 !== undefined )
    if( it.iterator.visitedContainer2 )
    {
      if( _.arrayIs( it.iterator.visitedContainer2.original ) )
      {
        let i = it.iterator.visitedContainer2.original.indexOf( it.down.src2 );
        if( 0 <= i && i <= it.iterator.visitedContainer2.original.length-2 )
        it.result = false;
      }
      else
      {
        /* qqq : cover revisiting : 0, ask how */
        if( it.iterator.visitedContainer2 && it.iterator.visitedContainer2.has( it.down.src2 ) )
        it.result = false;
      }
    }
    /* or not yet cycled */
    if( it.result )
    {
      if( it.iterator.visitedContainer2 && _.arrayIs( it.iterator.visitedContainer2.original ) )
      it.result = it.iterator.visitedContainer2.original[ it.visitedContainer.original.indexOf( it.src ) ] === it.src2;
    }
    /* then not equal otherwise equal */
  }
  else
  {
    if( it.level >= it.recursive )
    {
      it.result = it.equal( it.src2, it.src, { recursive : 0 } ) && it.result;
    }
  }

}

//

function equal( src1, src2, o )
{
  let it = this;

  _.assert( arguments.length === 2 || arguments.length === 3 );
  _.assert( o === undefined || _.mapIs( o ) );

  let o2 = _.mapOnly( it, _.equaler._equal.defaults );
  _.assert( o2.it === undefined );
  _.assert( o2.level === it.level );

  if( o )
  _.mapExtend( o2, o );

  return _.equaler._equal( src1, src2, o2 );
}

//

function secondCoerce()
{
  let it = this;

  if( !_.primitiveIs( it.src ) && _.routineIs( it.src[ equalSecondCoerceSymbol ] ) )
  {
    it.src[ equalSecondCoerceSymbol ]( it );
    return true;
  }

  if( !_.primitiveIs( it.src2 ) && _.routineIs( it.src2[ equalSecondCoerceSymbol ] ) )
  {
    it.src2[ equalSecondCoerceSymbol ]( it );
    return true;
  }

  if( it.containerType && it.containerType._coerce )
  {
    if( it.containerType._coerce( it ) )
    return true;
  }

  return false;
}

//

function equalCustoms()
{
  let it = this;
  if( _.container.lengthOf( it.src ) !== _.container.lengthOf( it.src2 ) )
  return it.stop( false );
}

//

function equalSets()
{
  let it = this;
  let unpaired1 = new Set();
  let unpaired2 = new Set();

  _.assert( arguments.length === 0, 'Expects no arguments' );

  if( !_.setLike( it.src2 ) )
  return it.stop( false );

  if( !it.containing )
  {
    if( it.src.size !== it.src2.size )
    return it.stop( false );
  }
  else
  {
    if( it.src.size > it.src2.size )
    return it.stop( false );
  }

  _.assert( _.setLike( it.src ) );
  _.assert( _.setLike( it.src2 ) );
  _.assert( !it.containing, 'not implemented' );

  for( let e of it.src )
  unpaired1.add( e );
  for( let e of it.src2 )
  unpaired2.add( e );

  for( let e of unpaired1 )
  {
    if( unpaired2.has( e ) )
    pairFound( e, e );
  }

  for( let e1 of unpaired1 )
  {
    let found = false;
    for( let e2 of unpaired2 )
    {
      if( equal( e1, e2 ) )
      {
        pairFound( e1, e2 );
        found = true;
        break;
      }
    }
    if( !found )
    return it.stop( false );
  }

  if( unpaired1.size || unpaired2.size )
  return it.stop( false );

  it.continue = false;
  return true;

  /* */

  function pairFound( e1, e2 )
  {
    unpaired1.delete( e1 );
    unpaired2.delete( e2 );
  }

  function equal( e1, e2 )
  {
    return it.equal( e1, e2, {} );
  }

}

//

function equalLongs()
{
  let it = this;

  if( !it.src2 )
  return it.stop( false );

  if( it.strictContainer )
  {

    if( _.bufferAnyIs( it.src ) || _.bufferAnyIs( it.src2 ) )
    return it.equalBuffers();

    if( !_.longLike( it.src2 ) )
    return it.stop( false );

  }
  else
  {

    if( !it.type1 || !it.type2 )
    return it.stop( false );

    if( !_.vectorLike( it.src2 ) && !_.hasCustomIterator( it.src2 ) )
    return it.stop( false );

  }

  if( it.containing )
  {
    if( _.container.lengthOf( it.src ) > _.container.lengthOf( it.src2 ) )
    return it.stop( false );
  }
  else
  {
    if( _.container.lengthOf( it.src ) !== _.container.lengthOf( it.src2 ) )
    return it.stop( false );
  }

}

//

function equalHashes()
{
  let it = this;
  let unpaired1 = new HashMap();
  let unpaired2 = new HashMap();

  _.assert( arguments.length === 0, 'Expects no arguments' );

  if( !_.hashMapLike( it.src2 ) )
  return false;

  if( !it.containing )
  {
    if( it.src.size !== it.src2.size )
    return false;
  }
  else
  {
    if( it.src.size > it.src2.size )
    return false;
  }

  _.assert( _.hashMapLike( it.src ) );
  _.assert( _.hashMapLike( it.src2 ) );
  _.assert( !it.containing, 'not implemented' );

  for( let [ k, e ] of it.src )
  unpaired1.set( k, e );
  for( let [ k, e ] of it.src2 )
  unpaired2.set( k, e );

  for( let [ k1, e1 ] of unpaired1 )
  {
    if( !unpaired2.has( k1 ) )
    continue;
    let e2 = unpaired2.get( k1 );
    if( !equal( e1, e2 ) )
    return it.stop( false );
    pairFound( k1, k1 );
  }

  for( let [ k1, e1 ] of unpaired1 )
  {
    let found = false;
    for( let [ k2, e2 ] of unpaired1 )
    {
      if( !equal( k1, k2 ) )
      continue;
      if( !equal( e1, e2 ) )
      continue;
      pairFound( k1, k2 );
    }
    if( !found )
    return it.stop( false );
  }

  if( unpaired1.size || unpaired2.size )
  return it.stop( false );

  return true;

  /* */

  function pairFound( k1, k2 )
  {
    unpaired1.delete( k1 );
    unpaired2.delete( k2 );
  }

  /* */

  function equal( e1, e2 )
  {
    return it.equal( e1, e2, {} );
  }

}

//

function equalMaps()
{
  let it = this;

  _.assert
  (
    it.iterable === _.equaler.containerNameToIdMap.map ||
    it.iterable === _.equaler.containerNameToIdMap.custom ||
    it.iterable === _.equaler.containerNameToIdMap.object
  );

  if( it.containing )
  {

    if( !it.type1 || !it.type2 )
    return it.stop( false );

    if( !_.mapIs( it.src ) && _.mapIs( it.src2 ) )
    return it.stop( false );

  }
  else
  {

    if( it.strictTyping )
    {
      if( _.mapIs( it.src ) ^ _.mapIs( it.src2 ) )
      return it.stop( false );
      if( _.mapKeys( it.src ).length !== _.mapKeys( it.src2 ).length )
      return it.stop( false );
      if( _.mapOwnKeys( it.src ).length !== _.mapOwnKeys( it.src2 ).length )
      return it.stop( false );
    }
    else
    {
      if( !it.type1 || !it.type2 )
      return it.stop( false );
      if( _.mapKeys( it.src ).length !== _.mapKeys( it.src2 ).length )
      return it.stop( false );
    }

  }

}

//

function equalObjects()
{
  let it = this;

  _.assert
  (
    it.iterable === _.equaler.containerNameToIdMap.custom ||
    it.iterable === _.equaler.containerNameToIdMap.object
  );

  if( it.src && _.routineIs( it.src[ equalAreSymbol ] ) )
  {
    _.assert( it.src[ equalAreSymbol ].length <= 1 );
    if( !it.src[ equalAreSymbol ]( it ) )
    return it.stop( false );
  }
  else if( it.src2 && _.routineIs( it.src2[ equalAreSymbol ] ) )
  {
    _.assert( it.src2[ equalAreSymbol ].length <= 1 );
    if( !it.src2[ equalAreSymbol ]( it ) )
    return it.stop( false );
  }
  else if( _.regexpIs( it.src ) )
  {
    return it.equalRegexps();
  }
  else if( _.dateIs( it.src ) )
  {
    return it.equalDates();
  }
  else if( _.bufferAnyIs( it.src ) )
  {
    return it.equalBuffers();
  }
  else
  {
    if( !_.hasCustomIterator( it.src ) )
    return it.stop( false );
  }

}

//

function equalTerminals()
{
  let it = this;

  if( it.type1 || it.type2 )
  return it.stop( false );

  if( _.strIs( it.src ) )
  {
    if( !_.strIs( it.src2 ) )
    return it.stop( false );
    return it.stop( it.onStringsAreEqual( it.onStringPreprocess( it.src ), it.onStringPreprocess( it.src2 ) ) );
  }
  else if( it.strictTyping && ( _.boolIs( it.src ) || _.boolIs( it.src2 ) ) )
  {
    it.stop( it.src === it.src2 );
  }
  else if( !it.strictTyping && ( _.boolIs( it.src ) || _.boolIs( it.src2 ) ) )
  {
    if( !_.boolLike( it.src ) || !_.boolLike( it.src2 ) )
    it.stop( false );
    else
    it.stop( it.src == it.src2 );
  }
  else if( _.numberIs( it.src ) || _.bigIntIs( it.src ) ) /* yyy */
  {
    // if( !_.numberIs( it.src2 ) )
    // return it.stop( false );
    return it.stop( it.onNumbersAreEqual( it.src, it.src2 ) );
  }
  else
  {
    if( it.strictTyping )
    return it.stop( it.src === it.src2 );
    else
    return it.stop( it.src == it.src2 );
  }

}

//

function equalRegexps()
{
  let it = this;
  if( it.strictTyping )
  return it.stop( _.regexpIdentical( it.src, it.src2 ) );
  else
  return it.stop( _.regexpEquivalent( it.src, it.src2 ) );
}

//

function equalDates()
{
  let it = this;
  it.stop( _.datesAreIdentical( it.src, it.src2 ) );
}

//

function equalBuffers()
{
  let it = this;

  if( it.strictNumbering && it.strictTyping )
  {
    return it.stop( _.buffersAreIdentical( it.src, it.src2 ) );
  }
  else
  {

    if( it.strictTyping )
    {
      return it.stop( _.buffersAreEquivalent( it.src, it.src2, it.strictNumbering ? 0 : it.accuracy ) );
    }
    else
    {
      let src1 = it.src;
      let src2 = it.src2;
      if( !_.longIs( src1 ) && _.hasCustomIterator( src1 ) )
      src1 = [ ... src1 ];
      if( !_.longIs( src2 ) && _.hasCustomIterator( src2 ) )
      src2 = [ ... src2 ];
      return it.stop( _.buffersAreEquivalent( src1, src2, it.strictNumbering ? 0 : it.accuracy ) );
    }

  }

}

//

function _objectAscend( src )
{
  let it = this;

  _.assert( it.iterator.continue === true );
  _.assert( it.continue === true );
  _.assert( arguments.length === 1 );

  if( _.hasCustomIterator( src ) )
  if( !it.src || !_.routineIs( it.src[ equalAreSymbol ] ) )
  if( !it.src2 || !_.routineIs( it.src2[ equalAreSymbol ] ) )
  {

    let index = 0;
    for( let e of src )
    {
      let eit = it.iterationMake().choose( e, index );
      eit.look();
      index += 1;
      if( !it.canSibling() )
      break;
    }

  }

}

// --
// declare looker
// --

let Equaler = Object.create( Parent );
Equaler.constructor = function Equaler(){};

let LookerExtension =
{
  Looker : Equaler,
  choose,
  iterableEval,
  _iterableEval,
  ascendEval,
  visitPush,
  visitPop,
  visitUp,
  visitDown,
  stop,
  equalUp,
  equalDown,
  equalCycle,
  equal,
  secondCoerce,
  equalCustoms,
  equalSets,
  equalLongs,
  equalHashes,
  equalMaps,
  equalObjects,
  equalTerminals,
  equalRegexps,
  equalDates,
  equalBuffers,
  _objectAscend,
}

_.mapExtend( Equaler, LookerExtension );

let Iterator = Equaler.Iterator = _.mapExtend( null, Equaler.Iterator );
Iterator.visitedContainer2 = null;

let Iteration = Equaler.Iteration = _.mapExtend( null, Equaler.Iteration );
Iteration.result = true;
Iteration.src2 = null;
Iteration.type1 = null;
Iteration.type2 = null;

let IterationPreserve = Equaler.IterationPreserve = _.mapExtend( null, Equaler.IterationPreserve );
IterationPreserve.src2 = null;

// --
// declare
// --

_.assert( !!_.looker.containerIdToNameMap[ 5 ] );
_.assert( !_.looker.containerIdToNameMap[ 6 ] );

let equalAreSymbol = Symbol.for( 'equalAre' );
let equalSecondCoerceSymbol = Symbol.for( 'equalSecondCoerce' );

let containerNameToIdMap =
{
  ... _.looker.containerNameToIdMap,
  'object' : 6,
  'last' : 6,
}

_.assert( containerNameToIdMap.hashMap >= 0 );

let containerIdToNameMap =
{
  ... _.looker.containerIdToNameMap,
  6 : 'object',
}

let containerIdToAscendMap =
{
  ... _.looker.containerIdToAscendMap,
  6 : _objectAscend,
}

let containerIdToEqual =
{
  [ containerNameToIdMap.terminal ] : equalTerminals,
  [ containerNameToIdMap.long ] : equalLongs,
  [ containerNameToIdMap.map ] : equalMaps,
  [ containerNameToIdMap.hashMap ] : equalHashes,
  [ containerNameToIdMap.set ] : equalSets,
  [ containerNameToIdMap.custom ] : equalCustoms,
  [ containerNameToIdMap.object ] : equalObjects,
}

let EqualerExtension =
{

  _equalIt,
  _equal,

  containerNameToIdMap,
  containerIdToNameMap,
  containerIdToAscendMap,
  containerIdToEqual,

  identical : entityIdentical,
  entityIdentical,
  equivalent : entityEquivalent,
  entityEquivalent,
  contains : entityContains,
  entityContains,
  diff : entityDiff,
  entityDiff,
  diffExplanation : entityDiffExplanation, /* qqq : cover and extend */
  entityDiffExplanation,

}

let ToolsExtension =
{

  identical : entityIdentical,
  entityIdentical,
  equivalent : entityEquivalent,
  entityEquivalent,
  contains : entityContains,
  entityContains,
  diff : entityDiff,
  entityDiff,
  diffExplanation : entityDiffExplanation,
  entityDiffExplanation,

}

let Self = Equaler;
_.mapSupplement( _.equaler, EqualerExtension );
_.mapSupplement( _, ToolsExtension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
