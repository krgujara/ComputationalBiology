package com.se.ipd;

public class Defector extends Strategy {
	public Defector() {
		super("DEFECTOR");
	}

	@Override
	public Response respond() {
		return Response.DEFECT;
	}

}
