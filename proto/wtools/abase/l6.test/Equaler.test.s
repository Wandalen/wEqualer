( function _Equaler_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../../../node_modules/Tools' );
  require( '../l6/Equaler.s' );
  _.include( 'wStringer' );
  _.include( 'wTesting' );
}

const _global = _global_;
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// /* qqq xxx : make working */
// var 'this is some\n   text\n'
// var exp = `some text`;
// _.contains( op.output, exp );
// test.contains( op.output, exp );

// --
// tests
// --

function trivial( test )
{

  var map1 = { a : 0, e : { c : 2, d : 3 } };
  var map2 = { a : 0, e : { c : 2, d : 3 } };
  var map3 = { a : 0, e : { d : 4 } };

  var got = _.entityIdentical( map1, map2 );
  test.identical( got, true );

  var got = _.entityIdentical( map1, map3 );
  test.identical( got, false );

}

//

function _compareLoose( test )
{

  /* default options */

  test.case = 'default options, number';
  var got = _.equaler._equal( 1, 1 );
  var expected = true;
  test.identical( got, expected );

  test.case = 'default options, string';
  var got = _.equaler._equal( '123', '123' );
  var expected = true;
  test.identical( got, expected );

  test.case = 'default options, boolean';
  var got = _.equaler._equal( 0, false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'default options, array';
  var got = _.equaler._equal( [ 1, 2, '3' ], [ 1, 2, 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'default options, object';
  var src1 = { a : 1, b : 2, c : { d : 3 } };
  var src2 = { a : 1, b : 2, c : { d : 3 } };
  var got = _.equaler._equal( src1, src2 );
  var expected = true;
  test.identical( got, expected );

  /* strict string - number */

  test.case = 'number & string, strictNumbering : 0, strictTyping : 0';
  var got = _.equaler._equal( '123', 123, { strictNumbering : 0, strictTyping : 0 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 0';
  var got = _.equaler._equal( '123', 123, { strictNumbering : 1, strictTyping : 0 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 0, strictTyping : 1';
  var got = _.equaler._equal( '123', 123, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 1';
  var got = _.equaler._equal( '123', 123, { strictNumbering : 1, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'number & string, strictNumbering : 0, strictTyping : 0';
  var got = _.equaler._equal( 123, '123', { strictNumbering : 0, strictTyping : 0 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 0';
  var got = _.equaler._equal( 123, '123', { strictNumbering : 1, strictTyping : 0 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 0, strictTyping : 1';
  var got = _.equaler._equal( 123, '123', { strictNumbering : 0, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 1';
  var got = _.equaler._equal( 123, '123', { strictNumbering : 1, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  /* strict bool - number */

  test.case = 'number & boolean, strictNumbering : 0, strictTyping : 0';
  var got = _.equaler._equal( false, 0, { strictNumbering : 0, strictTyping : 0 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 0, strictTyping : 1';
  var got = _.equaler._equal( false, 0, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 1, strictTyping : 0';
  var got = _.equaler._equal( false, 0, { strictNumbering : 1, strictTyping : 0 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 1, strictTyping : 1';
  var got = _.equaler._equal( false, 0, { strictNumbering : 1, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'src1 constains elem from src2 ';
  var got = _.equaler._equal( { a : 1, b : 2 }, { b : 2 }, { containing : 'all' } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'onNumbersAreEqual';
  function onNumbersAreEqual( a, b ){ return _.entityEquivalent( a, b, { accuracy : 1 } ) };
  var got = _.equaler._equal( { a : 1, b : 2 }, { a : 2, b : 2 }, { onNumbersAreEqual } );
  var expected = true;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowErrorSync( function()
  {
    _.equaler._equal( );
  });

  test.case = 'options is not a Object';
  test.shouldThrowErrorSync( function()
  {
    _.equaler._equal( 1, 2, 3 );
  });

  test.case = 'extendet options';
  test.shouldThrowErrorSync( function()
  {
    _.equaler._equal( 1, 2, { fixed : 1 } );
  });

}

//

function entityIdenticalLoose( test )
{

  var options =
  {
    strictTyping : 0,
  };

  /* numbers */

  var x1 = 44;
  var y1 = 44;
  var x2 = 44;
  var y2 = 34;

  /* strings */

  var strX1 = '4';
  var strY1 = 4;
  var strX2 = '0';
  var strY2 = '0';
  // var strX3 = '0';
  // var strY3 = new String( '0' );

  /* array values */

  var arrX1 = [ 0, 1, 3 ];
  var arrY1 = [ 0, 1, 3 ];
  var arrX2 = [ 0, 1, 3 ];
  var arrY2 = [ 0, 1, 2 ];

  /* object values */

  var objX1 = { a : 0, b : 1, c : 3 };
  var objY1 = { a : 0, b : 1, c : 3 };
  var objX2 = { a : 0, b : 1, c : 3 };
  var objY2 = { a : 0, b : 1, c : 2 };
  var objX3 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objY3 = { a : 0, b : 1, e : { c : 2, d : 3 } };

  /* numbers test */

  test.case = 'identical numbers';
  var got = _.entityIdentical( x1, y1 );
  test.identical( got, true );

  test.case = 'not identical numbers';
  var got = _.entityIdentical( x2, y2 );
  test.identical( got, false );

  /* strings test */

  test.case = 'same string';
  var got = _.entityIdentical( strX1, strX1 );
  test.identical( got, true );

  test.case = 'mismatch types : no strict';
  var got = _.entityIdentical( strX1, strX1, _.props.extend( null, options ) );
  test.identical( got, true );

  test.case = 'entities is two non empty same strings';
  var got = _.entityIdentical( strX2, strY2 );
  test.identical( got, true );

  test.case = 'string and object';
  var strX3 = '0';
  var strY3 = new String( '0' );
  var got = _.entityIdentical( strX3, strY3, _.props.extend( null, options ) );
  test.identical( got, false );

  /* array tests */

  test.case = 'tests two non empty arrays';
  var got = _.entityIdentical( arrX1, arrY1 );
  test.identical( got, true );

  test.case = 'tests two non empty different arrays';
  var got = _.entityIdentical( arrX2, arrY2 );
  test.identical( got, false );

  /* object tests */

  test.case = 'tests two non empty objects';
  var got = _.entityIdentical( objX1, objY1 );
  test.identical( got, true );

  test.case = 'tests two different objects';
  var got = _.entityIdentical( objX2, objY2 );
  test.identical( got, false );

  test.case = 'tests nested objects';
  var got = _.entityIdentical( objX3, objY3 );
  test.identical( got, true );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entityIdentical();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.entityIdentical( strX3, strY3, {}, '' );
  });

};

//

function entityEquivalentLoose( test )
{
  var accuracy = 1e-7;

  var options =
  {
    accuracy
  }

  /* numbers */

  var x1 = 44;
  var y1 = 44;
  var x2 = 44;
  var y2 = 44 + accuracy / 2;
  var x3 = 44;
  var y3 = 44 + 2 * accuracy;

  /* numbers test */

  test.case = 'identical numbers';
  var got = _.entityEquivalent( x1, y1, _.props.extend( null, options ) );
  test.identical( got, true );

  test.case = ' practically equivalent numbers';
  var got = _.entityEquivalent( x2, y2, _.props.extend( null, options ) );
  test.identical( got, true );

  test.case = ' not equivalent numbers';
  var got = _.entityEquivalent( x3, y3, _.props.extend( null, options ) );
  test.identical( got, false );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entityEquivalent();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.entityEquivalent( strX3, strY3, options, '');
  });

};

//

function containsLoose( test )
{

  /* numbers */

  var x1 = 44;
  var y1 = 44;
  var x2 = 44;
  var y2 = 34;

  /* strings */

  var strX1 = '4';
  var strY1 = 4;
  var strX2 = '0';
  var strY2 = '0';
  var strX3 = '0';
  var strY3 = new String( '0' );

  /* array values */

  var arrX1 = [ 0, 1, 3 ];
  var arrY1 = [ 0, 1, 3 ];
  var arrX2 = [ 0, 1, 3 ];
  var arrY2 = [ 0, 1, 2 ];
  var arrX3 = [ 0, 1, 3 ];
  var arrY3 = [ 0, 1 ];
  var arrX4 = [ [ 0, 1 ] ];
  var arrY4 = [ 0, 1 ];
  var arrX5 = [ [ 0, 1 ], [ 3, 4 ] ];
  var arrY5 = [ [ 0 ], [ 3 ] ];

  /* object values */

  var objX1 = { a : 0, b : 1, c : 3 };
  var objY1 = { a : 0, b : 1, c : 3 };
  var objX2 = { a : 0, b : 1, c : 3 };
  var objY2 = { a : 0, b : 1, c : 2 };
  var objX3 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objY3 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objX4 = { a : 0, b : 1, e : { c : 2, d : 3 } };
  var objY4 = { a : 0, e : { d : 3 } };

  /* array tests */

  test.case = 'tests two non empty arrays : same length';
  var got = _.contains( arrX1, arrY1 );
  test.identical( got, true );

  test.case = 'tests two non empty different arrays';
  var got = _.contains( arrX2, arrY2 );
  test.identical( got, false );

  test.case = 'one array contains other`s elements';
  var got = _.contains( arrX3, arrY3 );
  test.identical( got, true );

  test.case = 'one array contains other as element';
  var got = _.contains( arrX4, arrY4 );
  test.identical( got, false );

  test.case = 'nested arrays';
  var got = _.contains( arrX5, arrY5 );
  test.identical( got, true );

  /* object tests */

  test.case = 'tests two non empty objects : identical keys';
  var got = _.contains( objX1, objY1 );
  test.identical( got, true );

  test.case = 'tests two different objects : identical keys';
  var got = _.contains( objX2, objY2 );
  test.identical( got, false );

  test.case = 'tests nested objects : identical';
  var got = _.contains( objX3, objY3 );
  test.identical( got, true );

  test.case = 'one object contains elements of another';
  var got = _.contains( objX4, objY4 );
  test.identical( got, true );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.contains();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.contains( strX3, strY3, options, '');
  });

}

//

function iteratorResult( test )
{

  /* */

  test.case = 'control';

  var src =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }

  var src2 =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }

  var got = _.equaler._equal( src, src2 );
  test.identical( got, true );

  var expected =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }
  test.identical( src, expected );

  var expected =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }
  test.identical( src2, expected );

  /* */

  test.case = 'iterator.result';

  var src =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }

  var src2 =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }

  var it = _.equaler._equal.head( _.equaler._equal, [ src, src2 ] );
  var got = it.perform();
  test.true( got === it );
  test.identical( it.result, true );
  test.identical( src, expected );

  var expected =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }
  test.identical( src, expected );

  var expected =
  {
    a : 'str',
    b : [ 'str', { c : 13, d : [], e : {} } ],
  }
  test.identical( src2, expected );

  /* */

}

//

function head( test )
{

  act({ method : '_equal' });
  act({ method : 'identical' });
  act({ method : 'notIdentical' });
  act({ method : 'equivalent' });
  act({ method : 'notEquivalent' });

  act({ method : 'contains' });
  act({ method : 'notContains' });
  act({ method : 'containsAll' });
  act({ method : 'notContainsAll' });
  act({ method : 'containsAny' });
  act({ method : 'notContainsAny' });
  act({ method : 'containsOnly' });
  act({ method : 'notContainsOnly' });
  act({ method : 'containsNone' });
  act({ method : 'notContainsNone' });

  function act( env )
  {

    /* */

    test.case = `${_.entity.exportStringSolo( env )}, basic`;
    var src = 1;
    var src2 = 2;
    var it = _.equaler[ env.method ].head( _.equaler[ env.method ], [ src, src2 ] );
    test.true( it.iterationProper( it ) );
    test.true( _.equaler.iterationIs( it ) );

    /* */

  }

}

//

// //
//
// function compareContainerType( test )
// {
//   try
//   {
//
//     let type = Object.create( null );
//     type.name = 'ContainerForTest';
//     type._while = _while;
//     type._elementGet = _elementGet;
//     type._elementSet = _elementSet;
//     type._lengthGet = _lengthGet;
//     type._is = _is;
//
//     _.container.typeDeclare( type );
//
//     test.description = 'entityEquivalent empty';
//     var src1 = { eSet, eGet, elements : [ 1, 2, 3 ] };
//     var src2 = { eSet, eGet, elements : [] };
//     test.identical( _.entityEquivalent( src1, src2 ), false );
//     test.identical( _.entityEquivalent( src2, src1 ), false );
//
//     test.description = 'entityIdentical empty';
//     var src1 = { eSet, eGet, elements : [ 1, 2, 3 ] };
//     var src2 = { eSet, eGet, elements : [] };
//     test.identical( _.entityIdentical( src1, src2 ), false );
//     test.identical( _.entityIdentical( src2, src1 ), false );
//
//     test.description = 'entityEquivalent identical';
//     var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
//     var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
//     test.identical( _.entityEquivalent( src1, src2 ), true );
//     test.identical( _.entityEquivalent( src2, src1 ), true );
//
//     test.description = 'entityIdentical identical';
//     var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
//     var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
//     test.identical( _.entityIdentical( src1, src2 ), true );
//     test.identical( _.entityIdentical( src2, src1 ), true );
//
//     _.container.typeUndeclare( 'ContainerForTest' );
//
//     test.description = 'entityEquivalent';
//     var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
//     var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
//     test.identical( _.entityEquivalent( src1, src2 ), false );
//     test.identical( _.entityEquivalent( src2, src1 ), false );
//
//     test.description = 'entityIdentical';
//     var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
//     var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
//     test.identical( _.entityIdentical( src1, src2 ), false );
//     test.identical( _.entityIdentical( src2, src1 ), false );
//
//   }
//   catch( err )
//   {
//     _.container.typeUndeclare( 'ContainerForTest' );
//     throw err;
//   }
//
//   function _is( src )
//   {
//     return !!src && !!src.eGet;
//   }
//
//   function _elementSet( container, key, val )
//   {
//     return container.eSet( key, val );
//   }
//
//   function _elementGet( container, key )
//   {
//     return container.eGet( key );
//   }
//
//   function _lengthGet( container )
//   {
//     return container.elements.length;
//   }
//
//   function _while( container, onEach )
//   {
//     for( let k = 0; k < container.elements.length; k++ )
//     onEach( container.elements[ k ], k, container );
//   }
//
//   function eSet( k, v )
//   {
//     this.elements[ k ] = v;
//   }
//
//   function eGet( k )
//   {
//     return this.elements[ k ];
//   }
//
// }

// --
//
// --

function entityIdenticalSimple( test )
{

  /* */

  test.case = 'null - undefined';

  var expected = true;
  var got = _.entityIdentical( null, null );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( undefined, undefined );
  test.identical( got, expected );

  var expected = false
  var got = _.entityIdentical( null, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( undefined, null );
  test.identical( got, expected );

  /* */

  test.case = 'number - number';

  var expected = true;
  var got = _.entityIdentical( 1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 1, 1 + 1e-15 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( 0, 0 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( NaN, NaN );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( Infinity, Infinity );
  test.identical( got, expected );

  /* */

  test.case = 'number - not number';

  var expected = false;
  var got = _.entityIdentical( 1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 0, '0' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 0, '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 0, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 0, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( NaN, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( Infinity, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, [ 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, { a : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 3, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'String - String';

  var expected = true;
  var got = _.entityIdentical( '', '' );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( 'abc', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'ab', 'c' );
  test.identical( got, expected );

  /* */

  test.case = 'String - not String';

  var expected = false;
  var got = _.entityIdentical( '', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', [ '' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '', function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '0', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( '1', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', [ 'abc' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', { abc : 'abc' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( 'abc', function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - RegExp';

  var expected = true;
  var got = _.entityIdentical( /(?:)/, /(?:)/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/iy, /abc/yi );
  test.identical( got, expected );

  // var expected = true;
  // var got = _.entityIdentical( new RegExp( 'abc' ), /abc/ );
  // test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/i, /abc/i );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entityIdentical( /(?:)/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, [ /(?:)/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, { a : /(?:)/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /(?:)/, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, [ /abc/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, { a : /abc/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - Routine';

  function func1(){};
  function func2(){};

  var expected = true;
  var got = _.entityIdentical( func1, func1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, func2 );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - not Routine';

  var expected = false;
  var got = _.entityIdentical( func1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, [ func1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, { a : func1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( func1, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Date - Date';

  var expected = true;
  var src1 = new Date();
  var src2 = new Date( src1 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  var expected = false;
  var src1 = new Date();
  var src2 = new Date();
  src2.setFullYear( 1987 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'Date - not Date';

  var expected = false;
  var got = _.entityIdentical( new Date(), '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), [ new Date() ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), { a : new Date() } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new Date(), function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Array - Array';

  var expected = true;
  var got = _.entityIdentical( [], [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ 0 ], [ 0 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ 1 ], [ 1 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ undefined ], [ undefined ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ null ], [ null ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( [ [ 1, 2, 3 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1, 2, 3 ] ], [ [ 1, 2 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1, 2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1, 3 ] ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ null ], [ undefined ] );
  test.identical( got, expected );

  /* */

  test.case = 'Array - not Array';

  var expected = false;
  var got = _.entityIdentical( [], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [], function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entityIdentical( [ '1' ], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ undefined ], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ null ], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ NaN ], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 0 ], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1 ], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ new F32x( 3 ) ], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ /(?:)/ ], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ function(){} ], function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Map - Map';

  var expected = true;
  var got = _.entityIdentical( {}, {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : 0 }, { a : 0 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1, b : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1 }, { a : 1, b : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : undefined, b : 1 }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : undefined }, { a : undefined, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : undefined }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : null }, { a : null } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( { a : { b : 1 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { b : 1 } }, { a : { b : 1, c : 2 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { b : 1, c : 2 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { b : 1, c : 3 } }, { b : 1, c : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : null }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : undefined }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, { a : undefined } );
  test.identical( got, expected );

  /* */

  test.case = 'Map - not Map';

  var expected = false;
  var got = _.entityIdentical( {}, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, [ 0 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( {}, function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entityIdentical( { a : '1' }, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : undefined }, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : null }, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : NaN }, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 0 }, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1 }, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : {} }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : new Date() }, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : new F32x( 3 ) }, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : /(?:)/ }, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : function(){} }, function(){} );
  test.identical( got, expected );

  /* qqq : add typed / raw / node / view buffers tests */

}

//

function entityIdenticalWithCopyable( test )
{

  test.case = 'two instances of provider Extract';
  var provider1 = __.FileProvider.Extract();
  var provider2 = __.FileProvider.Extract();
  var got = _.entityIdentical( provider1, provider2 );
  test.identical( got, false );

}

//

function entityIdenticalArgumentsArray( test )
{
  test.case = 'src1 - empty arguments array, src2 - arguments array';
  var src1 = _.argumentsArray.make( [] );
  var src2 = _.argumentsArray.make( [] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - empty array, src2 - arguments array';
  var src1 = [];
  var src2 = _.argumentsArray.make( [] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, false );

  test.case = 'src1 - arguments array, src2 - arguments array';
  var src1 = _.argumentsArray.make( [ 1, 2, 3 ] );
  var src2 = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - array, src2 - arguments array';
  var src1 = [ 1, 2, 3 ];
  var src2 = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, false );
}

//

function entityEquivalentArgumentsArray( test )
{
  test.case = 'src1 - empty arguments array, src2 - arguments array';
  var src1 = _.argumentsArray.make( [] );
  var src2 = _.argumentsArray.make( [] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - empty array, src2 - arguments array';
  var src1 = [];
  var src2 = _.argumentsArray.make( [] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - arguments array, src2 - arguments array';
  var src1 = _.argumentsArray.make( [ 1, 2, 3 ] );
  var src2 = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - array, src2 - arguments array';
  var src1 = [ 1, 2, 3 ];
  var src2 = _.argumentsArray.make( [ 1, 2, 3 ] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );
}

//

function entityIdenticalProto( test )
{

  test.case = 'maps';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'map and proto';
  var expected = false;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'proto and map';
  var expected = false;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'pure map and proto';
  var expected = false;
  var src1 = _.props.extend( null, { a : 1 } );
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'proto and pure map';
  var expected = false;
  var src1 = { a : 1 };
  var src2 = _.props.extend( null, { a : 1 } );
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'map and pure proto';
  var expected = false;
  var src1 = { a : 1 };
  var src2 = _.props.extend( null, { a : 1 } );
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'pure proto and map';
  var expected = false;
  var src1 = _.props.extend( null, { a : 1 } );
  var src2 = { a : 1 };
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

}

//

function entityEquivalentProto( test )
{

  test.case = 'maps';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  test.true( _.entityIdentical( src1, src2 ) );
  test.true( _.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  test.case = 'map and proto';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  test.true( !_.entityIdentical( src1, src2 ) );
  test.true( !_.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'proto and map';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  src1 = Object.setPrototypeOf( {}, src1 );
  test.true( !_.entityIdentical( src1, src2 ) );
  test.true( !_.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'pure map and proto';
  var expected = true;
  var src1 = _.props.extend( null, { a : 1 } );
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  test.true( !_.entityIdentical( src1, src2 ) );
  test.true( !_.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'proto and pure map';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = _.props.extend( null, { a : 1 } );
  src1 = Object.setPrototypeOf( {}, src1 );
  test.true( !_.entityIdentical( src1, src2 ) );
  test.true( !_.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'map and pure proto';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = _.props.extend( null, { a : 1 } );
  src2 = Object.setPrototypeOf( {}, src2 );
  test.true( !_.entityIdentical( src1, src2 ) );
  test.true( !_.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'pure proto and map';
  var expected = true;
  var src1 = _.props.extend( null, { a : 1 } );
  var src2 = { a : 1 };
  src1 = Object.setPrototypeOf( {}, src1 );
  test.true( !_.entityIdentical( src1, src2 ) );
  test.true( !_.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

}

//

function entityIdenticalBuffers( test )
{

  test.case = 'identical ArrayBuffer, simple';
  var src1 = new BufferRaw( 10 );
  var src2 = new BufferRaw( 10 );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'src1 = src2, ArrayBuffer, simple';
  var src1 = new BufferRaw( 10 );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'not identical ArrayBuffer, simple';
  var src1 = new BufferRaw( 10 );
  var src2 = new BufferRaw( 20 );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'identical DataView, simple';
  var buf = new BufferRaw( 10 );
  var src1 = new BufferView( buf );
  var src2 = new BufferView( buf );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'src1 = src2, DataView, simple';
  var src1 = new BufferView( new BufferRaw( 10 ) );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'not identical DataView, simple';
  var src1 = new BufferView( new BufferRaw( 10 ) );
  var src2 = new BufferView( new BufferRaw( 20 ) );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'identical Buffer, simple';
    var src01 = BufferNode.alloc( 10 );
    var src02 = BufferNode.alloc( 10 );
    var expected0 = true;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );

    var src01 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src02 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var expected0 = true;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );

    test.case = 'src01 = src02, Buffer, simple';
    var src01 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src02 = src01;
    var expected0 = true;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );

    test.case = 'not identical Buffer, simple';
    var src01 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src02 = BufferNode.from( [ 0, 2, 3, 4, 5 ] );
    var expected0 = false;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );
  }

  /* */

  test.case = 'identical BufferTyped, simple';
  var src1 = new U8x( 10 );
  var src2 = new U8x( 10 );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'src1 = src2, BufferTyped, simple';
  var src1 = new I16x( [ 1, 2, 3, 4, 5 ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'not identical BufferTyped, simple';
  var src1 = new U32x( [ 1, 2, 3, 4, 5 ] );
  var src2 = new I32x( [ 1, 2, 3, 4, 5 ] );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps with identical BufferTyped';
  var src1 =
  {
    min : new F64x([ NaN, NaN ]),
    max : new F64x([ NaN, NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN, NaN ]),
    max : new F64x([ NaN, NaN ]),
  };
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'map with different BufferTyped';
  var src1 =
  {
    min : new F32x([ NaN, NaN ]),
    max : new F32x([ NaN, NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN, NaN ]),
    max : new F64x([ NaN, NaN ]),
  };
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );
}

//

function entityEquivalentBuffers( test )
{

  test.case = 'identical ArrayBuffer, simple';
  var src1 = new BufferRaw( 10 );
  var src2 = new BufferRaw( 10 );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'src1 = src2, ArrayBuffer, simple';
  var src1 = new BufferRaw( 10 );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'not identical ArrayBuffer, simple';
  var src1 = new BufferRaw( 10 );
  var src2 = new BufferRaw( 20 );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'identical DataView, simple';
  var buf = new BufferRaw( 10 );
  var src1 = new BufferView( buf );
  var src2 = new BufferView( buf );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'src1 = src2, DataView, simple';
  var src1 = new BufferView( new BufferRaw( 10 ) );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'not identical DataView, simple';
  var src1 = new BufferView( new BufferRaw( 10 ) );
  var src2 = new BufferView( new BufferRaw( 20 ) );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  /* */

  if( Config.interpreter === 'njs' )
  {
    test.case = 'identical Buffer, simple';
    var src01 = BufferNode.alloc( 10 );
    var src02 = BufferNode.alloc( 10 );
    var expected0 = true;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );

    var src01 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src02 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var expected0 = true;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );

    test.case = 'src01 = src02, Buffer, simple';
    var src01 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src02 = src01;
    var expected0 = true;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );

    test.case = 'not identical Buffer, simple';
    var src01 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src02 = BufferNode.from( [ 0, 2, 3, 4, 5 ] );
    var expected0 = false;
    var got0 = _.entityIdentical( src01, src02 );
    test.identical( got0, expected0 );
  }

  /* */

  test.case = 'identical BufferTyped, simple';
  var src1 = new U8x( 10 );
  var src2 = new U8x( 10 );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'src1 = src2, BufferTyped, simple';
  var src1 = new I16x( [ 1, 2, 3, 4, 5 ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'not identical BufferTyped, simple';
  var src1 = new U32x( [ 1, 2, 3, 4, 5 ] );
  var src2 = new I32x( [ 1, 2, 3, 4, 5 ] );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'map with identical BufferTyped';
  var src1 =
  {
    min : new F64x([ NaN, NaN ]),
    max : new F64x([ NaN, NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN, NaN ]),
    max : new F64x([ NaN, NaN ]),
  };
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'map with different BufferTyped';
  var src1 =
  {
    min : new F32x([ NaN, NaN ]),
    max : new F32x([ NaN, NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN, NaN ]),
    max : new F64x([ NaN, NaN ]),
  };
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );
}

//

function entityIdenticalSet( test )
{
  function Constructor1()
  {
    this.x = 1;
    return this;
  }
  var obj = new Constructor1();

  /* */

  test.case = 'empty sets, sample';
  var src1 = new Set( [] );
  var src2 = new Set( [] );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'sets are the same, simple';
  var src1 = new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'identical sets without containers';
  var src1 = new Set( [ null, 1, '', undefined, 'str', NaN, false, obj ] );
  var src2 = new Set( [ 1, 'str', '', null, false, undefined, NaN, obj ] );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'identical sets with containers';
  var src1 = new Set( [ undefined, [ 2 ], [ 3, 4 ], { a : 3 }, { b : 4, c : 5 }, false, 'str', 1, '', null, NaN, obj ] );
  var src2 = new Set( [ 1, [ 3, 4 ], [ 2 ], { b : 4, c : 5 }, { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'sets is not identical, simple';
  var src1 = new Set([ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ]);
  var src2 = new Set([ 1, [ 2 ], { a : 4 }, 'str', '', null, false, undefined, NaN, obj ]);
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'array of sets';
  var src1 = [ new Set([ 1, 2, 3 ]), new Set([ '1', '2', '3' ]) ];
  var src2 = [ new Set([ '1', '2', '3' ]), new Set([ 1, 2, 3 ]) ];
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with identical sets';
  var src1 =
  {
    set1 : new Set( [ undefined, { a : 3 }, { b : 4, c : 5 }, [ 2 ], [ 3, 4 ], false, 'str', 1, '', null, NaN, obj ] ),
    set2 : new Set( [ undefined, [ 2 ], false, 'str', 1, [ 3, 4 ], { a : 3 }, { b : 4, c : 5 }, '', null, NaN, obj ] ),
  };
  var src2 =
  {
    set1 : new Set( [ 1, { a : 3 }, 'str', '', null, false, undefined, NaN, obj, [ 3, 4 ], [ 2 ], { b : 4, c : 5 } ] ),
    set2 : new Set( [ 1, [ 3, 4 ], [ 2 ], { b : 4, c : 5 }, { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] ),
  };
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with notIdentical sets';
  var src1 =
  {
    set1 : new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] ),
    set2 : new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] )
  };
  var src1 =
  {
    set1 : new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] ),
    set2 : new Set( [ 1, [ 1 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] )
  };
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );
}

//

/* qqq : extend for sets */
function entityEquivalentSet( test )
{
  function Constructor1()
  {
    this.x = 1;
    return this;
  }
  var obj = new Constructor1();

  /* */

  test.case = 'empty sets, sample';
  var src1 = new Set( [] );
  var src2 = new Set( [] );
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* */

  test.case = 'two trivial sets, second is not equivalent';
  var expected = false;
  var src1 =
  {
    set1 : new Set( [ 'a' ] ),
    set2 : new Set( [ 1, 2, 3 ] )
  };
  var src2 =
  {
    set1 : new Set( [ 'a' ] ),
    set2 : new Set( [ 1, 3 ] )
  };
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not equivalent, deep';
  var expected = false;
  var src1 =
  {
    set2 : new Set( [ 1, 2, [ 3 ] ] )
  };
  var src2 =
  {
    set2 : new Set( [ 1, 2, [ 4 ] ] )
  };
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not equivalent, two arrays';
  var expected = false;
  var src1 =
  {
    set2 : new Set( [ [ 1 ], [ 1 ] ] )
  };
  var src2 =
  {
    set2 : new Set( [ [ 1 ], [ 2 ] ] )
  };
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not equivalent, two arrays';
  var expected = false;
  var src1 =
  {
    set2 : new Set( [ [ 1 ], [ 1 ] ] )
  };
  var src2 =
  {
    set2 : new Set( [ [ 1 ], [ 1 ] ] )
  };
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* */

  test.case = 'diff map, identical element, rearranged';
  var expected = false;
  var src1 =
  {
    set2 : new Set( [ { a : 2 }, 1 ] ),
  };
  var src2 =
  {
    set2 : new Set( [ 1, { a : 3 } ] ),
  };
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'diff map, identical array, rearranged';
  var expected = false;
  var src1 =
  {
    set2 : new Set( [ { a : 2 }, [ 2 ] ] )
  };
  var src2 =
  {
    set2 : new Set( [ [ 2 ], { a : 3 } ] )
  };
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'sets are the same, simple';
  var src1 = new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var src2 = src1;
  var got = _.entityEquivalent( src1, src2 );
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'sets has duplicates, simple';
  var src1 = new Set( [ 1, { a : 3 }, 'str', '', null, null, [ 2 ], false, undefined, NaN, obj ] );
  var src2 = new Set( [ 1, [ 2 ], 'str', 'str', '', null, false, { a : 3 }, undefined, NaN, obj ] );
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  test.case = 'sets is not identical, simple';
  var src1 = new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var src2 = new Set( [ 1, [ 2 ], { a : 4 }, 'str', '', null, false, undefined, NaN, obj ] );
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  test.case = 'two maps with identical sets';
  var src1 =
  {
    set1 : new Set( [ '', null, false, undefined, NaN, obj, 1, [ 2 ], { a : 3 }, 'str' ] ),
    set2 : new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, 1, [ 2 ], undefined, NaN, obj ] )
  };
  var src2 =
  {
    set1 : new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] ),
    set2 : new Set( [ 1, '', null, [ 2 ], false, [ 2 ], { a : 3 }, 'str', undefined, NaN, obj ] )
  };
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* */

  test.case = 'two maps with notIdentical sets';
  var expected = false;
  var src1 =
  {
    set1 : new Set( [ '', null, false, undefined, NaN, obj, 1, [ 2 ], { a : 3 }, 'str' ] ),
    set2 : new Set( [ 1, [ 2 ], { a : 2 }, 'str', '', null, false, 1, [ 2 ], undefined, NaN, obj ] )
  };
  var src2 =
  {
    set1 : new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] ),
    set2 : new Set( [ 1, '', null, [ 2 ], false, [ 2 ], { a : 3 }, 'str', undefined, NaN, obj ] )
  };
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function entityIdenticalHashMap( test )
{
  function Constructor1()
  {
    this.x = 1;
    return this;
  }
  var obj = new Constructor1();

  /* */

  test.case = 'empty maps, sample';
  var src1 = new HashMap();
  var src2 = new HashMap();
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps are the same, simple';
  var src1 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps has duplicates, simple';
  var src1 = new HashMap( [ [ 'one', 1 ], [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps is not identical, simple';
  var src1 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 0 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with identical maps';
  var src1 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'str', 'str' ], [ 'empty', '' ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var src2 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ], [ 'one', 1 ], [ 'array', [ 2 ] ] ] )
  };
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with notIdentical maps';
  var src1 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var src1 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 1 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );
}

//

function entityEquivalentHashMap( test )
{
  function Constructor1()
  {
    this.x = 1;
    return this;
  }
  var obj = new Constructor1();

  test.case = 'empty maps, sample, entityEquivalent';
  var src1 = new HashMap( [] );
  var src2 = new HashMap( [] );
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps are the same, simple, entityEquivalent';
  var src1 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps has duplicates, simple, entityEquivalent';
  var src1 = new HashMap( [ [ 'one', 1 ], [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps is not identical, simple, entityEquivalent';
  var src1 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 0 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with identical maps, entityEquivalent';
  var src1 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
  };
  var src2 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
  };
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with notIdentical maps, entityEquivalent';
  var src1 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var src1 =
  {
    map1 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new HashMap( [ [ 'one', 1 ], [ 'array', [ 1 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );
}

//


function entityIdenticalComparison( test )
{
  test.open( 'identical' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 1;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = true;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 0;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = _.maybe;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'bigint';
  var src1 = 10n;
  var src2 = 10n;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str';
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src1 = /hello/g;
  var src2 = /hello/g;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make();
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'unroll';
  var src1 = _.unroll.make([ 2, 3, 4 ]);
  var src2 = _.unroll.make([ 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'array';
  var src1 = [ 2, 3, 4 ];
  var src2 = [ 2, 3, 4 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'long & longLike';
  var src1 = _.long.make([ 1, 2 ]);
  var src2 = _.long.make([ 1, 2 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 });
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Global & GlobalReal';
  var src1 = global;
  var src2 = global;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Global & GlobalDerived';
  var src1 = Object.create( global );
  var src2 = Object.create( global );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { a : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  var src2 = Object.create( null );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = 1;
  src1.b = 2;
  var src2 = Object.create( null );
  src2.a = 1;
  src2.b = 2;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = {};
  var src2 = {};
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : 1, b : 2, c : 3 };
  var src2 = { a : 1, b : 2, c : 3 };
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap();
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set();
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'BufferNode';
  var src1 = BufferNode.from( 'str' );
  var src2 = BufferNode.from( 'str' );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 5 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 10 );
  var src2 = new BufferRawShared( 10 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 20 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 20 ) );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 20 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 1 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new F32x( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/';
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'propertyTransformer & filter';
  var src1 = _.props.condition[ 'dstAndSrcOwn' ];
  var src2 = _.props.condition[ 'dstAndSrcOwn' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.props.mapper[ 'assigning' ];
  var src2 = _.props.mapper[ 'assigning' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = routine;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2021-02-19T11:26:42.840Z' );
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'null';
  var src1 = null;
  var src2 = null;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'undefined';
  var src1 = undefined;
  var src2 = undefined;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Symbol null';
  var src1 = _.null;
  var src2 = _.null;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Symbol undefined';
  var src1 = _.undefined;
  var src2 = _.undefined;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Symbol Nothing';
  var src1 = _.nothing;
  var src2 = _.nothing;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 5;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = src1;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'console';
  var src1 = console;
  var src2 = console;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'process';
  var src1 = process;
  var src2 = process;
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.close( 'identical' );

  /* - */

  test.open( 'not identical' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 2;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = false;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 1;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = 0;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  /* ? */
  test.case = 'bigint';
  var src1 = 10n;
  var src2 = 10;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str2';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src1 = /hello/g;
  var src2 = /hello/i;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make([ 1 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'unroll';
  var src1 = _.unroll.make([ 2, 3, 4, 5 ]);
  var src2 = _.unroll.make([ 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1, length : 2 });
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1 });
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src1 = { [ Symbol.iterator ] : 1 };
  var src2 = { [ Symbol.iterator ] : 1 };
  test.identical( _.entity.identicalShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { b : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = { a : 1 };
  var src2 = {};
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap([ [ 'a', 1 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set([ 0 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3, 4 ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'BufferNode';
  // var src1 = BufferNode.from( 'str' );
  // var src2 = BufferNode.from( 'str2' );
  var src1 = BufferNode.from( 'str' );
  var src2 = BufferNode.from( 'str2' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 6 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 5 );
  var src2 = new BufferRawShared( 6 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 21 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 21 ) );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 21 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'err same message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'err diff message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error2' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new U8x( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 3 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( Infinity );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/c/';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'propertyTransformer & filter';
  var src1 = _.props.condition[ 'dstAndSrcOwn' ];
  var src2 = _.props.condition[ 'dstNotHasOrSrcNotNull' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.props.mapper[ 'assigning' ];
  var src2 = _.props.mapper[ 'removing' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = () => { 'hello' };
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( 100 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2020-02-19T11:26:42.840Z' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 6;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'Symbol';
  var src1 = Symbol( 'a' );
  var src2 = Symbol( 'a' );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src2 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = require( 'stream' ).Readable();
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );

  test.close( 'not identical' );

  /* */

  test.open( 'deep identical' );

  test.case = 'array';
  var src1 = [ [ 2 ], 3, 4 ];
  var src2 = [ [ 2 ], 3, 4 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'long & longLike';
  var src1 = _.long.make([ 1, 2, [ 5 ] ]);
  var src2 = _.long.make([ 1, 2, [ 5 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  src1.a = [ 1 ];
  var src2 = Object.create( null );
  src2.a = [ 1 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = [ 1, 2, 3 ];
  src1.b = [ 1, 2, 3 ];
  var src2 = Object.create( null );
  src2.a = [ 1, 2, 3 ];
  src2.b = [ 1, 2, 3 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : { f : 'hello' }, b : 2, c : 3 };
  var src2 = { a : { f : 'hello' }, b : 2, c : 3 };
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), true );

  test.close( 'deep identical' );

  /* - */

  // function _iterate()
  // {
  //
  //   let iterator = Object.create( null );
  //   iterator.next = next;
  //   iterator.index = 0;
  //   iterator.instance = this;
  //   return iterator;
  //
  //   function next()
  //   {
  //     let result = Object.create( null );
  //     result.done = this.index === this.instance.elements.length;
  //     if( result.done )
  //     return result;
  //     result.value = this.instance.elements[ this.index ];
  //     this.index += 1;
  //     return result;
  //   }
  //
  // }
  //
  // /* */
  //
  // function countableConstructor( o )
  // {
  //   return countableMake( this, o );
  // }
  //
  // /* */
  //
  // function countableMake( dst, o )
  // {
  //   if( dst === null )
  //   dst = Object.create( null );
  //   _.props.extend( dst, o );
  //   if( o.countable )
  //   dst[ Symbol.iterator ] = _iterate;
  //   return dst;
  // }

  function routine () {}

}

//

function entityEquivalentComparison( test )
{
  test.open( 'equivalent' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 1;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = true;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 0;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = _.maybe;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'bigint';
  var src1 = 10n;
  var src2 = 10n;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'bigint and int';
  var src1 = 10n;
  var src2 = 10;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str';
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'regexp & objectLike & constructible & constructibleLike';
  var src1 = /hello/g;
  var src2 = /hello/g;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'regexp & objectLike & constructible & constructibleLike, same source, diff flags';
  var src1 = /hello/g;
  var src2 = /hello/i;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make();
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'unroll';
  var src1 = _.unroll.make([ 2, 3, 4 ]);
  var src2 = _.unroll.make([ 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'array';
  var src1 = [ 2, 3, 4 ];
  var src2 = [ 2, 3, 4 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'long & longLike';
  var src1 = _.long.make([ 1, 2 ]);
  var src2 = _.long.make([ 1, 2 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Global & GlobalReal';
  var src1 = global;
  var src2 = global;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Global & GlobalDerived';
  var src1 = Object.create( global );
  var src2 = Object.create( global );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { a : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  var src2 = Object.create( null );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = 1;
  src1.b = 2;
  var src2 = Object.create( null );
  src2.a = 1;
  src2.b = 2;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = {};
  var src2 = {};
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : 1, b : 2, c : 3 };
  var src2 = { a : 1, b : 2, c : 3 };
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap();
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', 1 ], [ 'b', 2 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set();
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferNode';
  var src1 = BufferNode.from( 'str' );
  var src2 = BufferNode.from( 'str' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 5 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 10 );
  var src2 = new BufferRawShared( 10 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 20 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 20 ) );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 20 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 1 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'interval & BufferTyped';
  var src1 = new F32x( 2 );
  var src2 = new F32x( 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/';
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'propertyTransformer & filter';
  var src1 = _.props.condition[ 'dstAndSrcOwn' ];
  var src2 = _.props.condition[ 'dstAndSrcOwn' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.props.mapper[ 'assigning' ];
  var src2 = _.props.mapper[ 'assigning' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = routine;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2021-02-19T11:26:42.840Z' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'null';
  var src1 = null;
  var src2 = null;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'undefined';
  var src1 = undefined;
  var src2 = undefined;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Symbol null';
  var src1 = _.null;
  var src2 = _.null;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Symbol undefined';
  var src1 = _.undefined;
  var src2 = _.undefined;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Symbol Nothing';
  var src1 = _.nothing;
  var src2 = _.nothing;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 5;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = src1;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'console';
  var src1 = console;
  var src2 = console;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'printerLike';
  var src1 = _global.logger;
  var src2 = _global.logger;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'process';
  var src1 = process;
  var src2 = process;
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.close( 'equivalent' );

  /* - */

  test.open( 'not equivalent' );

  test.case = 'number';
  var src1 = 1;
  var src2 = 2;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'bool & boolLike & fuzzy';
  var src1 = true;
  var src2 = false;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'boolLike & number & fuzzyLike';
  var src1 = 0;
  var src2 = 1;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'fuzzy';
  var src1 = _.maybe;
  var src2 = 0;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'str & regexpLike';
  var src1 = 'str';
  var src2 = 'str2';
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike';
  var src1 = _.argumentsArray.make();
  var src2 = _.argumentsArray.make([ 1 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'ArgumentsArray & arrayLike with 3 elems';
  var src1 = _.argumentsArray.make([ 1, 2, 3 ]);
  var src2 = _.argumentsArray.make([ 1, 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'unroll';
  var src1 = _.unroll.make([ 2, 3, 4, 5 ]);
  var src2 = _.unroll.make([ 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = `object countable - non empty, non-vector, not same array`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'vector & vectorLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1, length : 2 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'countable & countableLike';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '11' ], countable : 1 });
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = `object countable - non empty, non-vector`;
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '3' ], countable : 1 } );
  var src2 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '2', '4' ], countable : 1 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'Object & ObjectLike & Container & ContainerLike';
  var src1 = { [ Symbol.iterator ] : 1 };
  var src2 = { [ Symbol.iterator ] : 1 };
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPrototyped & auxiliaryPolluted';
  var src1 = { a : 1 };
  Object.setPrototypeOf( src1, { b : 2 } );
  var src2 = { b : 1 };
  Object.setPrototypeOf( src2, { b : 2 } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped';
  var src1 = { a : 1 };
  var src2 = {};
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'HashMap';
  var src1 = new HashMap();
  var src2 = new HashMap([ [ 'a', 1 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'Set & SetLike';
  var src1 = new Set();
  var src2 = new Set([ 0 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'Set with 3 elems';
  var src1 = new Set([ 1, 2, 3 ]);
  var src2 = new Set([ 1, 2, 3, 4 ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'BufferNode';
  var src1 = BufferNode.from( 'str' );
  var src2 = BufferNode.from( 'str2' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'BufferRaw';
  var src1 = new BufferRaw( 5 );
  var src2 = new BufferRaw( 6 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'BufferRawShared';
  var src1 = new BufferRawShared( 5 );
  var src2 = new BufferRawShared( 6 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'BufferTyped';
  var src1 = new I8x( 20 );
  var src2 = new I8x( 21 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'BufferView';
  var src1 = new BufferView( new BufferRaw( 20 ) );
  var src2 = new BufferView( new BufferRaw( 21 ) );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'BufferBytes & BufferTyped';
  var src1 = new U8x( 20 );
  var src2 = new U8x( 21 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'err same message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'err diff message';
  var src1 = _.err( 'error' );
  var src2 = _.err( 'error2' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'escape';
  var src1 = _.escape.make( 1 );
  var src2 = _.escape.make( 2 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'pair';
  var src1 = _.pair.make( 1, 2 );
  var src2 = _.pair.make( 1, 3 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( Infinity );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'path & str';
  var src1 = '/a/b/';
  var src2 = '/a/b/c/';
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'propertyTransformer & filter';
  var src1 = _.props.condition[ 'dstAndSrcOwn' ];
  var src2 = _.props.condition[ 'dstNotHasOrSrcNotNull' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'propertyTransformer & mapper';
  var src1 = _.props.mapper[ 'assigning' ];
  var src2 = _.props.mapper[ 'removing' ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'routine & routineLike';
  var src1 = routine;
  var src2 = () => { 'hello' };
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'timer';
  var src1 = _.time._begin( Infinity );
  var src2 = _.time._begin( 100 );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );
  _.time.cancel( src1 );
  _.time.cancel( src2 );

  test.case = 'date & objectLike';
  var src1 = new Date( '2021-02-19T11:26:42.840Z' );
  var src2 = new Date( '2020-02-19T11:26:42.840Z' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'primitive';
  var src1 = 5;
  var src2 = 6;
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'Symbol';
  var src1 = Symbol( 'a' );
  var src2 = Symbol( 'a' );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'ConsequenceLike & promiseLike & promise';
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src2 = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'stream';
  var src1 = require( 'stream' ).Readable();
  var src2 = require( 'stream' ).Readable();
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.close( 'not equivalent' );

  /* */

  test.open( 'deep equivalent' );

  test.case = 'array';
  var src1 = [ [ 2 ], 3, 4 ];
  var src2 = [ [ 2 ], 3, 4 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'long & longLike';
  var src1 = _.long.make([ 1, 2, [ 5 ] ]);
  var src2 = _.long.make([ 1, 2, [ 5 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure';
  var src1 = Object.create( null );
  src1.a = [ 1 ];
  var src2 = Object.create( null );
  src2.a = [ 1 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & map & mapPure with 2 elems';
  var src1 = Object.create( null );
  src1.a = [ 1, 2, 3 ];
  src1.b = [ 1, 2, 3 ];
  var src2 = Object.create( null );
  src2.a = [ 1, 2, 3 ];
  src2.b = [ 1, 2, 3 ];
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'Object & ObjectLike & auxiliary & auxiliaryPolluted & map & mapPolluted & mapPrototyped with 3 elems';
  var src1 = { a : { f : 'hello' }, b : 2, c : 3 };
  var src2 = { a : { f : 'hello' }, b : 2, c : 3 };
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'HashMap with 2 elems';
  var src1 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  var src2 = new HashMap([ [ 'a', [ 3 ] ], [ 'b', 2 ] ]);
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.close( 'deep equivalent' );

  /* - */

  // function _iterate()
  // {
  //
  //   let iterator = Object.create( null );
  //   iterator.next = next;
  //   iterator.index = 0;
  //   iterator.instance = this;
  //   return iterator;
  //
  //   function next()
  //   {
  //     let result = Object.create( null );
  //     result.done = this.index === this.instance.elements.length;
  //     if( result.done )
  //     return result;
  //     result.value = this.instance.elements[ this.index ];
  //     this.index += 1;
  //     return result;
  //   }
  //
  // }
  //
  // /* */
  //
  // function countableConstructor( o )
  // {
  //   return countableMake( this, o );
  // }
  //
  // /* */
  //
  // function countableMake( dst, o )
  // {
  //   if( dst === null )
  //   dst = Object.create( null );
  //   _.props.extend( dst, o );
  //   if( o.countable )
  //   dst[ Symbol.iterator ] = _iterate;
  //   return dst;
  // }

  function routine () {}

}

//

function entityEquivalentNotIdenticalComparison( test )
{
  test.case = 'true and 1';
  var src1 = true;
  var src2 = 1;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'false and 0';
  var src1 = false;
  var src2 = 0;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = '1 and 2, acc : 1, default accuracy';
  var src1 = 1;
  var src2 = 1.00000001;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = '1 and 2, acc : 1';
  var src1 = 1;
  var src2 = 2;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2, { accuracy : 1 } ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2, { accuracy : 1 } ), true );

  test.case = '10 and 20, acc : 10';
  var src1 = 10;
  var src2 = 20;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2, { accuracy : 10 } ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2, { accuracy : 10 } ), true );

  test.case = '1 and 1.2, acc : 02';
  var src1 = 1;
  var src2 = 1.2;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2, { accuracy : 0.2 } ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2, { accuracy : 0.2 } ), true );

  // test.case = '1n and 2, acc : 1'; /* qqq : not implemented. non-identical bigints with accuracy  */
  // var src1 = 1n;
  // var src2 = 2;
  // test.identical( _.entity.identicalShallow( src1, src2 ), false );
  // test.identical( _.entity.equivalentShallow( src1, src2, { accuracy : 1 } ), true );
  // test.identical( _.equaler.identical( src1, src2 ), false );
  // test.identical( _.equaler.equivalent( src1, src2 ), true );

  // test.case = '1n and 2n, acc : 1'; /* qqq : not implemented. non-identical bigints with accuracy  */
  // var src1 = 1n;
  // var src2 = 2n;
  // test.identical( _.entity.identicalShallow( src1, src2 ), false );
  // test.identical( _.entity.equivalentShallow( src1, src2, { accuracy : 1 } ), true );
  // test.identical( _.equaler.identical( src1, src2 ), false );
  // test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'regexps with diff flags';
  var src1 = /hello/g;
  var src2 = /hello/i;
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), false );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), false );

  test.case = 'one string with whitespaces';
  var src1 = 'hello';
  var src2 = ' hello \n';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'both strings with whitespaces';
  var src1 = '     hello\n\n\n\n\t';
  var src2 = ' \n  \thello \n';
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'BufferTyped F32x and U8x';
  var src1 = new F32x( 2 );
  var src2 = new U8x( 2 );
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'set and array';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = [ 1, 2, 3 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'buffer typed and array';
  var src1 = new F32x([ 1, 2, 3 ])
  var src2 = [ 1, 2, 3 ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );
  /* qqq : for junior : bad */

  test.case = 'vectorLike and array';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = [ '1', '10' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'countable and array';
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1 });
  var src2 = [ '1', '10' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = 'countable made and array';
  var src1 = __.diagnostic.objectMake({ new : 0, elements : [ '1', '10' ], countable : 1 } );
  var src2 = [ '1', '10' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = `vector and array`;
  var src1 = __.diagnostic.objectMake({ new : 1, elements : [ '1', '10' ], countable : 1, length : 2 });
  var src2 = [ '1', '10' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = `argumentsArray and array`;
  var src1 = _.argumentsArray.make([ '1', '10' ]);
  var src2 = [ '1', '10' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  test.case = `argumentsArray and array`;
  var src1 = _.argumentsArray.make([ '1', '10' ]);
  var src2 = [ '1', '10' ];
  test.identical( _.entity.identicalShallow( src1, src2 ), false );
  test.identical( _.entity.equivalentShallow( src1, src2 ), true );
  test.identical( _.equaler.identical( src1, src2 ), false );
  test.identical( _.equaler.equivalent( src1, src2 ), true );

  /* - */

  // function _iterate()
  // {
  //
  //   let iterator = Object.create( null );
  //   iterator.next = next;
  //   iterator.index = 0;
  //   iterator.instance = this;
  //   return iterator;
  //
  //   function next()
  //   {
  //     let result = Object.create( null );
  //     result.done = this.index === this.instance.elements.length;
  //     if( result.done )
  //     return result;
  //     result.value = this.instance.elements[ this.index ];
  //     this.index += 1;
  //     return result;
  //   }
  //
  // }
  //
  // /* */
  //
  // function countableConstructor( o )
  // {
  //   return countableMake( this, o );
  // }
  //
  // /* */
  //
  // function countableMake( dst, o )
  // {
  //   if( dst === null )
  //   dst = Object.create( null );
  //   _.props.extend( dst, o );
  //   if( o.countable )
  //   dst[ Symbol.iterator ] = _iterate;
  //   return dst;
  // }

}

//

/* qqq : rewrite all tests with src \n routines( src ). ask
*/

function containsSimple( test ) /* qqq : extend the test routien by other contains* checks ( containsAll, containsAny... ), not increasing number of test cases */
{

  test.case = 'null - undefined';

  var expected = true;
  var got = _.contains( null, null );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( undefined, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( null, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( undefined, null );
  test.identical( got, expected );

  /* */

  test.case = 'number - number';

  var expected = true;
  var got = _.contains( 1, 1 );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( 1, 1 + 1e-15 );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( 0, 0 );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( NaN, NaN );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( Infinity, Infinity );
  test.identical( got, expected );

  /* */

  test.case = 'number - not number';

  var expected = false;
  var got = _.contains( 1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, '0' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( NaN, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( Infinity, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, [ 0 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, { a : 0 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 0, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, [ 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, { a : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 3, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'String - String';

  var expected = true;
  var got = _.contains( '', '' );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( 'abc', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'ab', 'c' );
  test.identical( got, expected );

  /* */

  test.case = 'String - not String';

  var expected = false;
  var got = _.contains( '', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', [ '' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( '', /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '', function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '0', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( '1', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 'abc' ], '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', [ 'abc' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', { a : 'abc' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( 'abc', /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( 'abc', function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - RegExp';

  var expected = true;
  var got = _.contains( /(?:)/, /(?:)/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( /abc/iy, /abc/yi );
  test.identical( got, expected );

  // var expected = true;
  // var got = _.contains( new RegExp( 'abc' ), /abc/ );
  // test.identical( got, expected );

  var expected = true;
  var got = _.contains( /abc/i, /abc/i );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.contains( /(?:)/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( /(?:)/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, [ /(?:)/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, { a : /(?:)/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /(?:)/, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( /abc/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, { x : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( /abc/, { ignoreCase : false, lastIndex : 0 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, [ /abc/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, { a : /abc/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( /abc/, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - Routine';

  function func1(){};
  function func2(){};

  var expected = true;
  var got = _.contains( func1, func1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, func2 );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - not Routine';

  var expected = false;
  var got = _.contains( func1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( func1, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, [ func1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, { func1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( func1, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Date - Date';

  var expected = true;
  var src1 = new Date();
  var src2 = new Date( src1 );
  var got = _.contains( src1, src2 );
  test.identical( got, expected );

  var expected = false;
  var src1 = new Date();
  var src2 = new Date();
  src2.setFullYear( 1987 );
  var got = _.contains( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'Date - not Date';

  var expected = false;
  var got = _.contains( new Date(), '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( new Date(), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), [ new Date() ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), { a : new Date() } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( new Date(), function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Array - Array';

  var expected = true;
  var got = _.contains( [], [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ 0 ], [ 0 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ 1 ], [ 1 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ undefined ], [ undefined ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ null ], [ null ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ [ 1, 2, 3 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ [ 1, 2, 3 ] ], [ [ 1, 2 ] ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ [ 1, 2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ [ 1, 3 ] ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ null ], [ undefined ] );
  test.identical( got, expected );

  /* */

  test.case = 'Array - not Array';

  var expected = false;
  var got = _.contains( [], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 1 ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 1 ], { 0 : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 1 ], { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [], function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.contains( [ '1' ], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ undefined ], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ null ], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ NaN ], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 0 ], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 1 ], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ new F32x( 3 ) ], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ /(?:)/ ], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ function(){} ], function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Map - Map';

  var expected = true;
  var got = _.contains( {}, {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : 0 }, { a : 0 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : 1, b : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : 1 }, { a : 1, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : undefined, b : 1 }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : undefined }, { a : undefined, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : undefined }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : null }, { a : null } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : { b : 1 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : { b : 1 } }, { a : { b : 1, c : 2 } } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : { b : 1, c : 2 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : { b : 1, c : 3 } }, { b : 1, c : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : null }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : undefined }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, { a : undefined } );
  test.identical( got, expected );

  /* */

  test.case = 'Map - not Map';

  var expected = false;
  var got = _.contains( {}, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( function(){}, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( {}, function(){} );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( function(){}, {} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.contains( { a : '1' }, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : undefined }, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : null }, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : NaN }, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : 0 }, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : 1 }, 1 );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : {} }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : new Date() }, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : new F32x( 3 ) }, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : /(?:)/ }, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : function(){} }, function(){} );
  test.identical( got, expected );

  var expected = false;
  var src = { a : function(){} };
  function src02(){};
  var got = _.contains( src, src02 );
  test.identical( got, expected );

  var expected = false;
  var src = { a : function(){} };
  function src03(){};
  src03.a = src.a;
  var got = _.contains( src, src03 );
  test.identical( got, expected );

  var expected = true;
  function src04(){};
  src04.a = '13';
  var src2 = {};
  var got = _.contains( src04, src2 );
  test.identical( got, expected );

  var expected = true;
  function src05(){};
  src05.a = '13';
  var src2 = { a : '13' };
  var got = _.contains( src05, src2 );
  test.identical( got, expected );

  /* qqq : add typed / raw / node / view buffers tests */

}

//

function containsMap( test )
{

  /* */

  test.case = 'empty';
  var src1 = {};
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), true );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  /* */

  test.case = 'src1.b:0';
  var src1 = { b : '0' };
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  /* */

  test.case = 'src1.b:0 src2.b:0';
  var src1 = { b : '0' };
  var src2 = { b : '0' };
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), true );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  test.identical( src1, src2 ); /* qqq : add similar test checks to other cases */
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  /* */

  test.case = 'src1.b:1 src2.b:2';
  var src1 = { b : '1' };
  var src2 = { b : '2' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  /* */

  test.case = 'src1.a:1 src2.b:2';
  var src1 = { a : '1' };
  var src2 = { b : '2' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  /* */

  test.case = 'src1.a:1 src1.b:0 src1.c:1 src2.b:0';
  var src1 = { a : '1', b : '0', c : '1' };
  var src2 = { b : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.a:0 src1.b:1 src1.c:1 src2.a:0';
  var src1 = { a : '0', b : '1', c : '1' };
  var src2 = { a : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.a:1 src1.b:1 src1.c:0 src2.c:0';
  var src1 = { a : '1', b : '1', c : '0' };
  var src2 = { c : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

}

//

function containsObject( test )
{

  /* */

  test.case = 'empty';

  var src1 = new Obj1({});
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.b:0';
  var src1 = new Obj1({ b : '0' });
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = { b : '0' };
  var src2 = new Obj1({});
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), true );

  /* */

  test.case = 'src1.b:0 src2.b:0';
  var src1 = new Obj1({ b : '0' });
  var src2 = { b : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.b:1 src2.b:2';
  var src1 = new Obj1({ b : '1' });
  var src2 = { b : '2' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.a:1 src2.b:2';
  var src1 = new Obj1({ a : '1' });
  var src2 = { b : '2' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.a:1 src1.b:0 src1.c:1 src2.b:0';
  var src1 = new Obj1({ a : '1', b : '0', c : '1' });
  var src2 = { b : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = { a : '1', b : '0', c : '1' };
  var src2 = new Obj1({ b : '0' });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.a:0 src1.b:1 src1.c:1 src2.a:0';
  var src1 = new Obj1({ a : '0', b : '1', c : '1' });
  var src2 = { a : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = { a : '0', b : '1', c : '1' };
  var src2 = new Obj1({ a : '0' });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.a:1 src1.b:1 src1.c:0 src2.c:0';
  var src1 = new Obj1({ a : '1', b : '1', c : '0' });
  var src2 = { c : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = { a : '1', b : '1', c : '0' };
  var src2 = new Obj1({ c : '0' });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  function Obj1( o )
  {
    _.props.extend( this, o );
    return this;
  }

}

//

function containsObjectWithIteratorAndMap( test )
{

  /* */

  test.case = 'empty';

  var src1 = new Obj1({});
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.b:0';
  var src1 = new Obj1({ elements : [ 'b' ] });
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = { b : '0' };
  var src2 = new Obj1({ elements : [ 'b' ] });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'src1.b:0 src2.b:0';
  var src1 = new Obj1({ b : '0' });
  var src2 = { b : '0' };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  /* xxx : remove */
  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function Obj1( o )
  {
    _.props.extend( this, o );
    this[ Symbol.iterator ] = _iterate;
    return this;
  }

  /* */

}

//

function containsObjectWithEqualerAndIterator( test )
{

  /* */

  test.case = 'iterating:1 equaling:0';

  var src1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 2 ], countable : 1 });
  var src2 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 3 ], countable : 1 });
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), true );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  var src1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 2 ], withEqualer : 1 });
  var src2 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 3 ], withEqualer : 1 });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 2 ], countable : 1, withEqualer : 1 });
  var src2 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 3 ], countable : 1, withEqualer : 1 });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  /* */

  test.case = 'iterating:0 equaling:1';

  var src1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 2, 3 ], countable : 1 });
  var src2 = new Obj1({ elements : [ 0, 2 ], elements2 : [ 2, 3 ], countable : 1 });
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.identical( _.containsAll( src1, src2 ), false );
  test.identical( _.containsAll( src2, src1 ), false );
  test.identical( _.containsAny( src1, src2 ), false );
  test.identical( _.containsAny( src2, src1 ), false );
  test.identical( _.containsOnly( src1, src2 ), false );
  test.identical( _.containsOnly( src2, src1 ), false );
  test.identical( _.containsNone( src1, src2 ), false );
  test.identical( _.containsNone( src2, src1 ), false );

  var src1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 2, 3 ], withEqualer : 1 });
  var src2 = new Obj1({ elements : [ 0, 2 ], elements2 : [ 2, 3 ], withEqualer : 1 });
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), true );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  var src1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 2, 3 ], countable : 1, withEqualer : 1 });
  var src2 = new Obj1({ elements : [ 0, 2 ], elements2 : [ 2, 3 ], countable : 1, withEqualer : 1 });
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( _.containsAll( src1, src2 ), true );
  test.identical( _.containsAll( src2, src1 ), true );
  test.identical( _.containsAny( src1, src2 ), true );
  test.identical( _.containsAny( src2, src1 ), true );
  test.identical( _.containsOnly( src1, src2 ), true );
  test.identical( _.containsOnly( src2, src1 ), true );
  test.identical( _.containsNone( src1, src2 ), true );
  test.identical( _.containsNone( src2, src1 ), true );

  /* */

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

  /* */

  function _equalAre( it )
  {
    if( _.long.identical( it.src.elements2, it.src2.elements2 ) )
    {
      it.continue = false;
      it.result = true;
    }
    else
    {
      it.continue = false;
      it.result = false;
    }
  }

  /* */

  function Obj1( o )
  {
    _.props.extend( this, o );
    if( o.countable )
    this[ Symbol.iterator ] = _iterate;
    if( o.withEqualer )
    this[ Symbol.for( 'equalAre' ) ] = _equalAre;
    return this;
  }

  /* */

}

//

function compareObjectWithIteratorAndEqual( test )
{

  Object.setPrototypeOf( Obj1.prototype, null );
  Obj1.prototype = Object.create( null );
  Obj1.prototype[ _.class.equalAreSymbol ] = equalAre;
  Obj1.prototype[ _.class.iteratorSymbol ] = iterate;
  Obj1.prototype.constructor = Obj1;

  /* */

  test.case = 'identical, depth:1';
  var src1 = new Obj1( 1 );
  var src2 = new Obj1( 1 );
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'identical, depth:2';
  var src1 = new Obj1( new Obj1( 1 ) );
  var src2 = new Obj1( new Obj1( 1 ) );
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'identical, depth:3';
  var src1 = new Obj1( new Obj1( new Obj1( 1 ) ) );
  var src2 = new Obj1( new Obj1( new Obj1( 1 ) ) );
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'not identical, depth:1';
  var src1 = new Obj1( 1 );
  var src2 = new Obj1( 2 );
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not identical, depth:2';
  var src1 = new Obj1( new Obj1( 1 ) );
  var src2 = new Obj1( new Obj1( 2 ) );
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not identical, depth:3';
  var src1 = new Obj1( new Obj1( new Obj1( 1 ) ) );
  var src2 = new Obj1( new Obj1( new Obj1( 2 ) ) );
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  function equalAre( it )
  {
    let self = this;

    _.assert( arguments.length === 1 );

    if( !it.src )
    return end( false );
    if( !it.src2 )
    return end( false );
    if( !( it.src instanceof Obj1 ) )
    return end( false );
    if( !( it.src2 instanceof Obj1 ) )
    return end( false );

    if( it.src.val === it.src2.val )
    return end( true );

    if( !( it.src.val instanceof Obj1 ) )
    return end( false );
    if( !( it.src.val instanceof Obj1 ) )
    return end( false );

    function end( result )
    {
      it.result = result;
      it.continue = false;
    }
  }

  /* */

  function iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === 1;
      if( result.done )
      return result;
      result.value = this.instance.val;
      this.index += 1;
      return result;
    }

  }

  /* */

  function Obj1( val )
  {
    if( arguments.length !== 1 )
    throw new Error( 'Expects exactly 1 argument' );
    this.val = val;
    Object.freeze( this );
    return this;
  }

}

// --
//
// --

function comparePrimitiveAndNon( test )
{

  /* */

  test.case = 'map pure';
  var src1 = 3;
  var src2 = Object.create( null );
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );

  /* */

  test.case = 'map standanrd';
  var src1 = 3;
  var src2 = {};
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );

  /* */

  test.case = 'array';
  var src1 = 3;
  var src2 = [ 1, 2, 3 ];
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );

  /* */

}

//

function compareNull( test )
{

  /* */

  test.case = 'null';
  var src1 = null;
  var src2 = null;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true ); /* qqq : find all test cases having such checks and add missing contains* checks */
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'undefined';
  var src1 = null;
  var src2 = undefined;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'zero';
  var src1 = null;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'empty str';
  var src1 = null;
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareUndefined( test )
{

  /* */

  test.case = 'undefined';
  var src1 = undefined;
  var src2 = undefined;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'null';
  var src1 = undefined;
  var src2 = null;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'zero';
  var src1 = undefined;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'empty str';
  var src1 = undefined;
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareEmptyString( test )
{

  /* */

  test.case = 'empty string';
  var src1 = '';
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'undefined';
  var src1 = '';
  var src2 = undefined;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'null';
  var src1 = '';
  var src2 = null;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'zero';
  var src1 = '';
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareZero( test )
{

  /* */

  test.case = 'zero';
  var src1 = 0;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'undefined';
  var src1 = 0;
  var src2 = undefined;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'null';
  var src1 = 0;
  var src2 = null;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'empty string';
  var src1 = 0;
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareDate( test )
{

  /* */

  test.case = 'same dates'
  var expected = true;
  var src1 = new Date( 1995, 11, 17, 3, 24, 0 );
  var src2 = new Date( 1995, 11, 17, 3, 24, 0 );
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );

  /* */

  test.case = 'different dates'
  var expected = true;
  var src1 = new Date( 1995, 11, 17, 3, 24, 0 );
  var src2 = new Date( 1995, 11, 17, 3, 24, 1 );
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );

  /* */

}

//

function compareRegexp( test )
{

  /* */

  test.case = 'same regexps'
  var expected = true;
  var src1 = /some \n regexp/;
  var src2 = /some \n regexp/;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );

  /* */

  test.case = 'different regexps'
  var expected = true;
  var src1 = /some \n regexp/;
  var src2 = /some \n regexp2/;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );

  /* */

  test.case = 'different flags'
  var expected = true;
  var src1 = /some \n regexp/i;
  var src2 = /some \n regexp/;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );

  /* */

}

//

function compareString( test )
{

  /* */

  test.case = 'identical';

  var src1 =
`
  abc\x20\x20

`
  var src2 =
`
  abc\x20\x20

`
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'not identical';

  var src1 =
`
  abc\x20\x20

`
  var src2 = `abc`;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'not equivalent';

  var src1 = `ab cd`;
  var src2 = `ab  cd`;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareString2( test )
{

  test.case = 'entityIdentical string and object string';
  var a = '0';
  var b = new String( '0' );
  var got = _.entityIdentical( a, b );
  test.identical( got, false );
  var got = _.entityIdentical( b, a );
  test.identical( got, false );

  test.case = 'entityEquivalent string and object string';
  var a = '0';
  var b = new String( '0' );
  var got = _.entityEquivalent( a, b );
  test.identical( got, true );
  var got = _.entityEquivalent( b, a );
  test.identical( got, true );

  test.case = 'entityIdentical lines with different spacing on ends';
  var a =
`
 some
text `
+ `

this is
`;
  var b =
`some
text
this is


`
  var got = _.entityIdentical( a, b );
  test.identical( got, false );
  var got = _.entityIdentical( b, a );
  test.identical( got, false );

  test.case = 'entityEquivalent lines with different spacing on ends';
  var a =
`
 some
text `
+ `

this is
`;
  var b =
`some
text
this is


`
  var got = _.entityEquivalent( a, b );
  test.identical( got, true );
  var got = _.entityEquivalent( b, a );
  test.identical( got, true );

}

//

function compareStringOptionStrictString( test )
{

  test.case = 'empty and non-empty';
  var src1 = '';
  var src2 = 'x';
  test.true( !_.contains( src1, src2 ) );
  test.true( !_.contains( src2, src1 ) );
  test.true( !_.equivalent( src1, src2 ) );
  test.true( !_.equivalent( src2, src1 ) );

  test.case = '2 empty strings';
  var src1 = '';
  var src2 = '';
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.identical( src1, src2, { strictString : 0 } ) );
  test.true( _.identical( src2, src1, { strictString : 0 } ) );

  test.case = 'empty string and space';
  var src1 = '';
  var src2 = '  ';
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.identical( src1, src2, { strictString : 0 } ) );
  test.true( _.identical( src2, src1, { strictString : 0 } ) );

  test.case = 'empty string and space and nl';
  var src1 = '';
  var src2 = '  \n  ';
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.identical( src1, src2, { strictString : 0 } ) );
  test.true( _.identical( src2, src1, { strictString : 0 } ) );

  test.case = 'single line';
  var src1 = ' abc ';
  var src2 = 'abc';
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.identical( src1, src2, { strictString : 0 } ) );
  test.true( _.identical( src2, src1, { strictString : 0 } ) );

  test.case = 'not-prefixed by nl';
  var src1 = ' abc \n\n def ';
  var src2 = 'abc\ndef';
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.identical( src1, src2, { strictString : 0 } ) );
  test.true( _.identical( src2, src1, { strictString : 0 } ) );

  test.case = 'prefixed by nl';
  var src1 = '\n abc \n\n def \n';
  var src2 = 'abc\ndef';
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.identical( src1, src2, { strictString : 0 } ) );
  test.true( _.identical( src2, src1, { strictString : 0 } ) );

}

//

function compareNumber( test )
{

  /* */

  test.case = 'identical number';
  var src1 = 13;
  var src2 = 13;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'nan ~ nan';
  var src1 = NaN;
  var src2 = NaN;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'Infinity ~ Infinity';
  var src1 = Infinity;
  var src2 = Infinity;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = '-Infinity ~ -Infinity';
  var src1 = -Infinity;
  var src2 = -Infinity;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'zero ~ zero';
  var src1 = 0;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = '+zero ~ -zero';
  var src1 = +0;
  var src2 = -0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'not equivalent number';
  var src1 = 13;
  var src2 = 3;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'Infinity - NaN';
  var src1 = Infinity;
  var src2 = NaN;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'Infinity ~ -Infinity';
  var src1 = Infinity;
  var src2 = -Infinity;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'number ~ big int';
  var src1 = 3;
  var src2 = 3n;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* qqq : improve diff of big ints */

  /* */

}

//

function compareString( test )
{

  /* */

  test.case = 'identical string';
  var src1 = 'abc';
  var src2 = 'abc';
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'empty ~ empty';
  var src1 = '';
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'not equivalent';
  var src1 = 'abc1';
  var src2 = 'abc2';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'empty ~ not empty';
  var src1 = '';
  var src2 = 'abc';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareBool( test )
{

  /* */

  test.case = 'true ~ true';
  var src1 = true;
  var src2 = true;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'false ~ false';
  var src1 = false;
  var src2 = false;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'true ~ 1';
  var src1 = true;
  var src2 = 1;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'true ~ 2';
  var src1 = true;
  var src2 = 2;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'false ~ 0';
  var src1 = false;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'not equivalent';
  var src1 = true;
  var src2 = false;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareSameInstance( test )
{

  /* */

  test.case = 'undefined';
  var src1 = undefined;
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'null';
  var src1 = null;
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'map.polluted empty';
  var src1 = {};
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'map.polluted not empty';
  var src1 = { a : 1 };
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'map.pure';
  var src1 = Object.create( null );
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'object';
  var src1 = new Obj1({ 'a' : 1 });
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'hashMap';
  var src1 = new HashMap();
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'array empty';
  var src1 = [];
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'array nonempty';
  var src1 = [ 1, 2, 3 ];
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'F32x empty';
  var src1 = new F32x([]);
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'F32x nonempty';
  var src1 = new F32x([ 1, 2, 3 ]);
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  function Obj1( o )
  {
    _.props.extend( this, o );
    return this;
  }

}

//

function compareUndefinedElement( test )
{

  /* */

  test.case = 'map.polluted, null ~ undefined';
  var src1 = { a : null };
  var src2 = { a : undefined };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.polluted, no ~ undefined';
  var src1 = {};
  var src2 = { a : undefined };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'array, null ~ undefined';
  var src1 = [ null ];
  var src2 = [ undefined ];
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'array, no ~ undefined';
  var src1 = [];
  var src2 = [ undefined ];
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'array length:1, no ~ undefined';
  var src1 = new Array( 1 );
  var src2 = [ undefined ];
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

}

//

function compareObjectsWithoutEqualAre( test )
{

  /* */

  test.case = 'map.polluted, not equal field';

  var src1 = { val : 1 };
  var src2 = { val : 2 };

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.polluted, equal field';

  var src1 = { val : 3 };
  var src2 = { val : 3 };

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'map.pure, not equal field';

  var src1 = Object.create( null );
  src1.val = 1;
  var src2 = Object.create( null );
  src2.val = 2;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.pure, equal field';

  var src1 = Object.create( null );
  src1.val = 3;
  var src2 = Object.create( null );
  src2.val = 3;

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'map.prototyped, not equal field';

  var src1 = Object.create( Object.create( null ) );
  src1.val = 1;
  var src2 = Object.create( Object.create( null ) );
  src2.val = 2;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, equal field';

  var src1 = Object.create( Object.create( null ) );
  src1.val = 3;
  var src2 = Object.create( Object.create( null ) );
  src2.val = 3;

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'map.prototyped, prototype has equal field, not equal field';

  var proto1 = Object.create( null );
  proto1.protoVal = 3;
  var src1 = Object.create( proto1 );
  src1.val = 1;
  var proto2 = Object.create( null );
  proto2.protoVal = 3;
  var src2 = Object.create( proto2 );
  src2.val = 2;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, prototype has equal field, equal field';

  var proto1 = Object.create( null );
  proto1.protoVal = 3;
  var src1 = Object.create( proto1 );
  src1.val = 3;
  var proto2 = Object.create( null );
  proto2.protoVal = 3;
  var src2 = Object.create( proto2 );
  src2.val = 3;

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'map.prototyped, prototype has not equal field, equal field';

  var proto1 = Object.create( null );
  proto1.protoVal = 1;
  var src1 = Object.create( proto1 );
  src1.val = 3;
  var proto2 = Object.create( null );
  proto2.protoVal = 2;
  var src2 = Object.create( proto2 );
  src2.val = 3;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object, not equal field';

  function Constructor2( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }

  var src1 = new Constructor2( 3, 0 );
  var src2 = new Constructor2( 4, 1 );

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object, equal field';

  function Constructor2( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }

  var src1 = new Constructor2( 0, 0 );
  var src2 = new Constructor2( 0, 0 );

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

//

function compareAuxiliaryWithEqualAre( test )
{

  /* */

  test.case = 'map.polluted, not equal field';

  var src1 = { val : 1 };
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = { val : 2 };
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.polluted, equal field';

  var src1 = { val : 3, val2 : 1 };
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = { val : 3, val2 : 2 };
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.pure, not equal field';

  var src1 = Object.create( null );
  src1.val = 1;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = Object.create( null );
  src2.val = 2;
  src2.val2 = 2;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.pure, equal field';

  var src1 = Object.create( null );
  src1.val = 3;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = Object.create( null );
  src2.val = 3;
  src2.val2 = 2;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, not equal field';

  var src1 = Object.create( Object.create( null ) );
  src1.val = 1;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = Object.create( Object.create( null ) );
  src2.val = 2;
  src2.val2 = 2;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, equal field';

  var src1 = Object.create( Object.create( null ) );
  src1.val = 3;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = Object.create( Object.create( null ) );
  src2.val = 3;
  src2.val2 = 2;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, prototype has equal field, not equal field';

  var proto1 = Object.create( null );
  proto1.protoVal = 3;
  var src1 = Object.create( proto1 );
  src1.val = 1;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;

  var proto2 = Object.create( null );
  proto2.protoVal = 3;
  var src2 = Object.create( proto2 );
  src2.val = 2;
  src2.val2 = 2;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, prototype has equal field, equal field';

  var proto1 = Object.create( null );
  proto1.protoVal = 3;
  var src1 = Object.create( proto1 );
  src1.val = 3;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;

  var proto2 = Object.create( null );
  proto2.protoVal = 3;
  var src2 = Object.create( proto2 );
  src2.val = 3;
  src2.val2 = 2;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'map.prototyped, prototype has not equal field, equal field';

  var proto1 = Object.create( null );
  proto1.protoVal = 1;
  var src1 = Object.create( proto1 );
  src1.val = 3;
  src1.val2 = 1;
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;

  var proto2 = Object.create( null );
  proto2.protoVal = 2;
  var src2 = Object.create( proto2 );
  src2.val = 3;
  src2.val2 = 1;
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object, not equal field, prototype has _equalAre';

  function ProtoWith( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  ProtoWith.prototype[ Symbol.for( 'equalAre' ) ] = _equalAre;

  var src1 = new ProtoWith( 3, 0 );
  var src2 = new ProtoWith( 4, 1 );

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object, equal field, bad name';

  function ProtoWithout( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  ProtoWithout.prototype._equalAre2 = _equalAre;

  var src1 = new ProtoWithout( 0, 0 );
  var src2 = new ProtoWithout( 0, 0 );

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object, equal field, prototype has _equalAre';

  function ProtoWith( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  ProtoWith.prototype[ Symbol.for( 'equalAre' ) ] = _equalAre;

  var src1 = new ProtoWith( 3, 1 );
  var src2 = new ProtoWith( 3, 2 );

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'object-map, equal field, prototype has _equalAre';

  function ProtoWith( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  ProtoWith.prototype[ Symbol.for( 'equalAre' ) ] = _equalAre;

  var src1 = new ProtoWith( 3, 1 );
  var src2 = { val : 3, val2 : 2 };

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'object, equal field, instance has _equalAre';

  function InstanceWith( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    this[ Symbol.for( 'equalAre' ) ] = _equalAre;
    return this;
  }

  var src1 = new InstanceWith( 3, 1 );
  var src2 = new InstanceWith( 3, 2 );

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'object, equal field, prototype has _equalAre, with toPrimitive';

  function ProtoWithStringTag( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  ProtoWithStringTag.prototype[ Symbol.for( 'equalAre' ) ] = _equalAre;
  Object.defineProperty
  (
    ProtoWithStringTag.prototype,
    Symbol.toStringTag,
    {
      enumerable : false,
      configurable : false,
      get : function(){ return 'ProtoWithStringTag1' }
    }
  );

  var src1 = new ProtoWithStringTag( 3, 1 );
  var src2 = new ProtoWithStringTag( 3, 2 );

  test.identical( Object.prototype.toString.call( ProtoWithStringTag ), '[object Function]' );
  test.identical( Object.prototype.toString.call( src1 ), '[object ProtoWithStringTag1]' );

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'object, equal field, instance has _equalAre, with toPrimitive';

  function InstanceWithStringTag( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    this[ Symbol.for( 'equalAre' ) ] = _equalAre;
    return this;
  }
  Object.defineProperty
  (
    InstanceWithStringTag.prototype,
    Symbol.toStringTag,
    {
      enumerable : false,
      configurable : false,
      get : function(){ return 'InstanceWithStringTag1' }
    }
  );

  var src1 = new InstanceWithStringTag( 3, 1 );
  var src2 = new InstanceWithStringTag( 3, 2 );

  test.identical( Object.prototype.toString.call( InstanceWithStringTag ), '[object Function]' );
  test.identical( Object.prototype.toString.call( src1 ), '[object InstanceWithStringTag1]' );

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  function _equalAre( it )
  {
    // console.log( `_equalAre ${it.src.val} ${it.src2.val}` );
    it.continue = false;
    it.result = it.src.val === it.src2.val;
  }

}

//

function compareObjectsWithSecondCoerce( test )
{

  /* */

  test.case = 'from number';

  function FromNumber( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  FromNumber.prototype[ Symbol.for( 'equalAre' ) ] = _equalAre;
  FromNumber.prototype[ Symbol.for( 'equalSecondCoerce' ) ] = _equalSecondCoerceFromNumber;

  var src1 = new FromNumber( 1, 0 );
  var src2 = 1;

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'from array';

  function FromArray( val, val2 )
  {
    this.val = val;
    this.val2 = val2;
    return this;
  }
  FromArray.prototype[ Symbol.for( 'equalAre' ) ] = _equalAre;
  FromArray.prototype[ Symbol.for( 'equalSecondCoerce' ) ] = _equalSecondCoerceFromArray;

  var src1 = new FromArray( 1, 0 );
  var src2 = [ 1 ];

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  function _equalAre( it )
  {
    it.continue = false;
    it.result = it.src.val === it.src2.val;
  }

  /* */

  function _equalSecondCoerceFromNumber( it )
  {
    if( _.numberIs( it.src ) )
    it.src = new FromArray( it.src, 0 );
    if( _.numberIs( it.src2 ) )
    it.src2 = new FromArray( it.src2, 0 );
    return true;
  }

  /* */

  function _equalSecondCoerceFromArray( it )
  {
    if( _.longIs( it.src ) )
    it.src = new FromArray( it.src[ 0 ], 0 );
    if( _.longIs( it.src2 ) )
    it.src2 = new FromArray( it.src2[ 0 ], 0 );
    return true;
  }

}

//

function compareObjectsWithIterator( test )
{

  /* */

  test.case = 'object ~ object, identical';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = new InstanceWithStringTag( [ 1, 2, 3 ], 2 );

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'object ~ object, not equivalent';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = new InstanceWithStringTag( [ 1, 2, 4 ], 2 );

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object ~ map';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = { elements : [ 1, 2, 3 ], val2 : 1 };

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.contains( src1, src2 ), false );
  test.identical( _.contains( src2, src1 ), false );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'object ~ array';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = [ 1, 2, 3 ];

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'object ~ F32x';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = new F32x([ 1, 2, 3 ]);

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.contains( src1, src2 ), true );
  test.identical( _.contains( src2, src1 ), true );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  function InstanceWithStringTag( elements, val2 )
  {
    this.elements = elements;
    this.val2 = val2;
    this[ Symbol.iterator ] = _iterate;
    return this;
  }

  function _iterate()
  {

    let iterator = Object.create( null );
    iterator.next = next;
    iterator.index = 0;
    iterator.instance = this;
    return iterator;

    function next()
    {
      let result = Object.create( null );
      result.done = this.index === this.instance.elements.length;
      if( result.done )
      return result;
      result.value = this.instance.elements[ this.index ];
      this.index += 1;
      return result;
    }

  }

}

//

function compareMapPrototyped( test )
{

  eachCase({ map1 : 'polluted', map2 : 'polluted' });

  function eachCase( env )
  {

    /* */

    test.case = 'polluted map ~ polluted map, identical fields';

    var prototype1 = mapMake( env.map1 );
    prototype1.d = '1';
    prototype1.c = 33;
    var src1 = Object.create( prototype1 );
    src1.a = 'abc';
    src1.b = undefined;
    var prototype2 = mapMake( env.map2 );
    prototype2.d = '1';
    prototype2.c = 33;
    var src2 = Object.create( prototype2 );
    src2.a = 'abc';
    src2.b = undefined;

    test.identical( _.entityIdentical( src1, src2 ), true );
    test.identical( _.entityIdentical( src2, src1 ), true );
    test.identical( _.entityEquivalent( src1, src2 ), true );
    test.identical( _.entityEquivalent( src2, src1 ), true );
    test.identical( _.contains( src1, src2 ), true );
    test.identical( _.contains( src2, src1 ), true );
    test.identical( src1, src2 );
    test.identical( src2, src1 );
    test.equivalent( src1, src2 );
    test.equivalent( src2, src1 );

    /* */

    test.case = `${env.map1} ~ ${env.map2}, diff on depth:0`;

    var prototype1 = mapMake( env.map1 );
    prototype1.a = '1';
    prototype1.b = '1';
    var src1 = Object.create( prototype1 );
    src1.b = '0';
    src1.c = '0';
    var prototype2 = mapMake( env.map2 );
    prototype2.a = '1';
    prototype2.b = '1';
    var src2 = Object.create( prototype2 );
    src2.b = '0x';
    src2.c = '0';

    test.identical( _.entityIdentical( src1, src2 ), false );
    test.identical( _.entityIdentical( src2, src1 ), false );
    test.identical( _.entityEquivalent( src1, src2 ), false );
    test.identical( _.entityEquivalent( src2, src1 ), false );
    test.identical( _.contains( src1, src2 ), false );
    test.identical( _.contains( src2, src1 ), false );
    test.nil( src1, src2 );
    test.nil( src2, src1 );
    test.neq( src1, src2 );
    test.neq( src2, src1 );

    /* */

    test.case = `${env.map1} ~ ${env.map2}, diff on depth:1`;

    var prototype1 = mapMake( env.map1 );
    prototype1.a = '1';
    prototype1.b = '1';
    var src1 = Object.create( prototype1 );
    src1.b = '0';
    src1.c = '0';
    var prototype2 = mapMake( env.map2 );
    prototype2.a = '1x';
    prototype2.b = '1';
    var src2 = Object.create( prototype2 );
    src2.b = '0';
    src2.c = '0';

    test.identical( _.entityIdentical( src1, src2 ), false );
    test.identical( _.entityIdentical( src2, src1 ), false );
    test.identical( _.entityEquivalent( src1, src2 ), false );
    test.identical( _.entityEquivalent( src2, src1 ), false );
    test.identical( _.contains( src1, src2 ), false );
    test.identical( _.contains( src2, src1 ), false );
    test.nil( src1, src2 );
    test.nil( src2, src1 );
    test.neq( src1, src2 );
    test.neq( src2, src1 );

    /* */

    test.case = `${env.map1} ~ ${env.map2}, shadowed diff on depth:1`;

    var prototype1 = mapMake( env.map1 );
    prototype1.a = '1';
    prototype1.b = '1';
    var src1 = Object.create( prototype1 );
    src1.b = '0';
    src1.c = '0';
    var prototype2 = mapMake( env.map2 );
    prototype2.a = '1';
    prototype2.b = '1x';
    var src2 = Object.create( prototype2 );
    src2.b = '0';
    src2.c = '0';

    test.identical( _.entityIdentical( src1, src2 ), false );
    test.identical( _.entityIdentical( src2, src1 ), false );
    test.identical( _.entityEquivalent( src1, src2 ), true );
    test.identical( _.entityEquivalent( src2, src1 ), true );
    test.identical( _.contains( src1, src2 ), true );
    test.identical( _.contains( src2, src1 ), true );
    test.nil( src1, src2 );
    test.nil( src2, src1 );
    test.eq( src1, src2 );
    test.eq( src2, src1 );

    /* */

  }

  function mapMake( kind )
  {
    if( kind === 'polluted' )
    return {}
    else
    return Object.create( null );
  }

}

//

function compareMapPrototypedComplementing( test )
{

  /* */

  test.case = 'complementing';
  var src1 = Object.create( { d : 'name', c : 33 } );
  src1.a = 'abc';
  src1.b = undefined;
  var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  var got = _.mapOnlyComplementing_( src1, src1, screenMap );
  var src2 = Object.create( { d : 'name', c : 33 } );
  src2.a = 'abc';
  src2.b = undefined;
  src2.c = 33;
  src2.d = 'name';

  test.true( _.entityIdentical( src1, src2 ) );
  test.true( _.entityIdentical( src2, src1 ) );
  test.true( _.entityEquivalent( src1, src2 ) );
  test.true( _.entityEquivalent( src2, src1 ) );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  test.true( got === src1 );
  test.identical( _.props.onlyExplicit( src1, { onlyEnumerable : 1 } ), { a : 'abc', b : undefined, c : 33, d : 'name' } );
  test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  /* */

}

//

function compareAuxiliaries( test )
{

  test.case = 'map.polluted ~ map.pure';
  var src1 = { a : 1 };
  var src2 = Object.create( null );
  src2.a = 1;
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.pure ~ prototyped.pure, identical, field in prototype';
  var prototype1 = Object.create( null );
  prototype1.a = 0;
  var src1 = Object.create( prototype1 );
  var prototype2 = Object.create( null );
  prototype2.a = 0
  var src2 = Object.create( prototype2 );
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.pure ~ prototyped.polluted, identical, field in prototype';
  var prototype1 = Object.create( null );
  prototype1.a = 0;
  var src1 = Object.create( prototype1 );
  var prototype2 = {};
  prototype2.a = 0
  var src2 = Object.create( prototype2 );
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.pure ~ prototyped.pure, identical, field in instance';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  src1.a = 0;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 0;
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.pure ~ prototyped.polluted, identical, field in instance';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  src1.a = 0;
  var prototype2 = {};
  var src2 = Object.create( prototype2 );
  src2.a = 0;
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped ~ prototyped, different, field in instance';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  src1.a = 0;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.notContains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.notContainsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.notContainsAny( src1, src2 ) );
  test.true( _.notContainsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.notContainsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.notContains( src1, src2 );
  test.notContains( src2, src1 );
  test.notContainsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.notContainsAny( src1, src2 );
  test.notContainsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.notContainsOnly( src2, src1 );

  test.case = 'prototyped ~ prototyped, different, field in prototype';
  var prototype1 = Object.create( null );
  prototype1.a = 0;
  var src1 = Object.create( prototype1 );
  var prototype2 = Object.create( null );
  prototype2.a = 1;
  var src2 = Object.create( prototype2 );
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.notContains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.notContainsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.notContainsAny( src1, src2 ) );
  test.true( _.notContainsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.notContainsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.notContains( src1, src2 );
  test.notContains( src2, src1 );
  test.notContainsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.notContainsAny( src1, src2 );
  test.notContainsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.notContainsOnly( src2, src1 );

  test.case = 'prototyped ~ prototyped overriden';
  var prototype1 = Object.create( null );
  prototype1.a = 0;
  var src1 = Object.create( prototype1 );
  src1.a = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  test.true( !_.identical( src1, src2 ) );
  test.true( !_.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped ~ prototyped overriden in both';
  var prototype1 = Object.create( null );
  prototype1.a = 0;
  var src1 = Object.create( prototype1 );
  src1.a = 1;
  var prototype2 = Object.create( null );
  prototype2.a = -1;
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  test.true( !_.identical( src1, src2 ) );
  test.true( !_.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.polluted ~ not prototyped.polluted';
  var src1 = { a : 1 };
  var src2 = Object.create({ a : 1 });
  test.true( !_.identical( src1, src2 ) );
  test.true( !_.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.pure ~ not prototyped.polluted';
  var src1 = Object.create( null );
  src1.a = 1;
  var src2 = Object.create({ a : 1 });
  test.true( !_.identical( src1, src2 ) );
  test.true( !_.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'prototyped.polluted ~ not prototyped.pure';
  var src1 = {};
  src1.a = 1;
  var prototype2 = Object.create( null );
  prototype2.a = 1;
  var src2 = Object.create( prototype2 );
  test.true( !_.identical( src1, src2 ) );
  test.true( !_.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

}

//

function containsAuxiliaries( test )
{

  test.case = 'equivalent shadowed';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  prototype1.b = 1;
  var src1 = Object.create( prototype1 );
  src1.a = 2;
  src1.b = 2;
  var prototype2 = Object.create( null );
  prototype2.a = 1;
  var src2 = Object.create( prototype2 );
  src2.a = 2;
  src2.b = 2;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.contains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.containsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.containsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );
  test.containsAll( src1, src2 );
  test.containsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.containsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'in prototype extra b ~ in prototype';
  var prototype1 = Object.create( null );
  prototype1.a = 1;
  prototype1.b = 1;
  var src1 = Object.create( prototype1 );
  var prototype2 = Object.create( null );
  prototype2.a = 1;
  var src2 = Object.create( prototype2 );
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.contains( src1, src2 );
  test.notContains( src2, src1 );
  test.containsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'in instance extra b ~ in instance';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  src1.a = 1;
  src1.b = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.contains( src1, src2 );
  test.notContains( src2, src1 );
  test.containsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'in prototype extra b ~ in instance';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  prototype1.a = 1;
  prototype1.b = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.contains( src1, src2 );
  test.notContains( src2, src1 );
  test.containsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'in instance extra b ~ in prototype';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  src1.a = 1;
  src1.b = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  prototype2.a = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.contains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.containsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.containsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.contains( src1, src2 );
  test.notContains( src2, src1 );
  test.containsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.containsOnly( src2, src1 );

  test.case = 'in prototype extra b ~ in prototype extra c';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  prototype1.a = 1;
  prototype1.b = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  prototype2.a = 1;
  prototype2.c = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.notContains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.notContainsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.notContainsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.notContains( src1, src2 );
  test.notContains( src2, src1 );
  test.notContainsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.notContainsOnly( src2, src1 );

  test.case = 'in intance extra b ~ in instance extra c';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  src1.a = 1;
  src1.b = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  src2.c = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.notContains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.notContainsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.notContainsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.notContains( src1, src2 );
  test.notContains( src2, src1 );
  test.notContainsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.notContainsOnly( src2, src1 );

  test.case = 'in prototype extra b ~ in instance extra c';
  var prototype1 = Object.create( null );
  var src1 = Object.create( prototype1 );
  prototype1.a = 1;
  prototype1.b = 1;
  var prototype2 = Object.create( null );
  var src2 = Object.create( prototype2 );
  src2.a = 1;
  src2.c = 1;
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.true( _.notContains( src1, src2 ) );
  test.true( _.notContains( src2, src1 ) );
  test.true( _.notContainsAll( src1, src2 ) );
  test.true( _.notContainsAll( src2, src1 ) );
  test.true( _.containsAny( src1, src2 ) );
  test.true( _.containsAny( src2, src1 ) );
  test.true( _.notContainsOnly( src1, src2 ) );
  test.true( _.notContainsOnly( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );
  test.notContains( src1, src2 );
  test.notContains( src2, src1 );
  test.notContainsAll( src1, src2 );
  test.notContainsAll( src2, src1 );
  test.containsAny( src1, src2 );
  test.containsAny( src2, src1 );
  test.notContainsOnly( src1, src2 );
  test.notContainsOnly( src2, src1 );

}

//

function compareSet( test )
{

  /* */

  test.case = 'identical flat sets';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = new Set([ 1, 2, 3 ]);
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* */

  test.case = 'not identical flat sets. same length';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = new Set([ 1, 2, 4 ]);
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not identical flat sets. diff length';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = new Set([ 1, 2 ]);
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'identical deep sets';
  var src1 = new Set([ 3, [ 2 ], [ 1 ] ]);
  var src2 = new Set([ [ 1 ], [ 2 ], 3 ]);
  test.true( _.identical( src1, src2 ) );
  test.true( _.identical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.il( src1, src2 );
  test.il( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* */

  test.case = 'not identical deep sets';
  var src1 = new Set([ 3, [ 2, 1 ], [ 1 ] ]);
  var src2 = new Set([ [ 1 ], [ 2 ], 3 ]);
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'equivalent flat set and array';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = [ 1, 3, 2 ];
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.equivalent( src1, src2 ) );
  test.true( _.equivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.eq( src1, src2 );
  test.eq( src2, src1 );

  /* */

  test.case = 'not identical flat set and array. same length';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = [ 1, 2, 4 ];
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not identical flat set and array. diff length';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = [ 1, 2 ];
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

  test.case = 'not identical flat set and array. diff length';
  var src1 = new Set([ 3, 2, 1 ]);
  var src2 = [ 1, 2, 3, 4 ];
  test.true( _.notIdentical( src1, src2 ) );
  test.true( _.notIdentical( src2, src1 ) );
  test.true( _.notEquivalent( src1, src2 ) );
  test.true( _.notEquivalent( src2, src1 ) );
  test.nil( src1, src2 );
  test.nil( src2, src1 );
  test.neq( src1, src2 );
  test.neq( src2, src1 );

  /* */

}

// --
//
// --

function entityIdenticalCycled( test )
{
  var c = this;

  test.case = 'trivial array';

  var expected = true;
  var got = _.entityIdentical( [ 1, 3 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1, 3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  test.case = 'trivial map';

  var expected = true;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  test.case = 'trivial mixed with routine';

  // var onScalar = function(){};
  var src1 =
  {
    onScalar,
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }
  var src2 =
  {
    onScalar,
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }

  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  // var onScalar = function(){};
  var src1 =
  {
    onScalar : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }
  var src2 =
  {
    onScalar : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }

  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { e : [ 1, 3, 4 ] }
  var b = { e : [ 1, 4, 4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.case = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.case = 'mixed cycle - equal';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  var ac1 = { f1 : af1, Instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  var bc1 = { f1 : bf1, Instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.case = 'mixed cycle - different cycle a';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  var bc1 = { f1 : bf1, Instances : binstances };
  binstances.push( bc1 );

  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.case = 'mixed cycle - different cycle b';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  var ac1 = { f1 : af1, Instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  binstances.push( b );

  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  /* - */

  function onScalar(){}

}

//

function entityIdenticalCycledWithOptions( test )
{
  var c = this;

  /* */

  var onUpPaths = [];
  function onUp( e, k, it )
  {
    onUpPaths.push( it.path );
    if( !it.result )
    it.continue = false;
  }

  /* */

  var onDownPaths = [];
  function onDown( e, k, it )
  {
    onDownPaths.push( it.path );
  }

  /* */

  function clean()
  {
    onUpPaths = [];
    onDownPaths = [];
    opt = { onUp, onDown };
  }

  var opt = null;

  /* */

  test.case = 'trivial array';

  clean();
  var expected = true;
  var got = _.entityIdentical( [ 1, 3 ], [ 1, 3 ], opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/#0', '/#1' ] );
  test.identical( onDownPaths, [ '/#0', '/#1', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1, 3 ], opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1, 3 ], [ 1 ], opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ], opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/#0' ] );
  test.identical( onDownPaths, [ '/#0', '/' ] );

  /* */

  test.case = 'trivial map';

  clean();
  var expected = true;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1, b : 3 }, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/b' ] );
  test.identical( onDownPaths, [ '/a', '/b', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : 1 }, { a : 1, b : 3 }, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1 }, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } }, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a' ] );
  test.identical( onDownPaths, [ '/a', '/' ] );

  /* */

  test.case = 'trivial mixed with routine';

  // var onScalar = function(){};
  var src1 =
  {
    onScalar,
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }
  var src2 =
  {
    onScalar,
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }

  clean();
  var expected = true;
  var got = _.entityIdentical( src1, src2, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onScalar', '/name', '/takingArguments', '/takingArguments/#0', '/takingArguments/#1' ] );
  test.identical( onDownPaths, [ '/onScalar', '/name', '/takingArguments/#0', '/takingArguments/#1', '/takingArguments', '/' ] );

  // var onScalar = function(){};
  var src1 =
  {
    onScalar : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }
  var src2 =
  {
    onScalar : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }

  clean();
  var expected = false;
  var got = _.entityIdentical( src1, src2, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onScalar' ] );
  test.identical( onDownPaths, [ '/onScalar', '/' ] );

  /* */

  test.case = 'trivial mixed';

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/#0', '/b', '/b/c', '/b/c/#0', '/b/c/#0/d', '/b/c/#0/e', '/b/c/#0/e/#0', '/b/c/#0/e/#1' ] );
  test.identical( onDownPaths, [ '/a/#0', '/a', '/b/c/#0/d', '/b/c/#0/e/#0', '/b/c/#0/e/#1', '/b/c/#0/e', '/b/c/#0', '/b/c', '/b', '/' ] );

  clean();
  var a = { e : [ 1, 3 ] }
  var b = { e : [ 1, 4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/#0', '/e/#1' ] );
  test.identical( onDownPaths, [ '/e/#0', '/e/#1', '/e', '/' ] );

  clean();
  var a = { e : [ 1, 3, 4 ] }
  var b = { e : [ 1, 4, 4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/#0', '/e/#1' ] );
  test.identical( onDownPaths, [ '/e/#0', '/e/#1', '/e', '/' ] );

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/#0', '/b', '/b/c', '/b/c/#0', '/b/c/#0/d', '/b/c/#0/e', '/b/c/#0/e/#0', '/b/c/#0/e/#1' ] );
  test.identical( onDownPaths, [ '/a/#0', '/a', '/b/c/#0/d', '/b/c/#0/e/#0', '/b/c/#0/e/#1', '/b/c/#0/e', '/b/c/#0', '/b/c', '/b', '/' ] );

  /* */

  test.case = 'cycle';

  clean();
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : { x : 1, y : null }, y : null }
  a.x.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x' ] );
  test.identical( onDownPaths, [ '/x', '/' ] );

  clean();
  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y', '/y/x', '/y/y' ] );
  test.identical( onDownPaths, [ '/x', '/y/x', '/y/y', '/y', '/' ] );

  /* */

  test.case = 'mixed cycle - equal';

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  var ac1 = { f1 : af1, Instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  var bc1 = { f1 : bf1, Instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/Instances', '/Instances/#0', '/Instances/#0/f1', '/Instances/#0/Instances' ] );
  test.identical( onDownPaths, [ '/f1', '/Instances/#0/f1', '/Instances/#0/Instances', '/Instances/#0', '/Instances', '/' ] );

  /* */

  test.case = 'mixed cycle - different cycle a';

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  var bc1 = { f1 : bf1, Instances : binstances };
  binstances.push( bc1 );

  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/Instances', '/Instances/#0', '/Instances/#0/f1', '/Instances/#0/Instances' ] );
  test.identical( onDownPaths, [ '/f1', '/Instances/#0/f1', '/Instances/#0/Instances', '/Instances/#0', '/Instances', '/' ] );

  /* */

  test.case = 'mixed cycle - different cycle b';

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  var ac1 = { f1 : af1, Instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  binstances.push( b );

  var expected = false;
  var got = _.entityIdentical( a, b, opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/Instances', '/Instances/#0' ] );
  test.identical( onDownPaths, [ '/f1', '/Instances/#0', '/Instances', '/' ] );

  /* - */

  function onScalar(){}
}

//

function entityEquivalentCycled( test )
{
  var c = this;

  test.case = 'trivial array';

  var expected = true;
  var got = _.entityEquivalent( [ 1, 3 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ 1 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ 1, 3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  test.case = 'trivial map';

  var expected = true;
  var got = _.entityEquivalent( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  /* */

  test.case = 'trivial mixed with routine';

  // var onScalar = function(){};
  var src1 =
  {
    onScalar,
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }
  var src2 =
  {
    onScalar,
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }

  var expected = true;
  var got = _.entityEquivalent( src1, src2 );

  test.identical( got, expected );
  // var onScalar = function(){};
  var src1 =
  {
    onScalar : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }
  var src2 =
  {
    onScalar : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1, 3 ],
  }

  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { e : [ 1, 3, 4 ] }
  var b = { e : [ 1, 4, 4 ] }
  var expected = false;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = false;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  test.case = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'mixed cycle - equal';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  var ac1 = { f1 : af1, Instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  var bc1 = { f1 : bf1, Instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'mixed cycle - different cycle a';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  var bc1 = { f1 : bf1, Instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'mixed cycle - different cycle b';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, Instances : ainstances };
  var ac1 = { f1 : af1, Instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, Instances : binstances };
  binstances.push( b );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* - */

  function onScalar(){}

}

//

function containsCycled( test )
{
  var c = this;

  /* */

  test.case = 'trivial array';

  var expected = true;
  var got = _.contains( [ 1, 3 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ 1 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( [ 1, 3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  /* */

  test.case = 'trivial map';

  var expected = true;
  var got = _.contains( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.contains( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.contains( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  /* */

  test.case = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var expected = true;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { e : [ 1, 3, 4 ] }
  var b = { e : [ 1, 4, 4 ] }
  var expected = false;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { e : [ 1, 4, 3 ] }
  var b = { e : [ 1, 4 ] }
  var expected = true;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = true;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = false;
  var got = _.contains( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.contains( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.contains( a, b );
  test.identical( got, expected );

}

//

function compareNonRecursive( test )
{

  test.case = 'primitive, recursive : 0';
  var a = 'abc';
  var b = 'abcd';
  var expected = false;
  var got = _.entityEquivalent( a, b, { recursive : 0 } );
  test.identical( got, expected );

  test.case = 'primitive, recursive : 1';
  var a = 'abc';
  var b = 'abcd';
  var expected = false;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  test.case = 'map, recursive : 0';
  var a = { x : 1, y : null, z : 3 }
  var b = { x : 1, y : null, z : 4 }
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 0 } );
  test.identical( got, expected );

  test.case = 'map, recursive : 1';
  var a = { x : 1, y : null, z : 3 }
  var b = { x : 1, y : null, z : 4 }
  var expected = false;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  test.case = 'cycle, recursive : 0';
  var a = { x : 1, y : null, z : 3 }
  a.y = a;
  var b = { x : 1, y : null, z : 4 }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 0 } );
  test.identical( got, expected );

  test.case = 'cycle, recursive : 1, false';
  var a = { x : 1, y : null, z : 3 }
  a.y = a;
  var b = { x : 1, y : null, z : 4 }
  b.y = b;
  var expected = false;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  test.case = 'cycle, recursive : 1, true';
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  test.case = 'cycle, recursive : 1, true';
  var a = { x : 1, y : null, z : [ 3 ] }
  a.y = a;
  var b = { x : 1, y : null, z : [ 4 ] }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  /* - */

  test.open( 'recursive : 0' )

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 0 } );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 0 } );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 0 } );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b, { recursive : 0 } );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b, { recursive : 0 } );
  test.identical( got, expected );

  test.close( 'recursive : 0' )

  /* - */

  test.open( 'recursive : 1' )

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 1 } );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, { recursive : 1 } );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b, { recursive : 1 } );
  test.identical( got, expected );

  test.close( 'recursive : 1' )

  /* - */

  test.open( 'recursive : 2' )

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 2 } );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 2 } );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = true;
  var got = _.entityEquivalent( a, b, { recursive : 2 } );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, { recursive : 2 } );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, { recursive : 2 } );
  test.identical( got, expected );

  test.close( 'recursive : 2' )

}

//

function entityDiffLoose( test )
{

  /* */

  test.case = 'undefined - null';

  var got = _.entityDiff( undefined, null );
  var expected =
`
- src1 :
  undefined
- src2 :
  null
- difference :
 *
`
  test.equivalent( got, expected );

  /* */

  test.case = 'null - undefined';

  var got = _.entityDiff( null, undefined );
  var expected =
`
- src1 :
  null
- src2 :
  undefined
- difference :
  *
`
  test.equivalent( got, expected );

  /* */

  test.case = 'undefined - undefined';

  var got = _.entityDiff( undefined, undefined );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'null - null';

  var got = _.entityDiff( null, null );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'number';

  var got = _.entityDiff( 1, 1 );
  var expected = false;
  test.identical( got, expected );

  /* */

  test.case = 'strings';

  var got = _.entityDiff( 'abc', 'abd' );
  var expected =
`
- src1 :
  'abc'
- src2 :
  'abd'
- difference :
  'ab*
`;

  test.equivalent( got, expected );

  /* */

  test.case = 'arrays';

  var got = _.entityDiff( [ 1, 2, 3 ], [ 1, 2, 4 ] );
  var expected =
`at /#2
- src1 :
  [ 1, 2, 3 ]
- src2 :
  [ 1, 2, 4 ]
- difference :
  [ 1, 2, *`;
  test.equivalent( got, expected );

  /* */

  test.case = 'objects,custom path';

  var src1 = { a : { a : 1, b : '2' }, b : [ 1, 2 ] };
  var src2 = { a : { a : 1, b : '2' } };
  var got = _.entityDiff( src1, src2 );
  var expected =
  `
  - src1 :
  {
    'b' : [ 1, 2 ]
  }
- src2 :
  {}
- difference :
  {*`
  test.equivalent( got, expected );

  /* */

  test.case = 'trivial mixed';

  var src1 =
  {
    f : function(){},
    a : 'reducing',
    b : [ 1, 3 ],
    c : true,
  }
  var src2 =
  {
    f : function(){},
    a : 'reducing',
    b : [ 1, 3 ],
    c : true,
  }

  var got = _.entityDiff( src1, src2 );
  var expected =
  `
  at /f
  - src1 :
  { 'f' : [ routine f ] }
  - src2 :
  { 'f' : [ routine f ] }`
  test.equivalent( got, expected );

  /* */

  test.case = 'trivial mixed';

  var src1 =
  {
    'some//key' : 'some//key',
    'some/key' : 'some/key',
    'some..key' : 'some..key',
    'some.key' : 'some.key',
  }
  var src2 =
  {
    'some//key' : 'some//key2',
    'some/key' : 'some/key2',
    'some..key' : 'some..key2',
    'some.key' : 'some.key2',
  }

  var got = _.entityDiff( src1, src2 );
  var expected =
  `
  at /"some//key"
  - src1 :
  {
  'some//key' : 'some//key',
  'some/key' : 'some/key',
  'some..key' : 'some..key',
  'some.key' : 'some.key'
  }
  - src2 :
  {
  'some//key' : 'some//key2',
  'some/key' : 'some/key2',
  'some..key' : 'some..key2',
  'some.key' : 'some.key2'
  }
  - difference :
  {
  'some//key' : 'some//key*
  `
  test.equivalent( got, expected );

  /* - */

  if( !Config.debug )
  return;

  /* */

  test.case = 'argument missed';
  test.shouldThrowErrorSync( function()
  {
    _.entityDiff( );
  });

  /* */

  test.case = 'invalid options type';
  test.shouldThrowErrorSync( function()
  {
    _.entityDiff( 1, 2, 3 );
  });

}

//

function entityDiffExplanationBasic( test )
{

  /* */

  test.case = 'basic';

  var expected =
`at /MultipleExports/in
- got :
  { 'temp' : 'temp' }
- expected :
  { 'in' : 'in' }
- difference :
  { '*
`

  var srcs =
  [
    {
      MultipleExports :
      {
        temp : 'temp'
      }
    },
    {
      MultipleExports :
      {
        in : 'in'
      }
    }
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/MultipleExports/in',
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'empty str - str';

  var expected =
`- got :
''
- expected :
'str'
- difference :
'*
`

  var srcs = [ '', 'str' ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
  });
  test.equivalent( got, expected );

  /* */

}

//

function entityDiffExplanationString( test )
{

  /* */

  test.case = 'diff single line end, strictString:0';

  var expected =
`
- got :
  'str1'
- expected :
  'str2'
- difference :
  'str*
`

  var srcs = [ 'str1', 'str2' ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
    strictString : 0,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'diff single line mid, strictString:0';

  var expected =
`
- got :
  'ab cd'
- expected :
  'ab  cd'
- difference :
  'ab *
`

  var srcs = [ 'ab cd', 'ab  cd' ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
    strictString : 0,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'same several, strictString:0';

  var expected =
`
- got :
  'ab\ncd'
- expected :
  'ab\ncd'
`

  var srcs = [ 'ab \n cd', 'ab\ncd' ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
    strictString : 0,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'diff single line end, strictString:1';

  var expected =
`
- got :
  'str1'
- expected :
  'str2'
- difference :
  'str*
`

  var srcs = [ 'str1', 'str2' ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
    strictString : 1,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'diff single line mid, strictString:1';

  var expected =
`
- got :
  'ab cd'
- expected :
  'ab  cd'
- difference :
  'ab *
`

  var srcs = [ 'ab cd', 'ab  cd' ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
    strictString : 1,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'same several, strictString:1'; /* qqq : move option strictString into separate test routine */

  var expected =
`
- got :
'ab
cd'
- expected :
'ab
cd'
- difference :
'ab*
`

  var srcs = [ 'ab \n cd', 'ab\ncd' ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/',
    strictString : 1,
  });
  test.equivalent( got, expected );

  /* */

}

//

function entityDiffExplanationMap( test )
{

  /* */

  test.case = '1 el in got, 2 el in exp, got[0] = expected[0],';

  var expected =
`at /MultipleExports/in
- got :
  {}
- expected :
  { 'b' : 2 }
- difference :
  {*
`

  var srcs =
  [
    {
      MultipleExports :
      {
        a : 1,
      }
    },
    {
      MultipleExports :
      {
        a : 1,
        b : 2,
      }
    }
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/MultipleExports/in',
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = '2 el in got, 1 el in exp, got[0] == expected[0],';

  var expected =
`at /MultipleExports/in
- got :
  { 'b' : 2 }
- expected :
  {}
- difference :
  {*
`

  var srcs =
  [
    {
      MultipleExports :
      {
        a : 1,
        b : 2,
      }
    },
    {
      MultipleExports :
      {
        a : 1,
      }
    }
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/MultipleExports/in',
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = '2 el in got, 2 el in exp, got[1] != expected[1],';

  var expected =
`at /MultipleExports/in
- got :
  { 'b' : 2 }
- expected :
  { 'c' : 3 }
- difference :
  { '*
`

  var srcs =
  [
    {
      MultipleExports :
      {
        a : 1,
        b : 2,
      }
    },
    {
      MultipleExports :
      {
        a : 1,
        c : 3,
      }
    }
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/MultipleExports/in',
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = '5 el in got, 3 el in exp, got[0] = expected[0], got[2] = expected[2], got[4] = expected[4]';

  var expected =
`at /MultipleExports/in
- got :
  { 'b' : 2, 'd' : 4 }
- expected :
  {}
- difference :
  {*
`

  var srcs =
  [
    {
      MultipleExports :
      {
        a : 1,
        b : 2,
        c : 3,
        d : 4,
        e : 5
      }
    },
    {
      MultipleExports :
      {
        a : 1,
        c : 3,
        e : 5
      }
    }
  ]
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : '/MultipleExports/in',
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'maps with > 1 el, without path';

  var expected =
`- got :
  { 'b' : 2, 'd' : 4 }
- expected :
  {}
- difference :
  {*
`

  var srcs =
  [
    {
      a : 1,
      b : 2,
      c : 3,
      d : 4,
      e : 5
    },
    {
      a : 1,
      c : 3,
      e : 5
    }
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'maps with > 1 el, big difference, without path';

  var expected =
`- got :
  { 'b' : 2, 'd' : 4, 'f' : 6 }
- expected :
  { 'g' : 7, 'i' : 9 }
- difference :
  { '*
`

  var srcs =
  [
    {
      a : 1,
      b : 2,
      c : 3,
      d : 4,
      e : 5,
      f : 6,
      h : 8,
    },
    {
      a : 1,
      c : 3,
      e : 5,
      g : 7,
      h : 8,
      i : 9
    }
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'maps with > 1 el, 2 identical funcs, without path';

  var expected =
`- got :
  { 'a' : 'reducing1' }
- expected :
  { 'a' : 'reducing2' }
- difference :
  { 'a' : 'reducing*
`

  var srcs =
  [
    {
      f : func1,
      a : 'reducing1',
      b : [ 1, 3 ],
      c : true,
    },
    {
      f : func1,
      a : 'reducing2',
      b : [ 1, 3 ],
      c : true,
    },
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'maps with > 1 el, 1 identical func and 1 different, without path';

  var expected =
`- got :
  { 'f2' : [ routine b ], 'a' : 'reducing1' }
- expected :
  { 'f2' : [ routine b ], 'a' : 'reducing2' }
- difference :
  { 'f2' : [ routine b ], 'a' : 'reducing*
`

  var srcs =
  [
    {
      f1 : func1,
      f2 : function b(){},
      a : 'reducing1',
      b : [ 1, 3 ],
      c : true,
    },
    {
      f1 : func1,
      f2 : function b(){},
      a : 'reducing2',
      b : [ 1, 3 ],
      c : true,
    },
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'maps with > 1 el, 3 identical func and 1 different, with async, without path';

  var expected =
`- got :
  { 'f4' : [ routine a ], 'a' : 'reducing1' }
- expected :
  { 'f4' : [ routine a ], 'a' : 'reducing2' }
- difference :
  { 'f4' : [ routine a ], 'a' : 'reducing*
`

  var srcs =
  [
    {
      f1 : func1,
      f2 : func2,
      f3 : func3a,
      f4 : function a(){},
      a : 'reducing1',
      b : [ 1, 3 ],
      c : true,
    },
    {
      f1 : func1,
      f2 : func2,
      f3 : func3a,
      f4 : function a(){},
      a : 'reducing2',
      b : [ 1, 3 ],
      c : true,
    },
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'got : _.props.onlyExplicit({}), expected : {}, without path';

  var expected =
`- got :
  {
  'constructor' : [ routine Object ],
  '__defineGetter__' : [ routine __defineGetter__ ],
  '__defineSetter__' : [ routine __defineSetter__ ],
  'hasOwnProperty' : [ routine hasOwnProperty ],
  '__lookupGetter__' : [ routine __lookupGetter__ ],
  '__lookupSetter__' : [ routine __lookupSetter__ ],
  'isPrototypeOf' : [ routine isPrototypeOf ],
  'propertyIsEnumerable' : [ routine propertyIsEnumerable ],
  'toString' : [ routine toString ],
  'valueOf' : [ routine valueOf ],
  '__proto__' : {},
  'toLocaleString' : [ routine toLocaleString ]
  }
- expected :
  {}
- difference :
  {*
`

  var srcs =
  [
    _.props.onlyExplicit({}),
    {},
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'got : {}, expected : _.props.onlyExplicit({}), without path';

  var expected =
`- got :
  {}
- expected :
  {
  'constructor' : [ routine Object ],
  '__defineGetter__' : [ routine __defineGetter__ ],
  '__defineSetter__' : [ routine __defineSetter__ ],
  'hasOwnProperty' : [ routine hasOwnProperty ],
  '__lookupGetter__' : [ routine __lookupGetter__ ],
  '__lookupSetter__' : [ routine __lookupSetter__ ],
  'isPrototypeOf' : [ routine isPrototypeOf ],
  'propertyIsEnumerable' : [ routine propertyIsEnumerable ],
  'toString' : [ routine toString ],
  'valueOf' : [ routine valueOf ],
  '__proto__' : {},
  'toLocaleString' : [ routine toLocaleString ]
  }
- difference :
  {*
`

  var srcs =
  [
    {},
    _.props.onlyExplicit({})
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
  });
  test.equivalent( got, expected );

  /* */

  test.case = 'with empty key in path';

  var srcs =
  [
    { 'a' : 1, '' : 1 },
    { 'a' : 1, '' : 2 },
  ]

  var it = _.identical.head( _.identical, [ srcs[ 0 ], srcs[ 1 ] ] );
  var iterator = it.iterator;

  it.perform();
  test.identical( iterator.lastIt.path, '/""' );

  var expected =
`
at /""
- got :
{ '' : 1 }
- expected :
{ '' : 2 }
- difference :
{ '' : *
`
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : iterator.lastIt.path,
  });
  test.equivalent( got, expected );

  /* - */

  function func1(){};

  function func2(){};

  async function func3a(){}

}

//

function entityDiffExplanationLong( test )
{

  /* */

  test.case = 'with ordinal in path';

  var srcs =
  [
    [ { val : 1 } ],
    [ { val : 2 } ],
  ]

  var it = _.identical.head( _.identical, [ srcs[ 0 ], srcs[ 1 ] ] );
  var iterator = it.iterator;

  it.perform();
  test.identical( iterator.lastIt.path, '/#0/val' );

  var expected =
`
at /#0/val
- got :
{ 'val' : 1 }
- expected :
{ 'val' : 2 }
- difference :
{ 'val' : *
`
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    path : iterator.lastIt.path,
    accuracy : null,
  });
  test.equivalent( got, expected );

  /* - */

  function func1(){};

  function func2(){};

  async function func3a(){}

}

//

function entityDiffExplanationMapDiffProto( test )
{

  /*
  Cases when maps' fields are identical:

  1. identical __proto__ OR null and Object.prototype : no diff
  2. different __proto__ :
    `- got :
      '__proto__'
    - expected :
      '__proto__'
    `
  3. one map without __proto__ :
    `- got :
      '__proto__ = null'
    - expected :
      '__proto__'
    `
    OR
    `- got :
      '__proto__'
    - expected :
      '__proto__ = null'
    `
  */

  test.case = 'identical maps, 1 with __proto__ : {}';
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, {} );

  var obj2 =
  {
    a : 'hello1',
    b : 'hello2',
  }

  var expected =
`- got :
  '__proto__'
- expected :
  '__proto__'
`

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = 'identical maps, 2 with equivalent __proto__ : {}';
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, {} );

  var obj2 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj2, {} );

  var expected =
`- got :
  '__proto__'
- expected :
  '__proto__'
`

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = 'not identical maps, 1 with __proto__ : {}';
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, {} );

  var obj2 =
  {
    a : 'hello',
    b : 'hello2',
  }

  var expected =
`- got :
  { 'a' : 'hello1' }
- expected :
  { 'a' : 'hello' }
- difference :
  { 'a' : 'hello*
`

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `identical maps, got without __proto__, expected with custom __proto__`;

  var obj1 = Object.create( null );
  obj1.a = 'hello1';
  obj1.b = 'hello2';

  var proto2 = { 'c' : 'hello3' };
  var obj2 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj2, proto2 );

  var expected =
`- got :
  '__proto__ = null'
- expected :
  '__proto__'
`
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `identical maps, expected without __proto__, got with custom __proto__`;

  var proto = { c : 'hello3' }
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, proto )

  var obj2 = Object.create( null );
  obj2.a = 'hello1';
  obj2.b = 'hello2';

  var expected =
`- got :
  '__proto__'
- expected :
  '__proto__ = null'
`
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `identical maps, 2 with identical __proto__`;

  var proto = { 'c' : 'hello3' }
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, proto );

  var obj2 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj2, proto );

  var expected =
`- got :
  {}
- expected :
  {}
`
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `not identical maps, 2 with identical __proto__`;

  var proto = { 'c' : 'hello3' }
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, proto );

  var obj2 =
  {
    a : 'hello1.1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj2, proto );

  var expected =
`- got :
  { 'a' : 'hello1' }
- expected :
  { 'a' : 'hello1.1' }
- difference :
  { 'a' : 'hello1*
`;

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `identical maps, 2 with equivalent __proto__ with 1 field`;

  var proto = { 'c' : 'hello3' }
  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj1, proto );

  var proto2 = { 'c' : 'hello3' }
  var obj2 =
  {
    a : 'hello1',
    b : 'hello2',
  }
  Object.setPrototypeOf( obj2, proto2 );

  var expected =
`- got :
  '__proto__'
- expected :
  '__proto__'
`;

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `identical maps, got __proto__ = null & expected __proto__ = Object.prototype`;

  var obj1 = Object.create( null );
  obj1.a = 'hello1';
  obj1.b = 'hello2';

  var obj2 =
  {
    a : 'hello1',
    b : 'hello2',
  }

  var expected =
`- got :
  {}
- expected :
  {}
`

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

  test.case = `identical maps, expected __proto__ = null & got __proto__ = Object.prototype`;

  var obj1 =
  {
    a : 'hello1',
    b : 'hello2',
  }

  var obj2 = Object.create( null );
  obj2.a = 'hello1';
  obj2.b = 'hello2';

  var expected =
`- got :
  {}
- expected :
  {}
`

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.equivalent( got, expected );

  /* */

}

// --
// declare
// --

const Proto =
{

  name : 'Tools.l6.Equaler',
  silencing : 1,
  enabled : 1,

  context :
  {
  },

  tests :
  {

    trivial,
    _compareLoose,
    entityIdenticalLoose,
    entityEquivalentLoose,
    containsLoose,
    iteratorResult,
    head,

    /* qqq : for junior */
    entityIdenticalSimple,
    entityIdenticalWithCopyable,
    entityIdenticalArgumentsArray,
    entityEquivalentArgumentsArray,
    entityIdenticalProto, /* qqq : merge and supplement test routines entityIdenticalProto and entityEquivalentProto */
    entityEquivalentProto,
    entityIdenticalBuffers,
    entityEquivalentBuffers,
    entityIdenticalSet,
    entityEquivalentSet,
    entityIdenticalHashMap,
    entityEquivalentHashMap,

    entityIdenticalComparison,
    entityEquivalentComparison,
    entityEquivalentNotIdenticalComparison,

    containsSimple,
    containsMap,
    containsObject,
    containsObjectWithIteratorAndMap,
    // containsCountable, /* qqq : implement */
    containsObjectWithEqualerAndIterator,
    compareObjectWithIteratorAndEqual,

    comparePrimitiveAndNon,
    compareNull,
    compareUndefined,
    compareEmptyString,
    compareZero,
    compareDate,
    compareRegexp,
    compareString,
    compareString2,
    compareStringOptionStrictString,
    compareNumber,
    compareBool,
    compareSameInstance,
    compareUndefinedElement,
    compareObjectsWithoutEqualAre,
    compareAuxiliaryWithEqualAre,
    compareObjectsWithSecondCoerce,
    compareObjectsWithIterator,
    compareMapPrototyped,
    compareMapPrototypedComplementing,
    compareAuxiliaries, /* qqq : normalize other tests, using test compareAuxiliaries as example */
    containsAuxiliaries,
    compareSet,
    // compareContainerType, /* yyy */

    entityIdenticalCycled,
    entityIdenticalCycledWithOptions,
    entityEquivalentCycled,
    containsCycled,
    compareNonRecursive,

    entityDiffLoose,
    entityDiffExplanationBasic,
    entityDiffExplanationString,
    entityDiffExplanationMap,
    entityDiffExplanationLong,
    entityDiffExplanationMapDiffProto

    /* qqq : research: what should be covered in the first place */

  }

}

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
