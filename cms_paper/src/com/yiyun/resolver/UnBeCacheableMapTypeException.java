package com.yiyun.resolver;


public class UnBeCacheableMapTypeException extends Exception {
    /**
     * 
     */
    private static final long serialVersionUID = -2371365831487734320L;

    public UnBeCacheableMapTypeException() {
	super("cached 's element must be CacheableMap type");
    }
}
