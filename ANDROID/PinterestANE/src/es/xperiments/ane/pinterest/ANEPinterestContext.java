package es.xperiments.ane.pinterest;

import java.util.HashMap;
import java.util.Map;

import android.content.Context;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.pinterest.functions.CanPinWithSDKFunction;
import es.xperiments.ane.pinterest.functions.CreatePinWithImageURL;
import es.xperiments.ane.pinterest.functions.InitWithClientId;
import es.xperiments.ane.pinterest.functions.VoidFunction;

public class ANEPinterestContext extends FREContext {

	public static PinIt pin = new PinIt();
	public static Context anecontext;
	public ANEPinterestContext staticInit( )
	{
		anecontext = this.getActivity().getApplicationContext();
		return this;
	}
	
	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		pin = null;
		anecontext = null;
		
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functions = new HashMap<String, FREFunction>();
	    functions.put("canPinWithSDK", new CanPinWithSDKFunction());
	    functions.put("createPinWithImageURL", new CreatePinWithImageURL());
	    functions.put("initWithClientId", new InitWithClientId());
	    functions.put("initWithClientIdUrlSuffix", new InitWithClientId());
	    functions.put("openBoardWithSlug", new VoidFunction());
	    functions.put("openPinWithIdentifier", new VoidFunction());
	    functions.put("openUserWithUsername", new VoidFunction());
	    return functions;
	}

}
