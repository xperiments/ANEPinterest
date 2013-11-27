package es.xperiments.ane.functions;

import android.content.Context;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.ANEPinterestContext;
import es.xperiments.ane.FREObjectUtils;

public class CreatePinWithImageURL implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {

		
		
		String imageURL;
		String sourceURL;
		String descriptionText;	
		
		try
		{
			imageURL			= args[0].getAsString();
			sourceURL		= args[1].getAsString();
			descriptionText	= args[2].getAsString();			
		}catch(Exception e)
		{
			return null;
		}

		
		PinIt 	pin = ANEPinterestContext.pin;
				pin.setImageUrl(imageURL);
				pin.setUrl(sourceURL);
				pin.setDescription(descriptionText);
				pin.doPinIt(context.getActivity());
		
		return null;
	}

}
 