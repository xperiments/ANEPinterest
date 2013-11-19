<extension xmlns="http://ns.adobe.com/air/extension/3.7">
	<id>es.xperiments.ane.PinterestANE</id>
	<versionNumber>@majorVersion@.@minorVersion@.@buildNumber@</versionNumber>
		<platforms> 
			<platform name="iPhone-ARM">
				<applicationDeployment>
					<nativeLibrary>libPinterestANE.a</nativeLibrary>
					<initializer>PinterestANEExtensionInitializer</initializer>
					<finalizer>PinterestANEExtensionFinalizer</finalizer>
				</applicationDeployment>
			</platform>
			<platform name="iPhone-x86">
				<applicationDeployment>
					<nativeLibrary>libPinterestANE.a</nativeLibrary>
					<initializer>PinterestANEExtensionInitializer</initializer>
					<finalizer>PinterestANEExtensionFinalizer</finalizer>
				</applicationDeployment>
			</platform>
			<platform name="default"> 
   				<applicationDeployment/>
			</platform>			
	</platforms>
</extension>
			