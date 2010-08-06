package com.klstudio.net.http {

	/**
	 * The version of HTTP or its derived protocols
	 * @author Kinglong(kinglong@gmail.com)
	 * @since:2010-8-6
	 */
	public class HttpVersion {
		
		public static const VERSION_PATTERN:RegExp = new RegExp("(\\S+)/(\\d+)\\.(\\d+)"); 
		
		/**
	     * HTTP/1.0
	     */
		public static const HTTP_1_0:HttpVersion = new HttpVersion("http",1,0);
		/**
	     * HTTP/1.1
	     */
		public static const HTTP_1_1:HttpVersion = new HttpVersion("http",1,1);
		
		public static function valueOf(text:String):HttpVersion{
			if(text == null) {
				throw new Error("text is null!");
			}
			text = trim(text);
			if(text.length == 0) {
				throw new  Error("text is empty!");
			}
			switch(text.toUpperCase()){
				case "HTTP/1.1":
					return HTTP_1_1;					
				case "HTTP/1.0":
					return HTTP_1_0;
				default:					
					var arr:Array = text.match(VERSION_PATTERN);
					if(arr == null){
						throw new Error("invalid version format:"+text);
					}
					return 	new HttpVersion(arr[1],uint(arr[2]),uint(arr[3]));
			}
		}
		
		private static function trim(str:String):String{
			if(str == null && str.length == 0){
				return str;
			}
			return str.replace(/(^\s*)|(\s*$)/g,"");   
		}
		
		private var _protocolName:String;
		private var _majorVersion:uint;
		private var _minorVersion:uint;
		private var _text:String;
				
		public function HttpVersion(protocolName:String,majorVersion:uint,minorVersion:uint) {
			if(protocolName == null) {
				throw new Error("protocolName is null!");
			}
			_protocolName = trim(protocolName).toUpperCase();
			if(protocolName.length == 0) {
				throw new Error("protocolName is empty!");
			}			
			_majorVersion = majorVersion;
			_minorVersion = minorVersion;
			_text = protocolName + '/' + majorVersion + '.' + minorVersion;
		}
		
		public function get protocolName():String{
			return _protocolName;
		}
		
		public function get majorVersion():uint{
			return _majorVersion;
		}
		
		public function get minorVersion():uint{
			return _minorVersion;
		}
		
		public function get text():String{
			return _text;
		}
		
		public function toString():String{
			return text;
		}	
	}
}