package com.se.ipd;

public class Cooperator extends Strategy{

	public Cooperator() {
		super("COPERATOR");
	}

	@Override
	public Response respond() {
		return Response.COOPERATE;
	}

}
