( function _Equaler_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../../../wtools/Tools.s' );

  _.include( 'wTesting' );
  _.include( 'wStringer' );

  require( '../l6/Equaler.s' );
}

let _global = _global_;
let _ = _global_.wTools;

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

function _entityEqualLoose( test )
{

  /* default options */
  // xxx

  // test.case = 'default options, number';
  // var got = _.equaler._equal( 1, 1 );
  // var expected = true;
  // test.identical( got, expected );

  // test.case = 'default options, string';
  // var got = _.equaler._equal( '123', '123' );
  // var expected = true;
  // test.identical( got, expected );

  // test.case = 'default options, boolean';
  // var got = _.equaler._equal( 0, false );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'default options, array';
  // var got = _.equaler._equal( [ 1, 2, '3' ], [ 1, 2, 3 ] );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'default options, object';
  // var src1 = { a : 1, b : 2, c : { d : 3  }  };
  // var src2 = { a : 1, b : 2, c : { d : 3  }  };
  // var got = _.equaler._equal( src1, src2 );
  // var expected = true;
  // test.identical( got, expected );

  // /* strict string - number */

  // test.case = 'number & string, strictNumbering : 0, strictTyping : 0';
  // var got = _.equaler._equal( '123', 123, { strictNumbering : 0, strictTyping : 0 } );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'number & string, strictNumbering : 1, strictTyping : 0';
  // var got = _.equaler._equal( '123', 123, { strictNumbering : 1, strictTyping : 0 } );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'number & string, strictNumbering : 0, strictTyping : 1';
  // var got = _.equaler._equal( '123', 123, { strictNumbering : 0, strictTyping : 1 } );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'number & string, strictNumbering : 1, strictTyping : 1';
  // var got = _.equaler._equal( '123', 123, { strictNumbering : 1, strictTyping : 1 } );
  // var expected = false;
  // test.identical( got, expected );

  // /* */

  // test.case = 'number & string, strictNumbering : 0, strictTyping : 0';
  // var got = _.equaler._equal( 123, '123', { strictNumbering : 0, strictTyping : 0 } );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'number & string, strictNumbering : 1, strictTyping : 0';
  // var got = _.equaler._equal( 123, '123', { strictNumbering : 1, strictTyping : 0 } );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'number & string, strictNumbering : 0, strictTyping : 1';
  // var got = _.equaler._equal( 123, '123', { strictNumbering : 0, strictTyping : 1 } );
  // var expected = false;
  // test.identical( got, expected );

  // test.case = 'number & string, strictNumbering : 1, strictTyping : 1';
  // var got = _.equaler._equal( 123, '123', { strictNumbering : 1, strictTyping : 1 } );
  // var expected = false;
  // test.identical( got, expected );

  /* strict bool - number */

  test.case = 'number & boolean, strictNumbering : 0, strictTyping : 0';
  debugger
  var got = _.equaler._equal( false, 0, { strictNumbering : 0, strictTyping : 0 } );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 0, strictTyping : 1';
  var got = _.equaler._equal( false, 0, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 1, strictTyping : 0';
  debugger
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
  var got = _.entityIdentical( strX1, strX1, _.mapExtend( null, options ) );
  test.identical( got, true );

  test.case = 'entities is two non empty same strings';
  var got = _.entityIdentical( strX2, strY2 );
  test.identical( got, true );

  test.case = 'string and object';
  var strX3 = '0';
  var strY3 = new String( '0' );
  var got = _.entityIdentical( strX3, strY3, _.mapExtend( null, options ) );
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
  var got = _.entityEquivalent( x1, y1, _.mapExtend( null, options ) );
  test.identical( got, true );

  test.case = ' practically equivalent numbers';
  var got = _.entityEquivalent( x2, y2, _.mapExtend( null, options ) );
  test.identical( got, true );

  test.case = ' not equivalent numbers';
  var got = _.entityEquivalent( x3, y3, _.mapExtend( null, options ) );
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

function entityContainsLoose( test )
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
  var got = _.entityContains( arrX1, arrY1 );
  test.identical( got, true );

  test.case = 'tests two non empty different arrays';
  var got = _.entityContains( arrX2, arrY2 );
  test.identical( got, false );

  test.case = 'one array contains other`s elements';
  var got = _.entityContains( arrX3, arrY3 );
  test.identical( got, true );

  test.case = 'one array contains other as element';
  var got = _.entityContains( arrX4, arrY4 );
  test.identical( got, false );

  test.case = 'nested arrays';
  var got = _.entityContains( arrX5, arrY5 );
  test.identical( got, true );

  /* object tests */

  test.case = 'tests two non empty objects : identical keys';
  var got = _.entityContains( objX1, objY1 );
  test.identical( got, true );

  test.case = 'tests two different objects : identical keys';
  var got = _.entityContains( objX2, objY2 );
  test.identical( got, false );

  test.case = 'tests nested objects : identical';
  var got = _.entityContains( objX3, objY3 );
  test.identical( got, true );

  test.case = 'one object contains elements of another';
  var got = _.entityContains( objX4, objY4 );
  test.identical( got, true );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.entityContains();
  });

  test.case = 'extra argument';
  test.shouldThrowErrorSync( function()
  {
    _.entityContains( strX3, strY3, options, '');
  });

}

//

