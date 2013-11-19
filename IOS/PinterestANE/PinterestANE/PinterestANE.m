//
//  PinterestANE.m
//  PinterestANE
//
//  Created by Pedro Casaubon on 12/11/2013.
//  Copyright (c)2013 Pedro Casaubon. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import <Pinterest/Pinterest.h>

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define DISPATCH_STATUS_EVENT(extensionContext, code, status) FREDispatchStatusEventAsync((extensionContext), (uint8_t*)code, (uint8_t*)status)
#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

#define ASSERT_ARGC_IS(fn_name, required)																	\
if(argc != (required))																						\
{																											\
DISPATCH_INTERNAL_ERROR(context, #fn_name ": Wrong number of arguments. Expected exactly " #required);	\
return NULL;																							\
}
#define ASSERT_ARGC_AT_LEAST(fn_name, required)																\
if(argc < (required))																						\
{																											\
DISPATCH_INTERNAL_ERROR(context, #fn_name ": Wrong number of arguments. Expected at least " #required);	\
return NULL;																							\
}


// Pinterest SDK instance
Pinterest* pinterest;


/****************************************************************************************
 *																						*
 *	METHODS BRIDGED																		*
 *																						*
 ****************************************************************************************/





/****************************************************************************************
 * @method:canPinWithSDK( ):Boolean
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( canPinWithSDK )
{
    
    //  return->as3 ( resultFromBoolean as Boolean );
    uint32_t resultFromBoolean= [ pinterest canPinWithSDK ];
    FREObject ane_resultFromBoolean= nil;
    FRENewObjectFromBool(resultFromBoolean, &ane_resultFromBoolean);
    
    return ane_resultFromBoolean;
    
}


/****************************************************************************************
 * @method:createPinWithImageURL( imageURL:String,sourceURL:String,descriptionText:String):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( createPinWithImageURL )
{
    
    //  imageURL:String = argument[0];
    
    uint32_t imageURLLength;
    const uint8_t *imageURL_CString;
    FREGetObjectAsUTF8(argv[0], &imageURLLength, &imageURL_CString);
    NSString *imageURL = [NSString stringWithUTF8String:(char*)imageURL_CString];
    
    
    //  sourceURL:String = argument[1];
    
    uint32_t sourceURLLength;
    const uint8_t *sourceURL_CString;
    FREGetObjectAsUTF8(argv[1], &sourceURLLength, &sourceURL_CString);
    NSString *sourceURL = [NSString stringWithUTF8String:(char*)sourceURL_CString];
    
    
    //  descriptionText:String = argument[2];
    
    uint32_t descriptionTextLength;
    const uint8_t *descriptionText_CString;
    FREGetObjectAsUTF8(argv[2], &descriptionTextLength, &descriptionText_CString);
    NSString *descriptionText = [NSString stringWithUTF8String:(char*)descriptionText_CString];
    
    
    NSURL *imageNSURL = [[[NSURL alloc] initWithString:sourceURL] autorelease];
    NSURL *sourceNSURL = [[[NSURL alloc] initWithString:imageURL] autorelease];
    [pinterest createPinWithImageURL:imageNSURL sourceURL:sourceNSURL description:descriptionText];

    return NULL;
}


/****************************************************************************************
 * @method:initWithClientId( clientId:String):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( initWithClientId )
{
    
    //  clientId:String = argument[0];
    
    uint32_t clientIdLength;
    const uint8_t *clientId_CString;
    FREGetObjectAsUTF8(argv[0], &clientIdLength, &clientId_CString);
    NSString *clientId = [NSString stringWithUTF8String:(char*)clientId_CString];
    
    // Init Pinterest Instance
    pinterest = [[Pinterest alloc] initWithClientId:clientId];
    return NULL;
}


/****************************************************************************************
 * @method:initWithClientIdUrlSuffix( clientId:String,suffix:String):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( initWithClientIdUrlSuffix )
{
    
    //  clientId:String = argument[0];
    
    uint32_t clientIdLength;
    const uint8_t *clientId_CString;
    FREGetObjectAsUTF8(argv[0], &clientIdLength, &clientId_CString);
    NSString *clientId = [NSString stringWithUTF8String:(char*)clientId_CString];
    
    
    //  suffix:String = argument[1];
    
    uint32_t suffixLength;
    const uint8_t *suffix_CString;
    FREGetObjectAsUTF8(argv[1], &suffixLength, &suffix_CString);
    NSString *suffix = [NSString stringWithUTF8String:(char*)suffix_CString];
    
    pinterest = [[Pinterest alloc] initWithClientId:clientId urlSchemeSuffix:suffix];
    return NULL;
}


/****************************************************************************************
 * @method:openBoardWithSlug( slug:String,username:String):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( openBoardWithSlug )
{
    
    //  slug:String = argument[0];
    
    uint32_t slugLength;
    const uint8_t *slug_CString;
    FREGetObjectAsUTF8(argv[0], &slugLength, &slug_CString);
    NSString *slug = [NSString stringWithUTF8String:(char*)slug_CString];
    
    
    //  username:String = argument[1];
    
    uint32_t usernameLength;
    const uint8_t *username_CString;
    FREGetObjectAsUTF8(argv[1], &usernameLength, &username_CString);
    NSString *username = [NSString stringWithUTF8String:(char*)username_CString];
    
    [pinterest openBoardWithSlug:slug fromUser:username];
    return NULL;
}


/****************************************************************************************
 * @method:openPinWithIdentifier( identifier:String):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( openPinWithIdentifier )
{
    
    //  identifier:String = argument[0];
    
    uint32_t identifierLength;
    const uint8_t *identifier_CString;
    FREGetObjectAsUTF8(argv[0], &identifierLength, &identifier_CString);
    NSString *identifier = [NSString stringWithUTF8String:(char*)identifier_CString];
    
    [pinterest openPinWithIdentifier:identifier];
    
    return NULL;
}


/****************************************************************************************
 * @method:openUserWithUsername( slug:String,username:String):void
 ****************************************************************************************/
DEFINE_ANE_FUNCTION( openUserWithUsername )
{
    
    //  username:String = argument[0];
    
    uint32_t usernameLength;
    const uint8_t *username_CString;
    FREGetObjectAsUTF8(argv[0], &usernameLength, &username_CString);
    NSString *username = [NSString stringWithUTF8String:(char*)username_CString];
    
    [pinterest openUserWithUsername:username ];
    return NULL;
}


/****************************************************************************************
 *																						*
 *	EXTENSION & CONTEXT																	*
 *																						*
 ****************************************************************************************/

void PinterestANEContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
{
    static FRENamedFunction functionMap[] = {
        // METHODS
        MAP_FUNCTION( canPinWithSDK, NULL ),
        MAP_FUNCTION( createPinWithImageURL, NULL ),
        MAP_FUNCTION( initWithClientId, NULL ),
        MAP_FUNCTION( initWithClientIdUrlSuffix, NULL ),
        MAP_FUNCTION( openBoardWithSlug, NULL ),
        MAP_FUNCTION( openPinWithIdentifier, NULL ),
        MAP_FUNCTION( openUserWithUsername, NULL )
    };
    *numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
    *functionsToSet = functionMap;
}
void PinterestANEContextFinalizer( FREContext ctx )
{
    NSLog(@"Entering PinterestANEContextFinalizer()");
    NSLog(@"Exiting PinterestANEContextFinalizer()");
    return;
}
void PinterestANEExtensionInitializer( void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet )
{
    NSLog(@"Entering PinterestANEExtensionInitializer()");
    extDataToSet = NULL;  // This example does not use any extension data.
    *ctxInitializerToSet = &PinterestANEContextInitializer;
    *ctxFinalizerToSet = &PinterestANEContextFinalizer;
}
void PinterestANEExtensionFinalizer()
{
    NSLog(@"Entering PinterestANEExtensionFinalizer()");
    return;
}
