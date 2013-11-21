//
//  PinterestANE.as
//
//  Created by Pedro Casaubon on 12/11/2013.
//  Copyright (c)2013 Pedro Casaubon. All rights reserved.
//
package es.xperiments.ane
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;	
	
	public class PinterestANE extends EventDispatcher
	{
		/**
		 * Declare static context
		 */
		private static var __context:ExtensionContext = null;
		private static var _hasID:Boolean = false;
		private static function checkInit():void
		{ 
			if(!_hasID)
			{
				throw new Error("PinterestANE must be initialized with initWithClientId or initWithClientIdUrlSuffix methods");
			}
		}
		/**
		 * PinterestANE Static Constructor / Initializer
		 */

		{
			if ( !__context )
			{
				__context = ExtensionContext.createExtensionContext("es.xperiments.ane.PinterestANE","es.xperiments.ane.PinterestANE");
			}
		}
		
		/**
		* @return Boolean
		*/
		public static function canPinWithSDK( ):Boolean
		{
			checkInit();
			return	__context.call( 'canPinWithSDK') as Boolean;
		};
		
		/**
		* @param imageURL:String
		* @param sourceURL:String
		* @param descriptionText:String
		* @return void
		*/
		public static function createPinWithImageURL( imageURL:String, sourceURL:String, descriptionText:String):void
		{
			checkInit();;
			__context.call( 'createPinWithImageURL', imageURL, sourceURL, descriptionText) ;
		};
		
		/**
		* @param clientId:String
		* @return void
		*/
		public static function initWithClientId( clientId:String = ""):void
		{
			if( clientId=="" ) throw new Error("PinterestANE initWithClientId needs a clientId")
			__context.call( 'initWithClientId',clientId) ;
			_hasID = true;
		};
		
		/**
		* @param clientId:String
		* @param suffix:String
		* @return void
		*/
		public static function initWithClientIdUrlSuffix( clientId:String="", suffix:String="" ):void
		{
			if( clientId=="" || suffix == "") throw new Error("PinterestANE initWithClientId needs a clientId")
			__context.call( 'initWithClientIdUrlSuffix',clientId, suffix) ;
			_hasID = true;
		};
		
		/**
		* @param slug:String
		* @param username:String
		* @return void
		*/
		public static function openBoardWithSlug( slug:String, username:String ):void
		{
			checkInit();
			__context.call( 'openBoardWithSlug',slug, username) ;
		};
		
		/**
		* @param identifier:String
		* @return void
		*/
		public static function openPinWithIdentifier( identifier:String ):void
		{
			checkInit();
			__context.call( 'openPinWithIdentifier',identifier) ;
		};
		
		/**
		* @param username:String
		* @return void
		*/
		public static function openUserWithUsername( username:String ):void
		{
			checkInit();
			__context.call( 'openUserWithUsername',username) ;
		};
		
		
		
		/**
		 * Check if the extension is supported
		 * @return Boolean
		 */
		public static function get isSupported():Boolean
		{

				if( Capabilities.os.indexOf( 'iPhone' ) == -1 && Capabilities.os.indexOf( 'iPad' ) == -1 && Capabilities.os.indexOf( 'iPod' ) == -1 && Capabilities.manufacturer != "Android Linux" ){ return false }

			return true;
		}
		
		/**
		 * Dispose the PinterestANE extension
		 */
		public static function dispose():void
		{
			__context.dispose();
			__context = null;
		}
	}
	
}
