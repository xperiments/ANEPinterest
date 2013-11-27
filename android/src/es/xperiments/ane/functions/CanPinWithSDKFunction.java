package es.xperiments.ane.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.pinterest.pinit.PinIt;

import es.xperiments.ane.FREObjectUtils;

public class CanPinWithSDKFunction implements FREFunction
{

	@Override
	public FREObject call(FREContext context, FREObject[] args)
	{
		//Return if the device meets the requirements needed to pin using this library.
		return FREObjectUtils.returnType( PinIt.meetsRequirements() );
	}

}