function entityEqualMaps( test )
{

  test.case = 'descendant has no fields';
  var m1 = { a : 1 };
  var m2 = Object.create({ a : 1 });
  test.true( !_.entityIdentical( m1, m2 ) );
  test.true( _.entityEquivalent( m1, m2 ) );

  test.case = 'descendant has field';
  var m1 = { a : 1, b : 2 };
  var m2 = Object.create({ a : 1 });
  m2.b = 2;
  test.true( !_.entityIdentical( m1, m2 ) );
  test.true( _.entityEquivalent( m1, m2 ) );

}

//

function entityEqualStrings( test )
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
  var got = _.entityIdentical( new Date(), new Date() );
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

function entityIdenticalArgumentsArray( test )
{
  test.case = 'src1 - empty arguments array, src2 - arguments array';
  var src1 = _.argumentsArrayMake( [] );
  var src2 = _.argumentsArrayMake( [] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - empty array, src2 - arguments array';
  var src1 = [];
  var src2 = _.argumentsArrayMake( [] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, false );

  test.case = 'src1 - arguments array, src2 - arguments array';
  var src1 = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var src2 = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - array, src2 - arguments array';
  var src1 = [ 1, 2, 3 ];
  var src2 = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, false );
}

//

function entityEquivalentArgumentsArray( test )
{
  test.case = 'src1 - empty arguments array, src2 - arguments array';
  var src1 = _.argumentsArrayMake( [] );
  var src2 = _.argumentsArrayMake( [] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - empty array, src2 - arguments array';
  var src1 = [];
  var src2 = _.argumentsArrayMake( [] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - arguments array, src2 - arguments array';
  var src1 = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var src2 = _.argumentsArrayMake( [ 1, 2, 3 ] );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, true );

  test.case = 'src1 - array, src2 - arguments array';
  var src1 = [ 1, 2, 3 ];
  var src2 = _.argumentsArrayMake( [ 1, 2, 3 ] );
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
  var src1 = _.mapExtend( null, { a : 1 } );
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'proto and pure map';
  var expected = false;
  var src1 = { a : 1 };
  var src2 = _.mapExtend( null, { a : 1 } );
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'map and pure proto';
  var expected = false;
  var src1 = { a : 1 };
  var src2 = _.mapExtend( null, { a : 1 } );
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'pure proto and map';
  var expected = false;
  var src1 = _.mapExtend( null, { a : 1 } );
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
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'map and proto';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'proto and map';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = { a : 1 };
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'pure map and proto';
  var expected = true;
  var src1 = _.mapExtend( null, { a : 1 } );
  var src2 = { a : 1 };
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'proto and pure map';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = _.mapExtend( null, { a : 1 } );
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'map and pure proto';
  var expected = true;
  var src1 = { a : 1 };
  var src2 = _.mapExtend( null, { a : 1 } );
  src2 = Object.setPrototypeOf( {}, src2 );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'pure proto and map';
  var expected = true;
  var src1 = _.mapExtend( null, { a : 1 } );
  var src2 = { a : 1 };
  src1 = Object.setPrototypeOf( {}, src1 );
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

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
  test.identical( got, expected );

  test.case = 'sets are the same, simple';
  var src1 = new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'sets has duplicates, simple';
  var src1 = new Set( [ 1, { a : 3 }, 'str', '', null, null, [ 2 ], false, undefined, NaN, obj ] );
  var src2 = new Set( [ 1, [ 2 ], 'str', 'str', '', null, false, { a : 3 }, undefined, NaN, obj ] );
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'sets is not identical, simple';
  var src1 = new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var src2 = new Set( [ 1, [ 2 ], { a : 4 }, 'str', '', null, false, undefined, NaN, obj ] );
  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with identical sets';
  var expected = true;
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
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

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
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );
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
  var src1 = new Map();
  var src2 = new Map();
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps are the same, simple';
  var src1 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps has duplicates, simple';
  var src1 = new Map( [ [ 'one', 1 ], [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps is not identical, simple';
  var src1 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 0 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with identical maps';
  var src1 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'str', 'str' ], [ 'empty', '' ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var src2 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ], [ 'one', 1 ], [ 'array', [ 2 ] ] ] )
  };
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with notIdentical maps';
  var src1 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var src1 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'array', [ 1 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
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
  var src1 = new Map( [] );
  var src2 = new Map( [] );
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps are the same, simple, entityEquivalent';
  var src1 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = src1;
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps has duplicates, simple, entityEquivalent';
  var src1 = new Map( [ [ 'one', 1 ], [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'maps is not identical, simple, entityEquivalent';
  var src1 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var src2 = new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 0 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] );
  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with identical maps, entityEquivalent';
  var src1 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
  };
  var src2 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
  };
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'two maps with notIdentical maps, entityEquivalent';
  var src1 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var src1 =
  {
    map1 : new Map( [ [ 'one', 1 ], [ 'array', [ 2 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] ),
    map2 : new Map( [ [ 'one', 1 ], [ 'array', [ 1 ] ], [ 'map', { a : 3 } ], [ 'str', 'str' ], [ 'empty', '' ], [ 'null', null ], [ 'bool', false ], [ 'undefined', undefined ], [ 'NaN', NaN ], [ 'obj', obj ] ] )
  };
  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );
}

//

