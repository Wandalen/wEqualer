( function _Equaler_test_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  var _ = require( '../../Tools.s' );

  _.include( 'wTesting' );
  _.include( 'wStringer' );

  require( '../l6/Equaler.s' );

}

var _global = _global_;
var _ = _global_.wTools;

// --
// tests
// --

function trivial( test )
{

  var map1 = { a : 0, e : { c : 2, d : 3 } };
  var map2 = { a : 0, e : { c : 2, d : 3 } };
  var map3 = { a : 0, e : { d : 4 } };

  debugger;
  var got = _.entityIdentical( map1, map2 );
  test.identical( got, true );

  debugger;
  var got = _.entityIdentical( map1, map3 );
  test.identical( got, false );

  debugger;
}

//

function entityIdenticalSimple( test )
{

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
  var got = _.entityIdentical( '', new RegExp( '' ) );
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
  var got = _.entityIdentical( new RegExp( '' ), new RegExp( '' ) );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( /abc/iy, /abc/yi );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( new RegExp( 'abc' ), /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityIdentical( new RegExp( 'abc','i' ), /abc/i );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /abc/, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), [] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), [ new RegExp( '' ) ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), { a : new RegExp( '' ) } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( new RegExp( '' ), function(){} );
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

  var func1 = function func(){};
  var func2 = function func(){};

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
  var got = _.entityIdentical( [ [ 1,2,3 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2,3 ] ], [ [ 1,2 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,3 ] ], [ 1,3 ] );
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
  var got = _.entityIdentical( [], new RegExp( '' ) );
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
  var got = _.entityIdentical( [ new RegExp( '' ) ], new RegExp( '' ) );
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
  var got = _.entityIdentical( {}, new RegExp( '' ) );
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
  var got = _.entityIdentical( { a : new RegExp( '' ) }, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( { a : function(){} }, function(){} );
  test.identical( got, expected );

  /* qqq : add typed / raw / node / view buffers tests */

}

//

