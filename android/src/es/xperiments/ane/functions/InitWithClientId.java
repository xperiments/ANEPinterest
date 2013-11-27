package es.xperiments.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.FREObjectUtils;

public class InitWithClientId implements FREFunction {
 
	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		String partnerId;
		try
		{
			partnerId = args[0].getAsString();
		}
		catch(Exception e)
		{
			return null;
		}

		PinIt.setPartnerId(partnerId);

		return null;
	}

}