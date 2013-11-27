package es.xperiments.ane;

import java.util.HashMap;
import java.util.Map;


import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.functions.CanPinWithSDKFunction;
import es.xperiments.ane.functions.CreatePinWithImageURL;
import es.xperiments.ane.functions.InitWithClientId;
//import es.xperiments.ane.functions.VoidFunction;

public class ANEPinterestContext extends FREContext {

	private static final String TAG = "ANEPinterestContext";
	public static PinIt pin = new PinIt();


	
	@Override
	public void dispose() {

        Log.d(TAG, "Entering dispose");
        
		pin = null;
		PinterestANE.context = null;
         
        Log.d(TAG, "Exiting dispose");		
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Log.d(TAG, "ANEPinterestContext MAP.");
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
		map.put("canPinWithSDK", new CanPinWithSDKFunction());
		map.put("createPinWithImageURL", new CreatePinWithImageURL());
		map.put("initWithClientId", new InitWithClientId());
		//map.put("initWithClientIdUrlSuffix", new InitWithClientId());
		//map.put("openBoardWithSlug", new VoidFunction());
		//map.put("openPinWithIdentifier", new VoidFunction());
	    //map.put("openUserWithUsername", new VoidFunction());
	    return map;
	}

}
