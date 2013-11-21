package es.xperiments.ane.pinterest;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ANEPinterestExtension implements FREExtension
{
	
	@Override
	public FREContext createContext(String contextType) {
		// TODO Auto-generated method stub
		return  new ANEPinterestContext().staticInit(); 
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void initialize() {
		// TODO Auto-generated method stub
		
	}

}
