package es.xperiments.ane.pinterest.functions;

import android.content.Context;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.FREObjectUtils;
import es.xperiments.ane.pinterest.ANEPinterestContext;

public class CreatePinWithImageURL implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		// TODO Auto-generated method stub
			
		Context appContext = context.getActivity().getApplicationContext();
		
		FREObject imageURLFRE = 		args[0];
		FREObject sourceURLFRE = 		args[1];
		FREObject descriptionTextFRE = 	args[2];
		
		String imageURL			= FREObjectUtils.getStringFromFREObject(imageURLFRE);
		String sourceURL		= FREObjectUtils.getStringFromFREObject(sourceURLFRE);
		String descriptionText	= FREObjectUtils.getStringFromFREObject(descriptionTextFRE);
		
		PinIt 	pin = ANEPinterestContext.pin;
				pin.setImageUrl(imageURL);
				pin.setUrl(sourceURL);
				pin.setDescription(descriptionText);
				pin.doPinIt(appContext);
		
		return null;
	}

}
