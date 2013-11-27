package es.xperiments.ane;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;


public class PinterestANE implements FREExtension
{
	
	private static final String TAG = "ANEPinterestExtension";
	public static ANEPinterestContext context;
	@Override
	public FREContext createContext(String contextType) {
		// TODO Auto-generated method stub
		Log.d(TAG, "Extension createContext.");
		return  context = new ANEPinterestContext(); 
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		Log.d(TAG, "Extension dispose.");
		context = null;
	}

	@Override
	public void initialize() {
		// TODO Auto-generated method stub
		Log.d(TAG, "Extension initialized.");
	}

}