function entityContainsSimple( test )
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

  var expected = false;
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
  var got = _.entityContains( '', new RegExp( '' ) );
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
  var got = _.entityContains( new RegExp( '' ), new RegExp( '' ) );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/, /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( /abc/iy, /abc/yi );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( new RegExp( 'abc' ), /abc/ );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( new RegExp( 'abc','i' ), /abc/i );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/i, /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/i, /abc/yi );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), /abc/ );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /abc/, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( /ab/, /c/ );
  test.identical( got, expected );

  /* */

  test.case = 'RegExp - not RegExp';

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), undefined );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), null );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), NaN );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), 0 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), 1 );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), [] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( new RegExp( '' ), {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), [ new RegExp( '' ) ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), { a : new RegExp( '' ) } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), { a : '' } );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( new RegExp( '' ), function(){} );
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

  var func1 = function func(){};
  var func2 = function func(){};

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
  var got = _.entityContains( [ [ 1,2,3 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ [ 1,2,3 ] ], [ [ 1,2 ] ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ [ 1,2 ] ], [ [ 1 ] ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ [ 1,3 ] ], [ 1,3 ] );
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

  var expected = true;
  var got = _.entityContains( [], {} );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ 1 ], {} );
  test.identical( got, expected );

  var expected = true;
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
  var got = _.entityContains( [], new RegExp( '' ) );
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

  var expected = true;
  var got = _.entityContains( [ {} ], {} );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ new Date() ], new Date() );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ new F32x( 3 ) ], new F32x( 3 ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ new RegExp( '' ) ], new RegExp( '' ) );
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
  var got = _.entityContains( {}, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( {}, function(){} );
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
  var got = _.entityContains( { a : new RegExp( '' ) }, new RegExp( '' ) );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( { a : function(){} }, function(){} );
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
    var src1 = BufferNode.alloc( 10 );
    var src2 = BufferNode.alloc( 10 );
    var expected = true;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );

    var src1 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src2 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var expected = true;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );

    test.case = 'src1 = src2, Buffer, simple';
    var src1 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src2 = src1;
    var expected = true;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );

    test.case = 'not identical Buffer, simple';
    var src1 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src2 = BufferNode.from( [ 0, 2, 3, 4, 5 ] );
    var expected = false;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );
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
    min : new F64x([ NaN,NaN ]),
    max : new F64x([ NaN,NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN,NaN ]),
    max : new F64x([ NaN,NaN ]),
  };
  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'map with different BufferTyped';
  var src1 =
  {
    min : new F32x([ NaN,NaN ]),
    max : new F32x([ NaN,NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN,NaN ]),
    max : new F64x([ NaN,NaN ]),
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
    var src1 = BufferNode.alloc( 10 );
    var src2 = BufferNode.alloc( 10 );
    var expected = true;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );

    var src1 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src2 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var expected = true;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );

    test.case = 'src1 = src2, Buffer, simple';
    var src1 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src2 = src1;
    var expected = true;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );

    test.case = 'not identical Buffer, simple';
    var src1 = BufferNode.from( [ 1, 2, 3, 4, 5 ] );
    var src2 = BufferNode.from( [ 0, 2, 3, 4, 5 ] );
    var expected = false;
    var got = _.entityIdentical( src1, src2 );
    test.identical( got, expected );
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
    min : new F64x([ NaN,NaN ]),
    max : new F64x([ NaN,NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN,NaN ]),
    max : new F64x([ NaN,NaN ]),
  };
  var expected = true;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  test.case = 'map with different BufferTyped';
  var src1 =
  {
    min : new F32x([ NaN,NaN ]),
    max : new F32x([ NaN,NaN ]),
  };
  var src2 =
  {
    min : new F64x([ NaN,NaN ]),
    max : new F64x([ NaN,NaN ]),
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
  var src1 = new Set( [ 1, [ 2 ], { a : 3 }, 'str', '', null, false, undefined, NaN, obj ] );
  var src2 = new Set( [ 1, [ 2 ], { a : 4 }, 'str', '', null, false, undefined, NaN, obj ] );
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
    set2 : new Set( [ undefined, [ 2 ], false, 'str', 1, [ 3, 4 ], { a : 3 }, { b : 4, c : 5 }, , '', null, NaN, obj ] ),
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
    set1 : new Set( [ '', null, false, undefined, NaN, obj, 1, [ 2 ], { a : 3 }, 'str',  ] ),
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
    set1 : new Set( [ '', null, false, undefined, NaN, obj, 1, [ 2 ], { a : 3 }, 'str',  ] ),
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

function entityIdenticalCycled( test )
{
  var c = this;

  test.case = 'trivial array';

  var expected = true;
  var got = _.entityIdentical( [ 1,3 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ 1,3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
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

  var onAtom = function(){};
  var src1 =
  {
    onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = true;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  var onAtom = function(){};
  var src1 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = false;
  var got = _.entityIdentical( src1, src2 );
  test.identical( got, expected );

  test.case = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
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
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.case = 'mixed cycle - different cycle a';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

  test.case = 'mixed cycle - different cycle b';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  binstances.push( b );

  var expected = false;
  var got = _.entityIdentical( a, b );
  test.identical( got, expected );

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
    // debugger;
    // return !it.result ? _.dont : it.result;
    if( !it.result )
    it.continue = false;
  }

  /* */

  var onDownPaths = [];
  function onDown( e, k, it )
  {
    onDownPaths.push( it.path );
    // if( !it.result )
    // it.continue = false;
    // return !it.result ? _.dont : it.result;
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
  var got = _.entityIdentical( [ 1,3 ], [ 1,3 ], opt );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/0', '/1' ] );
  test.identical( onDownPaths, [ '/0', '/1', '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1 ], [ 1,3 ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ 1,3 ], [ 1 ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/' ] );
  test.identical( onDownPaths, [ '/' ] );

  clean();
  var expected = false;
  var got = _.entityIdentical( [ [ 1,2 ] ], [ [ 1,2,3 ] ], opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/0' ] );
  test.identical( onDownPaths, [ '/0', '/' ] );

  test.case = 'trivial map'; /* */

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

  test.case = 'trivial mixed with routine'; /* */

  var onAtom = function(){};
  var src1 =
  {
    onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  clean();
  var expected = true;
  var got = _.entityIdentical( src1, src2, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onAtom', '/name', '/takingArguments', '/takingArguments/0', '/takingArguments/1' ] );
  test.identical( onDownPaths, [ '/onAtom', '/name', '/takingArguments/0', '/takingArguments/1', '/takingArguments', '/' ] );

  var onAtom = function(){};
  var src1 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  clean();
  var expected = false;
  var got = _.entityIdentical( src1, src2, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/onAtom' ] );
  test.identical( onDownPaths, [ '/onAtom', '/' ] );

  test.case = 'trivial mixed'; /* */

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/0', '/b', '/b/c', '/b/c/0', '/b/c/0/d', '/b/c/0/e', '/b/c/0/e/0', '/b/c/0/e/1' ] );
  test.identical( onDownPaths, [ '/a/0', '/a', '/b/c/0/d', '/b/c/0/e/0', '/b/c/0/e/1', '/b/c/0/e', '/b/c/0', '/b/c', '/b', '/' ] );

  clean();
  var a = { e : [ 1,3 ] }
  var b = { e : [ 1,4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/0', '/e/1' ] );
  test.identical( onDownPaths, [ '/e/0', '/e/1', '/e', '/' ] );

  clean();
  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/e', '/e/0', '/e/1' ] );
  test.identical( onDownPaths, [ '/e/0', '/e/1', '/e', '/' ] );

  clean();
  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/a', '/a/0', '/b', '/b/c', '/b/c/0', '/b/c/0/d', '/b/c/0/e', '/b/c/0/e/0', '/b/c/0/e/1' ] );
  test.identical( onDownPaths, [ '/a/0', '/a', '/b/c/0/d', '/b/c/0/e/0', '/b/c/0/e/1', '/b/c/0/e', '/b/c/0', '/b/c', '/b', '/' ] );

  test.case = 'cycle'; /* */

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
  var got = _.entityIdentical( a, b, opt  );
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

  test.case = 'mixed cycle - equal'; /* */

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/instances', '/instances/0', '/instances/0/f1', '/instances/0/instances' ] );
  test.identical( onDownPaths, [ '/f1', '/instances/0/f1', '/instances/0/instances', '/instances/0', '/instances', '/' ] );

  test.case = 'mixed cycle - different cycle a'; /* */

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/instances', '/instances/0', '/instances/0/f1', '/instances/0/instances' ] );
  test.identical( onDownPaths, [ '/f1', '/instances/0/f1', '/instances/0/instances', '/instances/0', '/instances', '/' ] );

  test.case = 'mixed cycle - different cycle b'; /* */

  clean();
  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  binstances.push( b );

  var expected = false;
  var got = _.entityIdentical( a, b, opt  );
  test.identical( got, expected );
  test.identical( onUpPaths, [ '/', '/f1', '/instances', '/instances/0' ] );
  test.identical( onDownPaths, [ '/f1', '/instances/0', '/instances', '/' ] );

}

//

function entityEquivalentCycled( test )
{
  var c = this;

  test.case = 'trivial array';

  var expected = true;
  var got = _.entityEquivalent( [ 1,3 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ 1 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ 1,3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityEquivalent( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
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

  var onAtom = function(){};
  var src1 =
  {
    onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom,
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = true;
  var got = _.entityEquivalent( src1, src2 );

  test.identical( got, expected );
  var onAtom = function(){};
  var src1 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }
  var src2 =
  {
    onAtom : function(){},
    name : 'reduceToMagSqr',
    takingArguments : [ 1,3 ],
  }

  var expected = false;
  var got = _.entityEquivalent( src1, src2 );
  test.identical( got, expected );

  /* */

  test.case = 'trivial mixed';

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
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
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'mixed cycle - different cycle a';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  ainstances.push( a );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  var bc1 = { f1 : bf1, instances : binstances };
  binstances.push( bc1 );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

  /* */

  test.case = 'mixed cycle - different cycle b';

  var af1 = [];
  var ainstances = [];
  var a = { f1 : af1, instances : ainstances };
  var ac1 = { f1 : af1, instances : ainstances };
  ainstances.push( ac1 );

  var bf1 = [];
  var binstances = [];
  var b = { f1 : bf1, instances : binstances };
  binstances.push( b );

  var expected = true;
  var got = _.entityEquivalent( a, b );
  test.identical( got, expected );

}

//

function entityContainsCycled( test )
{
  var c = this;

  /* */

  test.case = 'trivial array';

  var expected = true;
  var got = _.entityContains( [ 1,3 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ 1 ], [ 1,3 ] );
  test.identical( got, expected );

  var expected = true;
  var got = _.entityContains( [ 1,3 ], [ 1 ] );
  test.identical( got, expected );

  var expected = false;
  var got = _.entityContains( [ [ 1,2 ] ], [ [ 1,2,3 ] ] );
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

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,3,4 ] }
  var b = { e : [ 1,4,4 ] }
  var expected = false;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { e : [ 1,4,3 ] }
  var b = { e : [ 1,4 ] }
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
  var expected = true;
  var got = _.entityContains( a, b );
  test.identical( got, expected );

  var a = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,3 ] } ] } }
  var b = { a : [ 1 ], b : { c : [ { d : 1, e : [ 1,4 ] } ] } }
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

function _entityEqualLoose( test )
{

  /* default options */

  test.case = 'default options, number';
  var got = _._equal( 1, 1 );
  var expected = true ;
  test.identical( got, expected );

  test.case = 'default options, string';
  var got = _._equal( '123', '123' );
  var expected = true ;
  test.identical( got, expected );

  test.case = 'default options, boolean';
  var got = _._equal( 0, false );
  var expected = false;
  test.identical( got, expected );

  test.case = 'default options, array';
  var got = _._equal( [ 1, 2 ,'3'], [ 1, 2, 3 ] );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'default options, object';
  var src1 = { a : 1, b : 2 , c : { d : 3  }  };
  var src2 = { a : 1, b : 2 , c : { d : 3  }  };
  var got = _._equal( src1, src2 );
  var expected = true ;
  test.identical( got, expected );

  /* strict string - number */

  test.case = 'number & string, strictNumbering : 0, strictTyping : 0';
  var got = _._equal( '123', 123, { strictNumbering : 0, strictTyping : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 0';
  var got = _._equal( '123', 123, { strictNumbering : 1, strictTyping : 0 } );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 0, strictTyping : 1';
  var got = _._equal( '123', 123, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 1';
  var got = _._equal( '123', 123, { strictNumbering : 1, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  /* */

  test.case = 'number & string, strictNumbering : 0, strictTyping : 0';
  var got = _._equal( 123, '123', { strictNumbering : 0, strictTyping : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 0';
  var got = _._equal( 123, '123', { strictNumbering : 1, strictTyping : 0 } );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 0, strictTyping : 1';
  var got = _._equal( 123, '123', { strictNumbering : 0, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'number & string, strictNumbering : 1, strictTyping : 1';
  var got = _._equal( 123, '123', { strictNumbering : 1, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  /* strict bool - number */

  test.case = 'number & boolean, strictNumbering : 0, strictTyping : 0';
  var got = _._equal( false, 0, { strictNumbering : 0, strictTyping : 0 } );
  var expected = true ;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 0, strictTyping : 1';
  var got = _._equal( false, 0, { strictNumbering : 0, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 1, strictTyping : 0';
  var got = _._equal( false, 0, { strictNumbering : 1, strictTyping : 0 } );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'number & boolean, strictNumbering : 1, strictTyping : 1';
  var got = _._equal( false, 0, { strictNumbering : 1, strictTyping : 1 } );
  var expected = false ;
  test.identical( got, expected );

  /* */

  test.case = 'src1 constains elem from src2 ';
  var got = _._equal( { a : 1, b : 2 }, { b : 2 }, { containing : 1 } );
  var expected = true ;
  test.identical( got, expected );

  test.case = 'onNumbersAreEqual';
  function onNumbersAreEqual( a, b ){ return _.entityEquivalent( a, b, { accuracy : 1 } ) };
  var got = _._equal( { a : 1, b : 2 }, { a : 2, b : 2 }, { onNumbersAreEqual } );
  var expected = true ;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowErrorSync( function()
  {
    _._equal( );
  });

  test.case = 'options is not a Object';
  test.shouldThrowErrorSync( function()
  {
    _._equal( 1, 2, 3 );
  });

  test.case = 'extendet options';
  test.shouldThrowErrorSync( function()
  {
    _._equal( 1, 2, { fixed : 1 } );
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

  // strings test

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

  // array tests

  test.case = 'tests two non empty arrays';
  var got = _.entityIdentical( arrX1, arrY1 );
  test.identical( got, true );

  test.case = 'tests two non empty different arrays';
  var got = _.entityIdentical( arrX2, arrY2 );
  test.identical( got, false );

  // object tests

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

function entityContainLoose( test )
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

  let m1 = { a : 1 };
  let m2 = Object.create({ a : 1 });
  debugger;
  test.is( !_.entityIdentical( m1, m2 ) );
  debugger;
  test.is( _.entityEquivalent( m1, m2 ) );

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
text ` +
`

this is
`
;
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
text ` +
`

this is
`
;
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

function entityDiffLoose( test )
{

  // test.identical( got, {} );

  test.case = 'undefined - null'; /* */

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

  test.case = 'null - undefined'; /* */

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

  test.case = 'undefined - undefined'; /* */

  var got = _.entityDiff( undefined, undefined );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null - null'; /* */

  var got = _.entityDiff( null, null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'number'; /* */

  var got = _.entityDiff( 1, 1 );
  var expected = false ;
  test.identical( got, expected );

  test.case = 'strings'; /* */

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

  test.case = 'arrays'; /* */

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

  test.case = 'objects,custom path'; /* */

  var src1 = { a : { a : 1, b : '2' }, b : [ 1,2 ] };
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
    b : [ 1,3 ],
    c : true,
  }
  var src2 =
  {
    f : function(){},
    a : 'reducing',
    b : [ 1,3 ],
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

  test.case = 'argument missed'; /* */
  test.shouldThrowErrorSync( function()
  {
    _.entityDiff( );
  });

  test.case = 'invalid options type'; /* */
  test.shouldThrowErrorSync( function()
  {
    _.entityDiff( 1, 2, 3 );
  });

  debugger;
}

//

function entityDiffExplanation( test )
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

// --
// declare
// --

var Self =
{

  name : 'Tools.base.l6.Equaler',
  silencing : 1,
  enabled : 1,

  context :
  {
  },

  tests :
  {

    trivial,
    entityIdenticalSimple,
    entityContainsSimple,

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

    entityIdenticalCycled,
    entityIdenticalCycledWithOptions,
    entityEquivalentCycled,
    entityContainsCycled,

    entityEqualNonRecursive,

    _entityEqualLoose,
    entityIdenticalLoose,
    entityEquivalentLoose,
    entityContainLoose,
    entityEqualMaps,
    entityEqualStrings,

    entityDiffLoose,
    entityDiffExplanation,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
