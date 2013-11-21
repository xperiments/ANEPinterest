package es.xperiments.ane.pinterest.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.FREObjectUtils;

public class InitWithClientId implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		FREObject partnerIdFRE = args[0];
		String partnerId = FREObjectUtils.getStringFromFREObject(partnerIdFRE);
		PinIt.setPartnerId(partnerId);

		return null;
	}

}