function entityEqualContainerType( test )
{
  try
  {

    let type = Object.create( null );
    type.name = 'ContainerForTest';
    type._while = _while;
    type._elementGet = _elementGet;
    type._elementSet = _elementSet;
    type._lengthGet = _lengthGet;
    type._is = _is;

    _.container.typeDeclare( type );

    test.description = 'entityEquivalent empty';
    var src1 = { eSet, eGet, elements : [ 1, 2, 3 ] };
    var src2 = { eSet, eGet, elements : [] };
    test.identical( _.entityEquivalent( src1, src2 ), false );
    test.identical( _.entityEquivalent( src2, src1 ), false );

    test.description = 'entityIdentical empty';
    var src1 = { eSet, eGet, elements : [ 1, 2, 3 ] };
    var src2 = { eSet, eGet, elements : [] };
    test.identical( _.entityIdentical( src1, src2 ), false );
    test.identical( _.entityIdentical( src2, src1 ), false );

    test.description = 'entityEquivalent identical';
    var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
    var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
    test.identical( _.entityEquivalent( src1, src2 ), true );
    test.identical( _.entityEquivalent( src2, src1 ), true );

    test.description = 'entityIdentical identical';
    var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
    var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
    test.identical( _.entityIdentical( src1, src2 ), true );
    test.identical( _.entityIdentical( src2, src1 ), true );

    _.container.typeUndeclare( 'ContainerForTest' );

    test.description = 'entityEquivalent';
    var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
    var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
    test.identical( _.entityEquivalent( src1, src2 ), false );
    test.identical( _.entityEquivalent( src2, src1 ), false );

    test.description = 'entityIdentical';
    var src1 = { eSet, eGet, elements : [ 1, 2, 3 ], field1 : 1 };
    var src2 = { eSet, eGet, elements : [ 1, 2, 3 ], field2 : 2 };
    test.identical( _.entityIdentical( src1, src2 ), false );
    test.identical( _.entityIdentical( src2, src1 ), false );

  }
  catch( err )
  {
    _.container.typeUndeclare( 'ContainerForTest' );
    throw err;
  }

  function _is( src )
  {
    return !!src && !!src.eGet;
  }

  function _elementSet( container, key, val )
  {
    return container.eSet( key, val );
  }

  function _elementGet( container, key )
  {
    return container.eGet( key );
  }

  function _lengthGet( container )
  {
    return container.elements.length;
  }

  function _while( container, onEach )
  {
    for( let k = 0; k < container.elements.length; k++ )
    onEach( container.elements[ k ], k, container );
  }

  function eSet( k, v )
  {
    this.elements[ k ] = v;
  }

  function eGet( k )
  {
    return this.elements[ k ];
  }

}

//

