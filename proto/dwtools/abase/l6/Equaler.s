( function _Equaler_s_() {

'use strict';

/**
 * Collection of routines to compare two complex structures. The module can answer questions: are two structures equivalent? are them identical? what is the difference between each other? Use the module avoid manually work and cherry picking.
  @module Tools/base/Equaler
*/

/**
 * @file l6/Equaler.s.
 */

/**
 *@summary Collection of routines to compare two complex structures.
  @namespace Tools( module::Equaler )
  @memberof module:Tools/base/Equaler
*/

if( typeof module !== 'undefined' )
{

  let _ = require( '../../Tools.s' );

  _.include( 'wLooker' );
  _.include( 'wSelector' );

}

let _global = _global_;
let _ = _global_.wTools;
let Parent = _.Looker;
let _ObjectToString = Object.prototype.toString;

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

  if( o.onNumbersAreEqual === null )
  if( o.strictNumbering && o.strictTyping )
  o.onNumbersAreEqual = numbersAreIdentical;
  else if( o.strictNumbering && !o.strictTyping )
  o.onNumbersAreEqual = numbersAreIdenticalNotStrictly;
  else
  o.onNumbersAreEqual = numbersAreEquivalent;

  if( o.onStringsAreEqual === null )
  if( o.strictString )
  o.onStringsAreEqual = stringsAreIdentical;
  else
  o.onStringsAreEqual = stringsAreEquivalent;

  let it = _.look.pre( _._equal, [ optionsFor( o ) ] );

  _.assert( it.iterator.visited2 === null );

  it.iterator.visited2 = [];

  _.assert( Object.is( it.src2, o.src2 ) );
  _.assert( Object.is( it.src, o.src ) );
  _.assert( it.result === true );

  return it;

  /* */

  function stringsAreIdentical( a, b )
  {
    return a === b;
  }

  /* */

  function stringsAreEquivalent( a, b )
  {
    if( !_.strIs( a ) )
    return false;
    if( !_.strIs( b ) )
    return false;
    a = _.strLinesStrip( a );
    b = _.strLinesStrip( b );
    return a === b;
  }

  /* */

  function numbersAreIdentical( a, b )
  {
    return Object.is( a, b );
  }

  function numbersAreIdenticalNotStrictly( a, b )
  {
    /*
    it takes into account -0 === +0 case
    */
    return Object.is( a, b ) || a === b;
  }

  function numbersAreEquivalent( a, b )
  {
    if( Object.is( a, b ) )
    return true;
    return Math.abs( a-b ) <= accuracy;
  }

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
defaults.strictTyping = null;
defaults.strictNumbering = null;
defaults.strictCycling = null;
defaults.strictString = null;
defaults.accuracy = 1e-7;
defaults.recursive = Infinity;
defaults.onNumbersAreEqual = null;
defaults.onStringsAreEqual = null;
// defaults.onUp = null;
// defaults.onDown = null;

let _equalIt = _.routineFromPreAndBody( _equal_pre, _equalIt_body );

//

/**
 * Deep comparsion of two entities. Uses recursive comparsion for objects, arrays and array-like objects.
 * Returns false if finds difference in two entities, else returns true. By default routine uses it own
 * ( onNumbersAreEqual ) routine to compare numbers.
 *
 * @param {*} src - Entity for comparison.
 * @param {*} src2 - Entity for comparison.
 * @param {wTools~entityEqualOptions} o - comparsion options {@link wTools~entityEqualOptions}.
 * @returns {boolean} result - Returns true for same entities.
 *
 * @example
 * //returns false
 * _._equal( '1', 1 );
 *
 * @example
 * //returns true
 * _._equal( '1', 1, { strictTyping : 0 } );
 *
 * @example
 * //returns true
 * _._equal( { a : { b : 1 }, b : 1 } , { a : { b : 1 } }, { containing : 1 } );
 *
 * @example
 * //returns ".a.b"
 * let o = { containing : 1 };
 * _._equal( { a : { b : 1 }, b : 1 } , { a : { b : 1 } }, o );
 * console.log( o.lastPath );
 *
 * @function _equal
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( o ) is not a Object.
 * @throws {exception} If( o ) is extended by unknown property.
 * @memberof module:Tools/base/Equaler.Tools( module::Equaler )
 */


//

function _equal_body( it )
{
  it = _._equalIt.body( it );
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
 * @throws {exception} If( arguments.length ) is not equal 2 or 3.
 * @throws {exception} If( options ) is extended by unknown property.
 * @memberof module:Tools/base/Equaler.Tools( module::Equaler )
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
 * @memberof module:Tools/base/Equaler.Tools( module::Equaler )
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
 * @memberof module:Tools/base/Equaler.Tools( module::Equaler )
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
defaults.strictNumbering = 1;
defaults.strictCycling = 1;

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
  * @memberof module:Tools/base/Equaler.Tools( module::Equaler )
  */

function entityDiff( src, src2, opts )
{

  opts = opts || Object.create( null );
  _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
  let equal = _._equal( src, src2, opts );

  if( equal )
  return false;

  debugger;
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

  if( _.mapIs( o.srcs[ 0 ] ) && _.mapIs( o.srcs[ 1 ] ) )
  {
    let common = _.filter( _.mapFields( o.srcs[ 0 ] ), ( e, k ) => _.entityIdentical( e, o.srcs[ 1 ][ k ] ) ? e : undefined );
    o.srcs[ 0 ] = _.mapBut( o.srcs[ 0 ], common );
    o.srcs[ 1 ] = _.mapBut( o.srcs[ 1 ], common );
  }

  o.srcs[ 0 ] = _.toStr( o.srcs[ 0 ], { levels : o.levels, keyWrapper : '\'' } );
  o.srcs[ 1 ] = _.toStr( o.srcs[ 1 ], { levels : o.levels, keyWrapper : '\'' } );

  o.srcs[ 0 ] = '  ' + _.strIndentation( o.srcs[ 0 ], '  ' );
  o.srcs[ 1 ] = '  ' + _.strIndentation( o.srcs[ 1 ], '  ' );

  result += _.str( o.name1 + ' :\n' + o.srcs[ 0 ] + '\n' + o.name2 + ' :\n' + o.srcs[ 1 ] );

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

// --
// looker routines
// --

function select( key )
{
  let it = this;

  Parent.select.apply( it, arguments );

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( it.level >= 0 );
  _.assert( _.objectIs( it.down ) );

  if( it.src2 )
  it.src2 = it.src2[ it.key ];
  else
  it.src2 = undefined;

  return it;
}

//

function visitPush()
{
  let it = this;

  if( it.iterator.trackingVisits )
  {
    it.visited2.push( it.src2 );
  }

  Parent.visitPush.apply( it, arguments );

}

//

function visitPop()
{
  let it = this;

  if( it.iterator.trackingVisits )
  {
    _.assert( Object.is( it.visited2[ it.visited2.length-1 ], it.src2 ), () => 'Top-most visit does not match ' + it.path );
    it.visited2.pop();
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

function equalUp()
{
  let it = this;

  _.assert( it.ascending === true );
  _.assert( arguments.length === 0 );

  // console.log( 'equalUp', it.path ); debugger;

  /* if containing mode then src2 could even don't have such entry */

  if( it.containing )
  {
    if( it.down && !( it.key in it.down.src2 ) )
    return clearEnd( false );
  }

  /* */

  if( Object.is( it.src, it.src2 ) )
  {
    return clearEnd( true );
  }

  /* fast comparison if possible */

  if( it.strictTyping )
  {
    if( _ObjectToString.call( it.src ) !== _ObjectToString.call( it.src2 ) )
    return clearEnd( false );
  }
  else
  {
    if( _.primitiveIs( it.src ) || _.primitiveIs( it.src2 ) )
    if( _ObjectToString.call( it.src ) !== _ObjectToString.call( it.src2 ) )
    {
      if( it.strictNumbering )
      return clearEnd( false );
      return clearEnd( it.src == it.src2 );
    }
  }

  /* */

  if( _.numberIs( it.src ) )
  {
    return clearEnd( it.onNumbersAreEqual( it.src, it.src2 ) );
  }
  else if( _.strIs( it.src ) )
  {
    return clearEnd( it.onStringsAreEqual( it.src, it.src2 ) );
  }
  else if( _.regexpIs( it.src ) )
  {
    return clearEnd( _.regexpIdentical( it.src, it.src2 ) );
  }
  else if( _.dateIs( it.src ) )
  {
    return clearEnd( _.datesAreIdentical( it.src, it.src2 ) );
  }
  else if( _.bufferAnyIs( it.src ) )
  {
    if( it.strictTyping )
    return clearEnd( _.buffersAreIdentical( it.src, it.src2 ) );
    else
    return clearEnd( _.buffersAreEquivalent( it.src, it.src2, it.accuracy ) );
  }
  else if( _.setLike( it.src ) || it.iterable === 'set-like' )
  {

    debugger;
    // it._ = 'setLike'; debugger;
    _.assert( it.iterable === 'set-like' || !it.iterable );

    if( !it.src2 )
    return clearEnd( false );

    if( !_.setLike( it.src2 ) )
    return clearEnd( false );

    if( !it.containing )
    {
      if( it.src.size !== it.src2.size )
      return clearEnd( false );
    }
    else
    {
      if( it.src.size > it.src2.size )
      return clearEnd( false );
    }

  }
  else if( _.longLike( it.src ) )
  {

    // it._ = 'longLike';
    _.assert( it.iterable === 'array-like' || !it.iterable ); debugger;

    if( !it.src2 )
    return clearEnd( false );

    if( !_.longLike( it.src2 ) )
    return clearEnd( false );

    if( !it.containing )
    {
      if( it.src.length !== it.src2.length )
      return clearEnd( false );
    }
    else
    {
      if( it.src.length > it.src2.length )
      return clearEnd( false );
    }

  }
  else if( _.objectLike( it.src ) )
  {

    // it._ = 'objectLike';

    if( _.routineIs( it.src._equalAre ) )
    {
      // _.assert( it.src._equalAre.length === 1 ); // does not applicable to VectorAdapter
      if( !it.src._equalAre( it ) )
      return clearEnd( false );
    }
    else if( _.routineIs( it.src.equalWith ) )
    {
      _.assert( it.src.equalWith.length <= 2 );
      if( !it.src.equalWith( it.src2, it ) )
      return clearEnd( false );
    }
    else if( _.routineIs( it.src2.equalWith ) )
    {
      _.assert( it.src2.equalWith.length <= 2 );
      if( !it.src2.equalWith( it.src, it ) )
      return clearEnd( false );
    }
    else
    {
      if( !it.containing )
      {
        if( it.strictTyping )
        {
          if( _.mapOwnKeys( it.src ).length !== _.mapOwnKeys( it.src2 ).length )
          return clearEnd( false );
        }
        else
        {
          if( _.mapKeys( it.src ).length !== _.mapKeys( it.src2 ).length && _.mapOwnKeys( it.src ).length !== _.mapOwnKeys( it.src2 ).length )
          return clearEnd( false );
        }
      }
    }

  }
  else
  {
    if( it.strictTyping )
    {
      if( it.src !== it.src2 )
      return clearEnd( false );
    }
    else
    {
      if( it.src != it.src2 )
      return clearEnd( false );
    }
  }

  it.equalCycle();

  return end();

  /* */

  function clearEnd( result )
  {

    it.result = it.result && result;
    it.continue = false;

    _.assert( arguments.length === 1 );

    return end();
  }

  /* */

  function end()
  {

    if( !it.result )
    {
      it.iterator.continue = false;
      it.continue = false;
    }

    _.assert( arguments.length === 0 );

  }

}

//

function equalDown()
{
  let it = this;

  _.assert( it.ascending === false );
  _.assert( arguments.length === 0 );

  /* if element is not equal then descend it down */

  if( !it.result )
  if( it.down )
  {
    it.down.result = it.result;
  }

  if( it.result === false )
  {
    it.iterator.continue = false;
    it.continue = false;
  }

}

//

function equalCycle()
{
  let it = this;

  _.assert( arguments.length === 0 );

  if( !it.visitedManyTimes )
  return;
  if( !it.result )
  return;

  /* if cycled and strict cycling */
  if( it.strictCycling )
  {
    /* if opposite branch was cycled earlier */
    if( it.down.src2 !== undefined )
    {
      let i = it.visited2.indexOf( it.down.src2 );
      if( 0 <= i && i <= it.visited2.length-2 )
      it.result = false;
    }
    /* or not yet cycled */
    if( it.result )
    it.result = it.visited2[ it.visited.indexOf( it.src ) ] === it.src2;
    /* then not equal otherwise equal */
  }
  else
  {
    if( it.level >= it.recursive )
    {
      let o2 = _.mapOnly( _._equal.defaults, it );
      o2.recursive = 0;
      _.assert( o2.it === undefined );
      it.result = _._equal( it.src2, it.src, o2 );
    }
  }

}

// --
// declare looker
// --

let Equaler = Object.create( Parent );
Equaler.constructor = function Equaler(){};
Equaler.Looker = Equaler;
Equaler.select = select;
Equaler.visitPush = visitPush;
Equaler.visitPop = visitPop;
Equaler.visitUp = visitUp;
Equaler.visitDown = visitDown;
Equaler.equalUp = equalUp;
Equaler.equalDown = equalDown;
Equaler.equalCycle = equalCycle;

let Iterator = Equaler.Iterator = _.mapExtend( null, Equaler.Iterator );
Iterator.visited2 = null;

let Iteration = Equaler.Iteration = _.mapExtend( null, Equaler.Iteration );
Iteration.result = true;
Iteration.src2 = null;

let IterationPreserve = Equaler.IterationPreserve = _.mapExtend( null, Equaler.IterationPreserve );
IterationPreserve.src2 = null;

// --
// declare
// --

let Proto =
{

  _equalIt,
  _equal,

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

_.mapSupplement( _, Proto );
let Self = Equaler;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = _;

})();
