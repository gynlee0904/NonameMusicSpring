package com.nnm.spring.common.domain;

public class Register {
	private String policy;
	private String position;
	
	public Register() {}
	
	

	public Register(String policy, String position) {
		super();
		this.policy = policy;
		this.position = position;
	}


	public String getPolicy() {
		return policy;
	}

	public void setPolicy(String policy) {
		this.policy = policy;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "Register [policy=" + policy + ", position=" + position + "]";
	}
	
	
	
}