function entityContainsSimple( test ) /* qqq : extend the test routien by other contains* checks ( entityContainsAll, entityContainsAny... ), not increasing number of test cases */
{

  test.case = 'null - undefined';

  var expected = true;
  var got = _.entityContains( null, null );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( undefined, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( null, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( undefined, null );
  test.identical( got, expected );

  /* */

  test.case = 'number - number';

  var expected = true;
  var got = _.entityContains( 1, 1 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( 1, 1 + 1e-15 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( 0, 0 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( NaN, NaN );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( Infinity, Infinity );
  test.identical( got, expected );

  /* */

  test.case = 'number - not number';

  var expected = false;
  var got = _.entityContains( 1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, '0' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( NaN, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( Infinity, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, [ 0 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, { a : 0 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 0, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, [ 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, { a : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 3, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'String - String';

  var expected = true;
  var got = _.entityContains( '', '' );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( 'abc', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', 'abc' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'ab', 'c' );
  test.identical( got, expected );

  /* */

  test.case = 'String - not String';

  var expected = false;
  var got = _.entityContains( '', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', [ '' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '', function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '0', 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( '1', 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 'abc' ], '' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', [ 'abc' ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', { a : 'abc' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( 'abc', function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - RegExp';

  var expected = true;
  var got = _.entityContains( /(?:)/, /(?:)/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/iy, /abc/yi );
  test.identical( got, expected );

  // var expected = true;
  // var got = _.entityContains( new RegExp( 'abc' ), /abc/ );
  // test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/i, /abc/i );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entityContains( /(?:)/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /(?:)/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, [ /(?:)/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, { a : /(?:)/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /(?:)/, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, { x : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/, { ignoreCase : false, lastIndex : 0 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, [ /abc/ ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, { a : /abc/ } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - Routine';

  function func1(){};
  function func2(){};

  var expected = true;
  var got = _.entityContains( func1, func1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, func2 );
  test.identical( got, expected );

  /* */

  test.case = 'Routine - not Routine';

  var expected = false;
  var got = _.entityContains( func1, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( func1, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, [ func1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, { func1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( func1, function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Date - Date';

  var expected = true;
  var got = _.entityContains( new Date(), new Date() );
  test.identical( got, expected );

  var expected = false;
  var src1 = new Date();
  var src2 = new Date();
  src2.setFullYear( 1987 );
  var got = _.entityContains( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'Date - not Date';

  var expected = false;
  var got = _.entityContains( new Date(), '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( new Date(), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), [ new Date() ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), { a : new Date() } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new Date(), function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Array - Array';

  var expected = true;
  var got = _.entityContains( [], [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ 0 ], [ 0 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ 1 ], [ 1 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ undefined ], [ undefined ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ null ], [ null ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ [ 1, 2, 3 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ [ 1, 2, 3 ] ], [ [ 1, 2 ] ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ [ 1, 2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ [ 1, 3 ] ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ null ], [ undefined ] );
  test.identical( got, expected );

  /* */

  test.case = 'Array - not Array';

  var expected = false;
  var got = _.entityContains( [], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 1 ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 1 ], { 0 : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 1 ], { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [], function(){} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entityContains( [ '1' ], '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ undefined ], undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ null ], null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ NaN ], NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 0 ], 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 1 ], 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ new F32x( 3 ) ], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ /(?:)/ ], /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ function(){} ], function(){} );
  test.identical( got, expected );

  /* */

  test.case = 'Map - Map';

  var expected = true;
  var got = _.entityContains( {}, {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : 0 }, { a : 0 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : 1, b : 1 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : 1 }, { a : 1, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : undefined, b : 1 }, { a : undefined } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : undefined }, { a : undefined, b : 1 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : undefined }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : null }, { a : null } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : { b : 1 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : { b : 1 } }, { a : { b : 1, c : 2 } } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : { b : 1, c : 2 } }, { a : { b : 1 } } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : { b : 1, c : 3 } }, { b : 1, c : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : null }, { a : undefined } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : undefined }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, { a : undefined } );
  test.identical( got, expected );

  /* */

  test.case = 'Map - not Map';

  var expected = false;
  var got = _.entityContains( {}, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( function(){}, function(){} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, function(){} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( function(){}, {} );
  test.identical( got, expected );

  /* */

  var expected = false;
  var got = _.entityContains( { a : '1' }, '1' );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : undefined }, undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : null }, null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : NaN }, NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : 0 }, 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : 1 }, 1 );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : {} }, {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : new Date() }, new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : new F32x( 3 ) }, new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : /(?:)/ }, /(?:)/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : function(){} }, function(){} );
  test.identical( got, expected );

  var expected = false;
  var src = { a : function(){} };
  function src02(){};
  var got = _.entityContains( src, src02 );
  test.identical( got, expected );

  var expected = false;
  var src = { a : function(){} };
  function src03(){};
  src03.a = src.a;
  var got = _.entityContains( src, src03 );
  test.identical( got, expected );

  var expected = true;
  function src04(){};
  src04.a = '13';
  var src2 = {};
  var got = _.entityContains( src04, src2 );
  test.identical( got, expected );

  var expected = true;
  function src05(){};
  src05.a = '13';
  var src2 = { a : '13' };
  var got = _.entityContains( src05, src2 );
  test.identical( got, expected );

  /* qqq : add typed / raw / node / view buffers tests */

}

//

function entityContainsMap( test )
{

  /* */

  test.case = 'empty';
  var ins1 = {};
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), true );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  /* */

  test.case = 'ins1.b:0';
  var ins1 = { b : '0' };
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  /* */

  test.case = 'ins1.b:0 ins2.b:0';
  var ins1 = { b : '0' };
  var ins2 = { b : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), true );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  test.identical( ins1, ins2 ); /* qqq : add similar test checks to other cases */
  test.identical( ins2, ins1 );
  test.equivalent( ins1, ins2 );
  test.equivalent( ins2, ins1 );
  test.contains( ins1, ins2 );
  test.contains( ins2, ins1 );
  test.containsAll( ins1, ins2 );
  test.containsAll( ins2, ins1 );
  test.containsAny( ins1, ins2 );
  test.containsAny( ins2, ins1 );
  test.containsOnly( ins1, ins2 );
  test.containsOnly( ins2, ins1 );

  /* */

  test.case = 'ins1.b:1 ins2.b:2';
  var ins1 = { b : '1' };
  var ins2 = { b : '2' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  /* */

  test.case = 'ins1.a:1 ins2.b:2';
  var ins1 = { a : '1' };
  var ins2 = { b : '2' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  /* */

  test.case = 'ins1.a:1 ins1.b:0 ins1.c:1 ins2.b:0';
  var ins1 = { a : '1', b : '0', c : '1' };
  var ins2 = { b : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.a:0 ins1.b:1 ins1.c:1 ins2.a:0';
  var ins1 = { a : '0', b : '1', c : '1' };
  var ins2 = { a : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.a:1 ins1.b:1 ins1.c:0 ins2.c:0';
  var ins1 = { a : '1', b : '1', c : '0' };
  var ins2 = { c : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

}

//

function entityContainsObject( test )
{

  /* */

  test.case = 'empty';

  var ins1 = new Obj1({});
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.b:0';
  var ins1 = new Obj1({ b : '0' });
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = { b : '0' };
  var ins2 = new Obj1({});
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  /* */

  test.case = 'ins1.b:0 ins2.b:0';
  var ins1 = new Obj1({ b : '0' });
  var ins2 = { b : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.b:1 ins2.b:2';
  var ins1 = new Obj1({ b : '1' });
  var ins2 = { b : '2' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.a:1 ins2.b:2';
  var ins1 = new Obj1({ a : '1' });
  var ins2 = { b : '2' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.a:1 ins1.b:0 ins1.c:1 ins2.b:0';
  var ins1 = new Obj1({ a : '1', b : '0', c : '1' });
  var ins2 = { b : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = { a : '1', b : '0', c : '1' };
  var ins2 = new Obj1({ b : '0' });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.a:0 ins1.b:1 ins1.c:1 ins2.a:0';
  var ins1 = new Obj1({ a : '0', b : '1', c : '1' });
  var ins2 = { a : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = { a : '0', b : '1', c : '1' };
  var ins2 = new Obj1({ a : '0' });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.a:1 ins1.b:1 ins1.c:0 ins2.c:0';
  var ins1 = new Obj1({ a : '1', b : '1', c : '0' });
  var ins2 = { c : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = { a : '1', b : '1', c : '0' };
  var ins2 = new Obj1({ c : '0' });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  function Obj1( o )
  {
    _.mapExtend( this, o );
    return this;
  }

}

//

function entityContainsObjectWithIteratorAndMap( test )
{

  /* */

  test.case = 'empty';

  var ins1 = new Obj1({});
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.b:0';
  var ins1 = new Obj1({ elements : [ 'b' ] });
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = { b : '0' };
  var ins2 = new Obj1({ elements : [ 'b' ] });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'ins1.b:0 ins2.b:0';
  var ins1 = new Obj1({ b : '0' });
  var ins2 = { b : '0' };
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

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

  function Obj1( o )
  {
    _.mapExtend( this, o );
    this[ Symbol.iterator ] = _iterate;
    return this;
  }

  /* */

}

//

function entityContainsObjectWithEqualerAndIterator( test )
{

  /* */

  test.case = 'iterating:1 equaling:0';

  var ins1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 2 ], withIterator : 1 });
  var ins2 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 3 ], withIterator : 1 });
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), true );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  var ins1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 2 ], withEqualer : 1 });
  var ins2 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 3 ], withEqualer : 1 });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 2 ], withIterator : 1, withEqualer : 1 });
  var ins2 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 1, 3 ], withIterator : 1, withEqualer : 1 });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  /* */

  test.case = 'iterating:0 equaling:1';

  var ins1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 2, 3 ], withIterator : 1 });
  var ins2 = new Obj1({ elements : [ 0, 2 ], elements2 : [ 2, 3 ], withIterator : 1 });
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );
  test.identical( _.entityContainsAll( ins1, ins2 ), false );
  test.identical( _.entityContainsAll( ins2, ins1 ), false );
  test.identical( _.entityContainsAny( ins1, ins2 ), false );
  test.identical( _.entityContainsAny( ins2, ins1 ), false );
  test.identical( _.entityContainsOnly( ins1, ins2 ), false );
  test.identical( _.entityContainsOnly( ins2, ins1 ), false );
  test.identical( _.entityContainsNone( ins1, ins2 ), false );
  test.identical( _.entityContainsNone( ins2, ins1 ), false );

  var ins1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 2, 3 ], withEqualer : 1 });
  var ins2 = new Obj1({ elements : [ 0, 2 ], elements2 : [ 2, 3 ], withEqualer : 1 });
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), true );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

  var ins1 = new Obj1({ elements : [ 0, 1 ], elements2 : [ 2, 3 ], withIterator : 1, withEqualer : 1 });
  var ins2 = new Obj1({ elements : [ 0, 2 ], elements2 : [ 2, 3 ], withIterator : 1, withEqualer : 1 });
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );
  test.identical( _.entityContainsAll( ins1, ins2 ), true );
  test.identical( _.entityContainsAll( ins2, ins1 ), true );
  test.identical( _.entityContainsAny( ins1, ins2 ), true );
  test.identical( _.entityContainsAny( ins2, ins1 ), true );
  test.identical( _.entityContainsOnly( ins1, ins2 ), true );
  test.identical( _.entityContainsOnly( ins2, ins1 ), true );
  test.identical( _.entityContainsNone( ins1, ins2 ), true );
  test.identical( _.entityContainsNone( ins2, ins1 ), true );

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
    if( !_.longIdentical( it.srcEffective.elements2, it.srcEffective2.elements2 ) )
    return false;
    return true;
  }

  /* */

  function Obj1( o )
  {
    _.mapExtend( this, o );
    if( o.withIterator )
    this[ Symbol.iterator ] = _iterate;
    if( o.withEqualer )
    this[ Symbol.for( 'equalAre' ) ] = _equalAre;
    return this;
  }

  /* */

}

