/**
 * Allows one to remove and restore the JsafeJCE provider from the java.security.Security
 * so you're cfhttp requests to SSL enabled sites will work.
 * Only applicable to Coldfusion 9 Enterprise
 * @See http://www.raymondcamden.com/2011/01/12/Diagnosing-a-CFHTTP-issue-peer-not-authenticated
 * @See https://github.com/CreativeNotice/CF_JsafeJCE
 */
component displayname='JsafeJCE Handler' {

	public jsafeJCEHandler function init(){
		variables.SecurityObject = createObject("java", "java.security.Security");
		variables.cacheProvider  = variables.SecurityObject.getProvider("JsafeJCE");
		return this;
	};

	public function disable(){
		variables.SecurityObject.removeProvider('JsafeJCE');
	};

	public function enable(){
		variables.SecurityObject.insertProviderAt( variables.cacheProvider, 1 );
	};
}