// --
//
// --

function comparePrimitiveAndNon( test )
{

  /* */

  test.case = 'map pure';
  var ins1 = 3;
  var ins2 = Object.create( null );
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );

  /* */

  test.case = 'map standanrd';
  var ins1 = 3;
  var ins2 = {};
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );

  /* */

  test.case = 'array';
  var ins1 = 3;
  var ins2 = [ 1, 2, 3 ];
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );

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
  test.identical( _.entityContains( src1, src2 ), true ); /* qqq : find all test cases having such checks and add missing entityContains* checks */
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'zero';
  var src1 = null;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'empty str';
  var src1 = null;
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'zero';
  var src1 = undefined;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'empty str';
  var src1 = undefined;
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'null';
  var src1 = '';
  var src2 = null;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'zero';
  var src1 = '';
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'null';
  var src1 = 0;
  var src2 = null;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'empty string';
  var src1 = 0;
  var src2 = '';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

}

//

function compareDate( test )
{

  /* */

  test.case = 'same dates'
  var expected = true;
  var ins1 = new Date( 1995, 11, 17, 3, 24, 0 );
  var ins2 = new Date( 1995, 11, 17, 3, 24, 0 );
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );

  /* */

  test.case = 'different dates'
  var expected = true;
  var ins1 = new Date( 1995, 11, 17, 3, 24, 0 );
  var ins2 = new Date( 1995, 11, 17, 3, 24, 1 );
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );

  /* */

}

//

function compareRegexp( test )
{

  /* */

  test.case = 'same regexps'
  var expected = true;
  var ins1 = /some \n regexp/;
  var ins2 = /some \n regexp/;
  test.identical( _.entityIdentical( ins1, ins2 ), true );
  test.identical( _.entityIdentical( ins2, ins1 ), true );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );

  /* */

  test.case = 'different regexps'
  var expected = true;
  var ins1 = /some \n regexp/;
  var ins2 = /some \n regexp2/;
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), false );
  test.identical( _.entityEquivalent( ins2, ins1 ), false );
  test.identical( _.entityContains( ins1, ins2 ), false );
  test.identical( _.entityContains( ins2, ins1 ), false );

  /* */

  test.case = 'different flags'
  var expected = true;
  var ins1 = /some \n regexp/i;
  var ins2 = /some \n regexp/;
  test.identical( _.entityIdentical( ins1, ins2 ), false );
  test.identical( _.entityIdentical( ins2, ins1 ), false );
  test.identical( _.entityEquivalent( ins1, ins2 ), true );
  test.identical( _.entityEquivalent( ins2, ins1 ), true );
  test.identical( _.entityContains( ins1, ins2 ), true );
  test.identical( _.entityContains( ins2, ins1 ), true );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'Infinity - NaN';
  var src1 = Infinity;
  var src2 = NaN;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'Infinity ~ -Infinity';
  var src1 = Infinity;
  var src2 = -Infinity;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'number ~ big int';
  var src1 = 3;
  var src2 = 3n;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  debugger;
  test.identical( _.entityEquivalent( src1, src2 ), true );
  debugger;
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.et( src1, src2 );
  test.et( src2, src1 );

  /* xxx qqq : improve diff of big ints */

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'empty ~ not empty';
  var src1 = '';
  var src2 = 'abc';
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'false ~ 0';
  var src1 = false;
  var src2 = 0;
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'map.standard empty';
  var src1 = {};
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'map.standard not empty';
  var src1 = { a : 1 };
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  test.case = 'hashmap';
  var src1 = new HashMap();
  var src2 = src1;
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );
  test.contains( src1, src2 );
  test.contains( src2, src1 );

  /* */

  function Obj1( o )
  {
    _.mapExtend( this, o );
    return this;
  }

}

//

function compareUndefinedElement( test )
{

  /* */

  test.case = 'map.standard, null ~ undefined';
  var src1 = { a : null };
  var src2 = { a : undefined };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'map.standard, no ~ undefined';
  var src1 = {};
  var src2 = { a : undefined };
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'array, null ~ undefined';
  var src1 = [ null ];
  var src2 = [ undefined ];
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'array, no ~ undefined';
  var src1 = [];
  var src2 = [ undefined ];
  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'array length:1, no ~ undefined';
  var src1 = new Array( 1 );
  var src2 = [ undefined ];
  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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

  test.case = 'map.standard, not equal field';

  var src1 = { val : 1 };
  var src2 = { val : 2 };

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'map.standard, equal field';

  var src1 = { val : 3 };
  var src2 = { val : 3 };

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

}

//

function compareObjectsWithEqualAre( test )
{

  /* */

  test.case = 'map.standard, not equal field';

  var src1 = { val : 1 };
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = { val : 2 };
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'map.standard, equal field';

  var src1 = { val : 3, val2 : 1 };
  src1[ Symbol.for( 'equalAre' ) ] = _equalAre;
  var src2 = { val : 3, val2 : 2 };
  src2[ Symbol.for( 'equalAre' ) ] = _equalAre;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  function _equalAre( it )
  {
    // console.log( `_equalAre ${it.src.val} ${it.src2.val}` );
    return it.src.val === it.src2.val;
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  function _equalAre( it )
  {
    return it.srcEffective.val === it.srcEffective2.val;
  }

  /* */

  function _equalSecondCoerceFromNumber( it )
  {
    if( _.numberIs( it.srcEffective ) )
    it.srcEffective = new FromArray( it.srcEffective, 0 );
    if( _.numberIs( it.srcEffective2 ) )
    it.srcEffective2 = new FromArray( it.srcEffective2, 0 );
    return true;
  }

  /* */

  function _equalSecondCoerceFromArray( it )
  {
    if( _.longIs( it.srcEffective ) )
    it.srcEffective = new FromArray( it.srcEffective[ 0 ], 0 );
    if( _.longIs( it.srcEffective2 ) )
    it.srcEffective2 = new FromArray( it.srcEffective2[ 0 ], 0 );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
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
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'object ~ map';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = { elements : [ 1, 2, 3 ], val2 : 1 };

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

  test.case = 'object ~ array';

  var src1 = new InstanceWithStringTag( [ 1, 2, 3 ], 1 );
  var src2 = [ 1, 2, 3 ];

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
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
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
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

function compareObjectPrototyped1( test )
{

  // xxx
  // test.case = 'all keys in srcMap exists in screenMap - map';
  // var srcMap = Object.create( { d : 'name', c : 33 } );
  // srcMap.a = 'abc';
  // srcMap.b = undefined;
  // var screenMap = { a : 13, b : 77, c : 3, d : 'name' };
  // var got = _.mapOnlyComplementing_( srcMap, screenMap );
  // var expected = Object.create( { d : 'name', c : 33 } );
  // expected.a = 'abc';
  // expected.b = undefined;
  // expected.c = 33;
  // expected.d = 'name';
  // test.identical( got, expected );
  // test.true( got === srcMap );
  // test.identical( srcMap, { a : 'abc', b : undefined, c : 33, d : 'name' } );
  // test.identical( screenMap, { a : 13, b : 77, c : 3, d : 'name' } );

  /* */

  test.case = 'object ~ object, identical';

  var src1 = Object.create( { d : 'name', c : 33 } );
  src1.a = 'abc';
  src1.b = undefined;
  var src2 = Object.create( { d : 'name', c : 33 } );
  src2.a = 'abc';
  src2.b = undefined;

  test.identical( _.entityIdentical( src1, src2 ), true );
  test.identical( _.entityIdentical( src2, src1 ), true );
  test.identical( _.entityEquivalent( src1, src2 ), true );
  test.identical( _.entityEquivalent( src2, src1 ), true );
  test.identical( _.entityContains( src1, src2 ), true );
  test.identical( _.entityContains( src2, src1 ), true );
  test.identical( src1, src2 );
  test.identical( src2, src1 );
  test.equivalent( src1, src2 );
  test.equivalent( src2, src1 );

  /* */

  test.case = 'object ~ object, identical';

  var src1 = Object.create( { d : 'name', c : 31 } );
  src1.a = 'abc';
  src1.b = undefined;
  var src2 = Object.create( { d : 'name', c : 32 } );
  src2.a = 'abc';
  src2.b = undefined;

  test.identical( _.entityIdentical( src1, src2 ), false );
  test.identical( _.entityIdentical( src2, src1 ), false );
  test.identical( _.entityEquivalent( src1, src2 ), false );
  test.identical( _.entityEquivalent( src2, src1 ), false );
  test.identical( _.entityContains( src1, src2 ), false );
  test.identical( _.entityContains( src2, src1 ), false );
  test.ni( src1, src2 );
  test.ni( src2, src1 );
  test.ne( src1, src2 );
  test.ne( src2, src1 );

  /* */

}

//

function compareObjectPrototyped1( test )
{

  Object.setPrototypeOf( Escape.prototype, null );
  Escape.prototype = Object.create( null );
  Escape.prototype[ _.entity.equalAreSymbol ] = equalAre;
  Escape.prototype[ _.entity.iteratorSymbol ] = iterate;
  Escape.prototype.constructor = Escape;

  /* */

  function equalAre( it )
  {
    let self = this;

    _.assert( arguments.length === 1 );

    if( !it.srcEffective )
    return end( false );
    if( !it.srcEffective2 )
    return end( false );
    if( !it.srcEffective instanceof _.Escape )
    return end( false );
    if( !it.srcEffective2 instanceof _.Escape )
    return end( false );

    debugger;

    if( it.srcEffective.val === it.srcEffective2.val )
    return end( true );

    if( !( it.srcEffective.val instanceof _.Escape ) )
    return end( false );
    if( !( it.srcEffective.val instanceof _.Escape ) )
    return end( false );

    return true;

    function end( result )
    {
      it.result = result;
      it.continue = false;
      return result;
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
      let result = Object.create( null ); debugger;
      result.done = this.index === 1;
      if( result.done )
      return result;
      result.value = this.instance.val;
      this.index += 1;
      return result;
    }

  }

  /* */

  function Escape( val )
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
  test.identical( onUpPaths, [ '/', '/0', '/1' ] );
  test.identical( onDownPaths, [ '/0', '/1', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1, 3 ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1, 3 ], [ 1 ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/0' ] );
  test.identical( onDownPaths, [ '/0', '/' ] );

  /* */

  test.case = 'trivial map';

  clean();
  var expected = true;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1, b : 3 }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/b' ] );
  test.identical( onDownPaths, [ '/a', '/b', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : 1 }, { a : 1, b : 3 }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : 1, b : 3 }, { a : 1 }, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } }, opt  );
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
  var got = _.entityIdentical( src1, src2, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onScalar', '/name', '/takingArguments', '/takingArguments/0', '/takingArguments/1' ] );
  test.identical( onDownPaths, [ '/onScalar', '/name', '/takingArguments/0', '/takingArguments/1', '/takingArguments', '/' ] );

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
  var got = _.entityIdentical( src1, src2, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onScalar' ] );
  test.identical( onDownPaths, [ '/onScalar', '/' ] );

  /* */

  test.case = 'trivial mixed';

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/0', '/b', '/b/c', '/b/c/0', '/b/c/0/d', '/b/c/0/e', '/b/c/0/e/0', '/b/c/0/e/1' ] );
  test.identical( onDownPaths, [ '/a/0', '/a', '/b/c/0/d', '/b/c/0/e/0', '/b/c/0/e/1', '/b/c/0/e', '/b/c/0', '/b/c', '/b', '/' ] );

  clean();
  var a = { e : [ 1, 3 ] }
  var b = { e : [ 1, 4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/0', '/e/1' ] );
  test.identical( onDownPaths, [ '/e/0', '/e/1', '/e', '/' ] );

  clean();
  var a = { e : [ 1, 3, 4 ] }
  var b = { e : [ 1, 4, 4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/0', '/e/1' ] );
  test.identical( onDownPaths, [ '/e/0', '/e/1', '/e', '/' ] );

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/0', '/b', '/b/c', '/b/c/0', '/b/c/0/d', '/b/c/0/e', '/b/c/0/e/0', '/b/c/0/e/1' ] );
  test.identical( onDownPaths, [ '/a/0', '/a', '/b/c/0/d', '/b/c/0/e/0', '/b/c/0/e/1', '/b/c/0/e', '/b/c/0', '/b/c', '/b', '/' ] );

  /* */

  test.case = 'cycle';

  clean();
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : { x : 1, y : null }, y : null }
  a.x.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = false;
  debugger;
  _global_.debugger = 1;
  var got = _.entityIdentical( a, b, opt  );
  debugger;
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x' ] );
  test.identical( onDownPaths, [ '/x', '/' ] );

  clean();
  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/x', '/y' ] );
  test.identical( onDownPaths, [ '/x', '/y', '/' ] );

  clean();
  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
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
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/Instances', '/Instances/0', '/Instances/0/f1', '/Instances/0/Instances' ] );
  test.identical( onDownPaths, [ '/f1', '/Instances/0/f1', '/Instances/0/Instances', '/Instances/0', '/Instances', '/' ] );

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
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/Instances', '/Instances/0', '/Instances/0/f1', '/Instances/0/Instances' ] );
  test.identical( onDownPaths, [ '/f1', '/Instances/0/f1', '/Instances/0/Instances', '/Instances/0', '/Instances', '/' ] );

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
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/Instances', '/Instances/0' ] );
  test.identical( onDownPaths, [ '/f1', '/Instances/0', '/Instances', '/' ] );

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

function entityContainsCycled( test )
{
  var c = this;

  /* */

  test.case = 'trivial array';

  var expected = true;
  var got = _.entityContains( [ 1, 3 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 1 ], [ 1, 3 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ 1, 3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ [ 1, 2 ] ], [ [ 1, 2, 3 ] ] );
  test.identical( got, expected );

  /* */

  test.case = 'trivial map';

  var expected = true;
  var got = _.entityContains( { a : 1, b : 3 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : 1 }, { a : 1, b : 3 } );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( { a : 1, b : 3 }, { a : 1 } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : { a : 1, b : 2 } }, { a : { a : 1, b : 2, c : 3 } } );
  test.identical( got, expected );

  /* */

  test.case = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { e : [ 1, 3, 4 ] }
  var b = { e : [ 1, 4, 4 ] }
  var expected = false;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { e : [ 1, 4, 3 ] }
  var b = { e : [ 1, 4 ] }
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1, 4 ] } ] } }
  var expected = false;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'cycle';

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.x = a;
  var b = { x : 1, y : null }
  b.x = b;
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : { x : 1, y : null } }
  a.y.y = a;
  var b = { x : 1, y : null }
  b.y = b;
  var expected = false;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { x : 1, y : null }
  a.y = a;
  var b = { x : 1, y : { x : 1, y : null } }
  b.y.y = b;
  var expected = false;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

}

//

function entityEqualNonRecursive( test )
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

  // test.identical( got, {} );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

  /* */

  test.case = 'arrays';

  var got = _.entityDiff( [ 1, 2, 3 ], [ 1, 2, 4 ] );
  var expected =
`at /2
- src1 :
  [ 1, 2, 3 ]
- src2 :
  [ 1, 2, 4 ]
- difference :
  [ 1, 2, *`;
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

  /* */

  test.case = 'got : _.property.all({}), expected : {}, without path';

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
    _.property.all({}),
    {},
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

  /* */

  test.case = 'got : {}, expected : _.property.all({}), without path';

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
    _.property.all({})
  ]

  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs,
    accuracy : null,
  });
  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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
  debugger;
  var got = _.entityDiffExplanation
  ({
    name1 : '- got',
    name2 : '- expected',
    srcs : [ obj1, obj2 ],
    accuracy : null,
  });

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

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

  test.identical( _.strStrip( got ), _.strStrip( expected ) );

}

// --
// declare
// --

let Self =
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
    _entityEqualLoose,
    entityIdenticalLoose,
    entityEquivalentLoose,
    entityContainsLoose,
    entityEqualMaps, /* qqq : extend tests */
    entityEqualStrings,

    entityIdenticalSimple,
    entityIdenticalArgumentsArray,
    entityEquivalentArgumentsArray,
    entityIdenticalProto,
    entityEquivalentProto,
    entityIdenticalBuffers,
    entityEquivalentBuffers,
    entityIdenticalSet,
    entityEquivalentSet,
    entityIdenticalHashMap,
    entityEquivalentHashMap,
    entityEqualContainerType,

    entityContainsSimple,
    entityContainsMap,
    entityContainsObject,
    entityContainsObjectWithIteratorAndMap,
    // entityContainsObjectWithIteratorAndObjectWithIterator, /* qqq : implement */
    // entityContainsObjectWithIteratorAndLongWithIterator, /* qqq : implement */
    entityContainsObjectWithEqualerAndIterator,

    comparePrimitiveAndNon,
    compareNull,
    compareUndefined,
    compareEmptyString,
    compareZero,
    compareDate,
    compareRegexp,
    compareString,
    compareNumber,
    compareBool,
    compareSameInstance,
    compareUndefinedElement,
    compareObjectsWithoutEqualAre,
    compareObjectsWithEqualAre,
    compareObjectsWithSecondCoerce,
    compareObjectsWithIterator,
    compareObjectPrototyped1,
    compareObjectWithIteratorAndEqual,

    entityIdenticalCycled,
    entityIdenticalCycledWithOptions,
    entityEquivalentCycled,
    entityContainsCycled,
    entityEqualNonRecursive,

    entityDiffLoose,
    entityDiffExplanationBasic,
    entityDiffExplanationString,
    entityDiffExplanationMap,
    entityDiffExplanationMapDiffProto

    /* qqq : research: what should be covered in the first place */

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
